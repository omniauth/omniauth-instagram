require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Instagram < OmniAuth::Strategies::OAuth2
      option :client_options,         site: 'https://api.instagram.com',
                                      authorize_url: 'https://api.instagram.com/oauth/authorize',
                                      token_url: 'https://api.instagram.com/oauth/access_token'

      def callback_url
        full_host + script_name + callback_path
      end

      def request_phase
        options[:scope] ||= 'basic'
        options[:response_type] ||= 'code'
        options[:enforce_signed_requests] ||= false
        options[:extra_data] ||= false
        super
      end

      uid { raw_info['id'] }

      info do
        {
          'nickname' => raw_info['username'],
          'name'     => raw_info['full_name'],
          'image'    => raw_info['profile_picture'],
          'bio'      => raw_info['bio'],
          'website'  => raw_info['website'],
          'is_business' => raw_info['is_business']
        }
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info
        hash
      end

      def raw_info
        if options[:extra_data]
          endpoint = '/users/self'
          params = {}
          access_token.options[:mode] = :query
          access_token.options[:param_name] = 'access_token'
          params['sig'] = generate_sig(endpoint, 'access_token' => access_token.token) if options[:enforce_signed_requests]
          @data ||= access_token.get("/v1#{endpoint}", params: params).parsed['data'] || {}
        else
          @data ||= access_token.params['user']
        end
        @data
      end

      # You can pass +scope+ params to the auth request, if you need to set them dynamically.
      # You can also set these options in the OmniAuth config :authorize_params option.
      #
      # For example: /auth/instagram?scope=likes+photos
      def authorize_params
        super.tap do |params|
          %w[scope].each do |v|
            params[v.to_sym] = request.params[v] if request.params[v]
            if params[v.to_sym]
              params[v.to_sym] = Array(params[v.to_sym]).join(' ')
            end
          end
        end
      end

      def generate_sig(endpoint, params)
        require 'openssl'
        require 'base64'
        sig = endpoint
        secret = options[:client_secret]
        params.sort.map do |key, val|
          sig += '|%s=%s' % [key, val]
        end
        digest = OpenSSL::Digest.new('sha256')
        OpenSSL::HMAC.hexdigest(digest, secret, sig)
      end
    end
  end
end

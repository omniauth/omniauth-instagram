require 'spec_helper'

describe OmniAuth::Strategies::Instagram do
  context 'client options' do
    subject do
      OmniAuth::Strategies::Instagram.new({})
    end

    it 'should have the correct site' do
      expect(subject.options.client_options.site).to eq('https://api.instagram.com')
    end

    it 'should have the correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://api.instagram.com/oauth/authorize')
    end

    it 'should have the correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://api.instagram.com/oauth/access_token')
    end
  end
end

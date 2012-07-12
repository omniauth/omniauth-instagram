require 'spec_helper'

describe OmniAuth::Strategies::Instagram do
  context "client options" do
    subject do
      OmniAuth::Strategies::Instagram.new({})
    end

    it "should have the correct site" do
      subject.options.client_options.site.should eq('https://api.instagram.com')
    end

    it "should have the correct authorize url" do
      subject.options.client_options.authorize_url.should eq('https://api.instagram.com/oauth/authorize')
    end

    it "should have the correct token url" do
      subject.options.client_options.token_url.should eq('https://api.instagram.com/oauth/access_token')
    end
  end
end

require 'spec_helper'

describe OmniAuth::Strategies::Instagram do
  context "client options" do
    subject do
      OmniAuth::Strategies::Instagram.new({})
    end

    it "should have the correct site" do
      expect(subject.options.client_options.site).to eq('https://api.instagram.com')
    end

    it "should have the correct authorize url" do
      expect(subject.options.client_options.authorize_url).to eq('https://api.instagram.com/oauth/authorize')
    end

    it "should have the correct token url" do
      expect(subject.options.client_options.token_url).to eq('https://api.instagram.com/oauth/access_token')
    end
  end

  describe "callback url" do

    let(:omniauth_strategy) { OmniAuth::Strategies::Instagram.new({}, options) }

    subject { omniauth_strategy.callback_url }

    context "with callback url" do

      let(:options) { {callback_url: "https://example.com/auth/callback"} }

      it "uses passed callback_url" do
        expect(subject).to eq(options[:callback_url])
      end
    end

    context "without callback url" do

      let(:options) { {} }

      before do
        omniauth_strategy.instance_variable_set("@env", {})
        omniauth_strategy.should_receive(:full_host).and_return("http://www.example.com")
      end

      it "does not set callback url" do
        expect(subject).to eq("http://www.example.com/auth/instagram/callback")
      end
    end
  end
end

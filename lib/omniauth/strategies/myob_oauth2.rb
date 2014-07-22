require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class MyobOauth2 < OmniAuth::Strategies::OAuth2
      
      option :name, 'myob_oauth2'

      option :scope, 'Account'
      option :token_method, :post

      option :client_options, {
        :site          => 'https://secure.myob.com',
        :authorize_url => 'oauth2/account/authorize',
        :token_url => '/oauth2/v1/Authorize',
      }

      uid { raw_info['uid'] }

      info do
        {
          :email => raw_info['username']
        }
      end

       extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token['user']
      end

    end
  end
end
require "omniauth"
require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Sentry < OmniAuth::Strategies::OAuth2
      option :client_options, {
        authorize_url: "https://sentry.io/oauth/authorize/",
        token_url: "https://sentry.io/oauth/token/"
      }

      uid do
        info.fetch(:id)
      end

      info do
        @info ||= deep_symbolize(access_token["user"])
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

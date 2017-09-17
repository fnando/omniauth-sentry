require "test_helper"

class ClientOptionsTest < Minitest::Test
  let(:app) { -> env {} }

  let(:strategy) do
    OmniAuth::Strategies::Sentry.new(app, "consumer_id", "consumer_secret")
  end

  test "sets name" do
    assert_equal "sentry", strategy.options.name
  end

  test "sets authorize url" do
    assert_equal "https://sentry.io/oauth/authorize/", strategy.options.client_options.authorize_url
  end

  test "sets token url" do
    assert_equal "https://sentry.io/oauth/token/", strategy.options.client_options.token_url
  end
end

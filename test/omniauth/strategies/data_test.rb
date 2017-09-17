require "test_helper"

class DataTest < Minitest::Test
  let(:app) { -> env {} }

  let(:strategy) do
    OmniAuth::Strategies::Sentry.new(app, "consumer_id", "consumer_secret")
  end

  test "returns uid" do
    strategy.stubs(:info).returns({id: "ID"})
    assert_equal "ID", strategy.uid
  end

  test "returns info" do
    access_token = {"user" => {"id" => "ID", "name" => "NAME"}}
    strategy.stubs(:access_token).returns(access_token)

    info = strategy.info

    assert_equal "ID", info[:id]
    assert_equal "NAME", info[:name]
  end
end

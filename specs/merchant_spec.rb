require "minitest/autorun"
require "minitest/rg"
require_relative "../models/merchant"

class TestMerchant < MiniTest::Test
  def setup
    params = { "name" => "Tesco" }
    @merchant1 = Merchant.new( params )
  end

  def test_name
    expectation = "Tesco"
    result = @merchant1.name
    assert_equal( expectation, result )
  end
end
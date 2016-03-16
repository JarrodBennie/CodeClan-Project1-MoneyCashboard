require "minitest/autorun"
require "minitest/rg"
require_relative "../models/merchant"

class TestMerchant < MiniTest::Test
  def setup
    params = { "name" => "Tesco" }
    @merchant = Merchant.new( params )
  end

  def test_name
    assert_equal( "Tesco", @merchant.name )
  end
end
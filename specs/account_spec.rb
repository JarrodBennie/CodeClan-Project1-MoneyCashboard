require "minitest/autorun"
require "minitest/rg"
require_relative "../models/account"

class TestAccount < MiniTest::Test
  def setup
    merchant1 = Merchant.new( "name" => "Tesco" )
    @merchants = [ merchant1 ]

    transaction1 = Transaction.new( "amount" => 100, "transaction_date" => "2016-03-11" )
    @transactions = [ transaction1 ]

    tag1 = Tag.new( "name" => "Groceries" )
    @tags = [ tag1 ]
  end

  def test_transaction_amount
    expectation = 100
    result = @transactions[ 0 ].amount
    assert_equal( expectation, result )
  end

  def test_transaction_date
    expectation = "2016-03-11"
    result = @transactions[ 0 ].transaction_date
    assert_equal( expectation, result )
  end

  def test_merchant_name
    expectation = "Tesco"
    result = @merchants[ 0 ].name
    assert_equal( expectation, result )
  end

  def test_tag_name
    expectation = "Groceries"
    result = @tags[ 0 ].name
    assert_equal( expectation, result )
  end
end
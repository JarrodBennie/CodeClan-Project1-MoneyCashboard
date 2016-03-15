require "minitest/autorun"
require "minitest/rg"
require_relative "../models/transaction"

class TestTransaction < MiniTest::Test
  def setup
    params = { "amount" => 100, "transaction_date" => "2016-03-11" }
    @transaction1 = Transaction.new( params )
  end

  def test_amount
    expectation = 100
    result = @transaction1.amount
    assert_equal( expectation, result )
  end

  def test_date
    expectation = "2016-03-11"
    result = @transaction1.transaction_date
    assert_equal( expectation, result )
  end
end
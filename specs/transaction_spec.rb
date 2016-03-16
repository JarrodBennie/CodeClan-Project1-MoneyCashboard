require "minitest/autorun"
require "minitest/rg"
require_relative "../models/transaction"

class TestTransaction < MiniTest::Test
  def setup
    params = { "amount" => 99.90, "transaction_date" => "2016-03-11" }
    @transaction = Transaction.new( params )
  end

  def test_amount
    assert_equal( 99.90, @transaction.amount )
  end

  def test_date
    assert_equal( "2016-03-11", @transaction.transaction_date )
  end

  def test_date_format
    assert_equal( "11/03/2016", @transaction.date_format )
  end

  def test_amount_format
    assert_equal( "99.90", @transaction.amount_format )
  end
end
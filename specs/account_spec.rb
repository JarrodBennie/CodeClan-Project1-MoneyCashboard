require "minitest/autorun"
require "minitest/rg"
require_relative "../models/account"

class TestAccount < MiniTest::Test
  def setup
    merchant1 = Merchant.new( "id" => 1,"name" => "Tesco" )
    merchants = [ merchant1 ]

    tag1 = Tag.new( "id" => 1, "name" => "Groceries" )
    tags = [ tag1 ]

    transaction1 = Transaction.new( "merchant_id" => 1, "tag_id" => 1, "amount" => 100, "transaction_date" => "2016-03-11" )
    transactions = [ transaction1 ]

    params = { "transactions" => transactions, "merchants" => merchants, "tags" => tags }
    @account = Account.new( params )
  end

  def test_transaction_amount
    assert_equal( 100, @account.transactions[ 0 ].amount )
  end

  def test_transaction_date
    assert_equal( "2016-03-11", @account.transactions[ 0 ].transaction_date )
  end

  def test_merchant_name
    assert_equal( "Tesco", @account.merchants[ 0 ].name )
  end

  def test_tag_name
    assert_equal( "Groceries", @account.tags[ 0 ].name )
  end

  def test_total
    assert_equal(( sprintf "%0.2f", 100.00 ), @account.total )
  end

  def test_merchant_total
    assert_equal(( sprintf "%0.2f", 100.00 ), @account.merchant_total( 1 ))
  end

  def test_tag_total
    assert_equal(( sprintf "%0.2f", 100.00 ), @account.tag_total( 1 ))
  end
end
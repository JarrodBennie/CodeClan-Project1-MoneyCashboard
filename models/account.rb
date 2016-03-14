require_relative "transaction"
require_relative "merchant"
require_relative "tag"

class Account
  attr_reader :transactions, :merchants, :tags

  def initialize( params )
    @transactions = params[ "transactions" ]
    @merchants = params[ "merchants" ]
    @tags = params[ "tags" ]
  end

  def total
    result = 0
    @transactions.each { |t| result += t.amount }
    return result
  end
end
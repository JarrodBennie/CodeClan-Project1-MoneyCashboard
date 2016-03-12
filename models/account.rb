require_relative "transaction"
require_relative "merchant"
require_relative "tag"

class Account
  attr_reader :id, :merchants, :transactions, :tags

  def initialize( params )
    @id = nil || params[ "id" ]
    @transactions = params[ "transactions" ]
    @merchants = params[ "merchants" ]
    @tags = params[ "tags" ]
  end


end
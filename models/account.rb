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
    return sprintf "%.2f", result
  end

  def merchant_total( merchant_id )
    result = 0
    @transactions.each { |t| if t.merchant_id == merchant_id then result += t.amount end }
    return sprintf "%.2f", result
  end

  def tag_total( tag_id )
    result = 0
    @transactions.each { |t| if t.tag_id == tag_id then result += t.amount end }
    return sprintf "%.2f", result
  end

  def top_merchant
    hash = {}
    @merchants.each { |m| hash[ m.name ] = merchant_total( m.id )}
    return hash.max_by{ |k,v| v }
  end

  def top_tag
    hash = {}
    @tags.each { |t|  hash[ t.name ] = tag_total( t.id )}
    return hash.max_by{ |k,v| v }
  end  

  def display_as_json
    result = {}
    nested = {}
    counter = 1

    for transaction in @transactions
      nested[ "amount" ] = transaction.amount
      nested[ "date" ] = transaction.transaction_date
      
      @merchants.each { |m| if transaction.merchant_id == m.id then nested[ "merchant" ] = m.name end }
      @tags.each { |t| if transaction.tag_id == t.id then nested[ "tag" ] = t.name end }
      
      result[ "transaction #{ counter }" ] = nested

      counter += 1
      nested = {}
    end
    return result
  end

end
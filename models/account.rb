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

  def merchant_number( merchant_id )
    result = []
    @transactions.each { |t| if t.merchant_id == merchant_id then result << t.id end }
    return result.size
  end

  def tag_number( tag_id )
    result = []
    @transactions.each { |t| if t.tag_id == tag_id then result << t.id end }
    return result.size
  end

  def top_merchant
    result = {}
    @merchants.each { |m| result[ m.name ] = merchant_total( m.id ).to_f }
    return result.max_by{ |k, v| v }
  end

  def top_merchant_format
    return sprintf "%.2f", top_merchant[ 1 ]
  end

  def top_tag
    result = {}
    @tags.each { |t|  result[ t.name ] = tag_total( t.id ).to_f }
    return result.max_by{ |k, v| v }
  end

  def top_tag_format
    return sprintf "%.2f", top_tag[ 1 ]
  end

  def tag_progress( tag_id )
    result = 0
    for tag in @tags
      if tag.id == tag_id 
        result = tag.monthly_budget - tag_total( tag.id ).to_f 
      end
    end
      return sprintf "%.2f", result
  end

  def budget_total
    result = 0
    @tags.each { |t| result += t.monthly_budget }
    return result
  end

  def transactions_as_json
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

  def merchants_as_json
    result = {}
    nested = {}
    counter = 1

    for merchant in @merchants
      nested[ "id" ] = merchant.id
      nested[ "name" ] = merchant.name

      result[ "merchant #{ counter }" ] = nested

      counter += 1
      nested = {}
    end
    return result
  end

  def tags_as_json
    result = {}
    nested = {}
    counter = 1

    for tag in @tags
      nested[ "id" ] = tag.id
      nested[ "name" ] = tag.name

      result[ "tag #{ counter }" ] = nested

      counter += 1
      nested = {}
    end
    return result
  end
end
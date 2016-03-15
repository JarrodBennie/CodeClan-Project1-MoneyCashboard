require_relative "../db/sql_runner"
class Transaction
  attr_reader :id, :merchant_id, :tag_id, :amount, :transaction_date

  def initialize( params )
    @id = nil || params[ "id" ].to_i
    @merchant_id = nil || params[ "merchant_id" ].to_i
    @tag_id = nil || params[ "tag_id" ].to_i
    @amount = params[ "amount" ].to_i
    @transaction_date = params[ "transaction_date" ]
  end

  def self.find( id )
   sql = "SELECT * FROM Transactions WHERE id = #{ id.to_i }"
   result = SqlRunner.execute( sql )
   return Transaction.new( result[ 0 ] )
  end

  def self.all
    query = "SELECT * FROM Transactions"
    transactions = SqlRunner.execute( query )
    return transactions.map { |t| Transaction.new( t )}
  end

  def self.create( params )
    query = "INSERT INTO Transactions ( amount, transaction_date, merchant_id, tag_id )
    VALUES (
      #{ params[ "amount" ]},
      '#{ params[ "transaction_date" ]}',
      #{ params[ "merchant_id" ]},
      #{ params[ "tag_id" ]}
    )"

    SqlRunner.execute( query )
    return Transaction.new( Transaction.last_entry )
  end

  def update
    query = "UPDATE Transactions SET amount = #{ @amount }, transaction_date = '#{ @transaction_date }' WHERE id = #{ @id }"
    return SqlRunner.execute( query )
  end

  def self.last_entry
    query = "SELECT * FROM Transactions ORDER BY id DESC limit 1;"
    return SqlRunner.execute( query )[ 0 ]
  end

  def self.delete_all 
    query = "DELETE FROM Transactions"
    SqlRunner.execute( query )
  end
end
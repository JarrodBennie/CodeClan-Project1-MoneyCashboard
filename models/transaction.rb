require "time"
require_relative "../db/sql_runner"

class Transaction
  attr_reader :id, :amount, :date

  def initialize( params )
    @id = nil || params[ "id" ]
    @amount = params[ "amount" ]
    @date = params[ "date" ]
  end

  def self.all
    query = "SELECT * FROM Transactions"
    transactions = SqlRunner.execute( query )
    return transactions.map { |t| Transaction.new( t )}
  end

  def self.create( params )
    query = "INSERT INTO Transactions (
      amount,
      date
    ) VALUES (
      #{ params[ "amount" ]},
      #{ params[ "date" ]}
    )"

    SqlRunner.execute( query )
    return Transaction.new( Transaction.last_entry )
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
require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/account"

get "/transactions" do
  if params[ :filter ] == "month"
    options = { "transactions" => Transaction.find_this_month, "merchants" => Merchant.all, "tags" => Tag.all }
  else
    options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  end
  @account = Account.new( options )
  if @account.transactions.size == 0
    erb :"/transactions/empty"
  else
    erb :"/transactions/index"
  end
end

get "/transactions/new" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/transactions/new"
end

get "/transactions/:id" do
  @transaction = Transaction.find( params[ :id ])
  erb :"/transactions/show"
end

post "/transactions" do
  @transaction = Transaction.create( params )
  redirect to "/transactions"
end

get "/transactions/:id/edit" do
  @transaction = Transaction.find( params[ :id ])
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/transactions/edit"
end

post "/transactions/:id" do
  @transaction = Transaction.new( params )
  @transaction.update
  redirect to "/transactions"
end

post "/transactions/:id/delete" do
  Transaction.destroy( params[ :id ])
  redirect to "/transactions"
end
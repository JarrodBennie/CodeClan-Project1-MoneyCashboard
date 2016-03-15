require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/account"

get "/transaction" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/transaction/index"
end

get "/transaction/:id" do
  @transaction = Transaction.find( params[ :id ] )
  erb :"/transaction/show"
end

get "/transaction/new" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/transaction/new"
end

post "/transaction" do
  @transaction = Transaction.create( params )
  redirect to "/transaction"
end

get "/transaction/:id/edit" do
  @transaction = Transaction.find( params[ :id ])
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/transaction/edit"
end

post "/transaction/:id" do
  @transaction = Transaction.new( params )
  @transaction.update
  redirect to "/transaction"
end
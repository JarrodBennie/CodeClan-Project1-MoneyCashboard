require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/account"
require( 'json' )

get "/transactions" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/transactions/index"
end

get "/transactions/new" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/transactions/new"
end

get "/transactions/:id" do
  @transaction = Transaction.find( params[ :id ] )
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
  Transaction.destroy( params[ :id ] )
  redirect to "/transactions"
end
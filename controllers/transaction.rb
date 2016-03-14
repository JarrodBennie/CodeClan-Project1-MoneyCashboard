require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/account"

get "/transaction" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :index
end

get "/transaction/new" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :new
end

post "/transaction" do
  @transaction = Transaction.create( params )
  redirect to "/transaction"
end

get "/transaction/:id/edit" do
  @transaction = Transaction.find( params[ :id ])
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :edit
end

post "transaction/:id" do
  @transaction = Transaction.create( params )
  redirect to "/transaction"
end
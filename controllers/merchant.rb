require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/account"

get "/merchant" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/merchant/index"
end

get "/merchant/new" do
  erb :"/merchant/new"
end

get "/merchant/:id" do
  @merchant = Merchant.find( params[ :id ])  
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/merchant/show"
end

post "/merchant" do
  @merchant = Merchant.create( params )
  redirect to "/merchant"
end

get "/merchant/:id/edit" do
  @merchant = Merchant.find( params[ :id ])
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/merchant/edit"
end

post "/merchant/:id" do
  @merchant = Merchant.new( params )
  @merchant.update
  redirect to "/merchant"
end
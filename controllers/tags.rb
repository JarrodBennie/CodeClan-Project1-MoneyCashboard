require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/account"

get "/tags" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/tags/index"
end

get "/tags/new" do
  erb :"/tags/new"
end

get "/tags/:id" do
  @tag = Tag.find( params[ :id ])  
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/tags/show"
end

post "/tags" do
  @tag = Tag.create( params )
  redirect to "/tags"
end

get "/tags/:id/edit" do
  @tag = Tag.find( params[ :id ])
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/tags/edit"
end

post "/tags/:id" do
  @tag = Tag.new( params )
  @tag.update
  redirect to "/tags"
end
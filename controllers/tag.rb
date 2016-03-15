require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/account"

get "/tag" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/tag/index"
end

get "/tag/new" do
  erb :"/tag/new"
end

get "/tag/:id" do
  @tag = Tag.find( params[ :id ])  
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/tag/show"
end

post "/tag" do
  @tag = Tag.create( params )
  redirect to "/tag"
end

get "/tag/:id/edit" do
  @tag = Tag.find( params[ :id ])
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  erb :"/tag/edit"
end

post "/tag/:id" do
  @tag = Tag.new( params )
  @tag.update
  redirect to "/tag"
end

delete "/tag/:id" do
  Tag.destroy( params[ :id ] )
  redirect to "/tag"
end
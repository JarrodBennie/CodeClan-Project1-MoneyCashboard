require "sinatra"
require "sinatra/contrib/all"
require "json"
require_relative "../../models/account"

get "/api/tags" do
  content_type :json
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  return @account.tags_as_json.to_json
end

post "/api/tags" do 
  content_type :json
  @tag = Tag.create( params )
  return Hash[ response: "Post successful!" ].merge(params).to_json
end
require "sinatra"
require "sinatra/contrib/all"
require "json"
require_relative "../../models/account"

get "/api/merchants" do
  content_type :json
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  return @account.merchants_to_json.to_json
end

post "/api/merchants" do 
  content_type :json
  @merchant = Merchant.create( params )
  return Hash[ response: "Post successful!" ].merge(params).to_json
end
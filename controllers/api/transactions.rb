require "sinatra"
require "sinatra/contrib/all"
require "json"
require_relative "../../models/account"

get "/api/transactions" do
  content_type :json
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  return @account.display_as_json.to_json
end

post "/api/transactions" do 
  content_type :json
  @transaction = Transaction.create( params )
  return Hash[ response: "Post successful!" ].merge(params).to_json
end
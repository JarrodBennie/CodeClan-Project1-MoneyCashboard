require "sinatra"
require "sinatra/contrib/all"
require "json"
require_relative "../../models/account"

get "/api/transactions" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  
  content_type :json
  @account.display_as_json.to_json
end

get "/api/transactions/:id" do 

end 

post "/api/transactions" do 
  content_type :json
  @transaction = Transaction.create( params )
  return { response: "Success" }.to_json
end
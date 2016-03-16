require "sinatra"
require "sinatra/contrib/all"
require "json"
require_relative "../../models/account"

post "/api/merchants" do 
  content_type :json
  @merchant = Merchant.create( params )
  return { response: "Post successful!" }.to_json
end
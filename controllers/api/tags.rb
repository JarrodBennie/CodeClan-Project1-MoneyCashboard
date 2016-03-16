require "sinatra"
require "sinatra/contrib/all"
require "json"
require_relative "../../models/account"

post "/api/tags" do 
  content_type :json
  @tag = Tag.create( params )
  return { response: "Post successful!" }.to_json
end
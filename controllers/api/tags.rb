require "sinatra"
require "sinatra/contrib/all"
require "json"
require_relative "../../models/account"

post "/api/tags" do 
  content_type :json
  @tag = Tag.create( params )
  return Hash[ response: "Post successful!" ].merge(params).to_json
end
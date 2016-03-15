require "sinatra"
require "sinatra/contrib/all"
require_relative "controllers/transactions"
require_relative "controllers/merchants"
require_relative "controllers/tags"
require_relative "controllers/api/transactions"

get "/" do
  erb :home
end
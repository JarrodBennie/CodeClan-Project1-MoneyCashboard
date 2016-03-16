require "sinatra"
require "sinatra/contrib/all"
require_relative "controllers/api/transactions"
require_relative "controllers/api/merchants"
require_relative "controllers/api/tags"
require_relative "controllers/transactions"
require_relative "controllers/merchants"
require_relative "controllers/tags"

get "/" do
  erb :home
end
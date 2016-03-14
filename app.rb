require "sinatra"
require "sinatra/contrib/all"
require_relative "controllers/transaction"
require_relative "controllers/merchant"
require_relative "controllers/tag"

get "/" do
  erb :home
end
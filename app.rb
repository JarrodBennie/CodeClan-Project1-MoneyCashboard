require "sinatra"
require "sinatra/contrib/all"
require_relative "controllers/transaction"
require_relative "controllers/merchant"
require_relative "controllers/tag"
require_relative "controllers/api/transactions"

get "/" do
  erb :home
end
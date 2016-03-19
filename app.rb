require "sinatra"
require "sinatra/contrib/all"
require_relative "controllers/api/transactions"
require_relative "controllers/api/merchants"
require_relative "controllers/api/tags"
require_relative "controllers/transactions"
require_relative "controllers/merchants"
require_relative "controllers/tags"

get "/" do
  options = { "transactions" => Transaction.all, "merchants" => Merchant.all, "tags" => Tag.all }
  @account = Account.new( options )
  if @account.merchants.size or @account.tags.size == 0
    erb :home_new_user
  elsif 
    @account.transactions.size == 0
    erb :home_no_transactions
  else
    erb :home
  end
end

not_found do
  status 404
  erb :"errors/404"
end
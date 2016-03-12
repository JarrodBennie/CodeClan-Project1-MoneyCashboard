require_relative "../models/transactions"
require_relative "../models/merchant"
require_relative "../models/tag"

Transaction.delete_all
Merchant.delete_all
Tag.delete_all

transaction1 = Transaction.create( "amount" => 100, "date" => Date.new( 11, 03, 2016 ))
transaction2 = Transaction.create( "amount" => 75, "date" => Date.new( 11, 03, 2016 ))
transaction3 = Transaction.create( "amount" => 25, "date" => Date.new( 11, 03, 2016 ))
transaction4 = Transaction.create( "amount" => 100, "date" => Date.new( 11, 03, 2016 ))
transaction5 = Transaction.create( "amount" => 10, "date" => Date.new( 11, 03, 2016 ))

merchant1 = Merchant.create( "name" => "Tesco" )
merchant2 = Merchant.create( "name" => "nPower" )
merchant3 = Merchant.create( "name" => "National Rail" )
merchant4 = Merchant.create( "name"=> "TravelLodge" )
merchant5 = Merchant.create( "name" => "Boots" )

tag1 = Tag.create( "name" => "Groceries" )
tag2 = Tag.create( "name" => "Utilities" )
tag3 = Tag.create( "name" => "Travel" )
tag4 = Tag.create( "name" => "Business" )
tag5 = Tag.create( "name" => "Medical" )


require_relative "../models/account"

Transaction.delete_all
Merchant.delete_all
Tag.delete_all

merchant1 = Merchant.create( "name" => "Tesco" )
merchant2 = Merchant.create( "name" => "Scottish Power" )
merchant3 = Merchant.create( "name" => "Clouds Property Management" )
merchant4 = Merchant.create( "name"=> "Edinburgh City Council" )
merchant5 = Merchant.create( "name" => "Dominos Pizza" )
merchant6 = Merchant.create( "name" => "CodeClan" )
merchant7 = Merchant.create( "name" => "Waitrose" )
merchant8 = Merchant.create( "name" => "Real Foods" )

tag1 = Tag.create( "name" => "Groceries", "monthly_budget" => 250.00 )
tag2 = Tag.create( "name" => "Utilities", "monthly_budget" => 750.00 )
tag3 = Tag.create( "name" => "Travel", "monthly_budget" => 100.00 )
tag4 = Tag.create( "name" => "Food", "monthly_budget" => 50.00 )
tag5 = Tag.create( "name" => "Education", "monthly_budget" => 1000.00 )

transaction1 = Transaction.create(
  "amount" => 103.27,
  "transaction_date" => "14-March-16",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
)

transaction2 = Transaction.create(
  "amount" => 75.50,
  "transaction_date" => "13-March-16",
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id
)

transaction3 = Transaction.create(
  "amount" => 450.00,
  "transaction_date" => "10-March-16",
  "merchant_id" => merchant3.id,
  "tag_id" => tag2.id
)

transaction4 = Transaction.create(
  "amount" => 62.50,
  "transaction_date" => "7-March-16",
  "merchant_id" => merchant4.id,
  "tag_id" => tag2.id
)

transaction5 = Transaction.create(
  "amount" => 1500,
  "transaction_date" => "14-February-16",
  "merchant_id" => merchant6.id,
  "tag_id" => tag5.id
)

transaction6 = Transaction.create(
  "amount" => 24.99,
  "transaction_date" => "11-March-16",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
)

transaction7 = Transaction.create(
  "amount" => 18.51,
  "transaction_date" => "7-March-16",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
)

transaction8 = Transaction.create(
 "amount" => 1000,
 "transaction_date" => "11-March-16",
 "merchant_id" => merchant6.id,
 "tag_id" => tag5.id
)

transaction9 = Transaction.create(
  "amount" => 26.91,
  "transaction_date" => "28-February-16",
  "merchant_id" => merchant7.id,
  "tag_id" => tag1.id
)

transaction10 = Transaction.create(
  "amount" => 41.60,
  "transaction_date" => "22-February-16",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
)

transaction11 = Transaction.create(
  "amount" => 4.28,
  "transaction_date" => "23-February-16",
  "merchant_id" => merchant8.id,
  "tag_id" => tag1.id
)

transaction12 = Transaction.create(
  "amount" => 4.28,
  "transaction_date" => "17-March-16",
  "merchant_id" => merchant8.id,
  "tag_id" => tag1.id
)

transaction13 = Transaction.create(
  "amount" => 22.50,
  "transaction_date" => "19-March-16",
  "merchant_id" => merchant5.id,
  "tag_id" => tag4.id
)

transaction14 = Transaction.create(
  "amount" => 22.50,
  "transaction_date" => "4-March-16",
  "merchant_id" => merchant5.id,
  "tag_id" => tag4.id
)

transaction15 = Transaction.create(
  "amount" => 22.50,
  "transaction_date" => "12-February-16",
  "merchant_id" => merchant5.id,
  "tag_id" => tag4.id
)
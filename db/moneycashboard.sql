DROP TABLE Transactions;
DROP TABLE Merchants;
DROP TABLE Tags;

CREATE TABLE Merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE Tags (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE Transactions (
  id SERIAL8 PRIMARY KEY,
  amount FLOAT8,
  transaction_date date,
  merchant_id INT8 REFERENCES Merchants( id ),
  tag_id INT8 REFERENCES Tags( id )
);
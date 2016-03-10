DROP TABLE Transactions;
DROP TABLE Merchants;
DROP TABLE Tags;

CREATE TABLE Transactions (
  id SERIAL8 PRIMARY KEY
  amount VARCHAR(255)
  transaction_date VARCHAR(255)
  merchant_id INT8 REFERENCES Merchants(id)
  tag_id INT8 REFERENCES Tags(id)
);

CREATE TABLE Merchants (
  id SERIAL8 PRIMARY KEY
  merchant VARCHAR(255)
);

CREATE TABLE Tags (
  id SERIAL8 PRIMARY KEY
  tag VARCHAR(255)
);
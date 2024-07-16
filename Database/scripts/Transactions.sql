CREATE TABLE Transactions (
	transaction_id int AUTO_INCREMENT,
	envelope_id int NOT NULL,
	sub_envelope_id int NOT NULL,
	transaction_date date NOT NULL,
	transaction_amount double NOT NULL,
	notes varchar(250),
	transaction_type varchar(10) NOT NULL,
	account_id int NOT NULL,
	from_envelope_id int NOT NULL,
	is_transfer bool NOT NULL DEFAULT 0,
	PRIMARY KEY(transaction_id)
);
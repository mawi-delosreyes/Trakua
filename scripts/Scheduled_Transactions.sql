CREATE TABLE Scheduled_Transactions (
	scheduled_transaction_id int AUTO_INCREMENT,
	envelope_id int NOT NULL,
	sub_envelope_id int NOT NULL,
	transaction_amount double NOT NULL,
	scheduled_date date NOT NULL,
	is_transfer bool NOT NULL DEFAULT 0,
	notes varchar(250),
	PRIMARY KEY(scheduled_transaction_id)
);
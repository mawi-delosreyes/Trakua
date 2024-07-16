CREATE TABLE Scheduled_Transactions (
	scheduled_transaction_id int AUTO_INCREMENT,
	envelope_id int NOT NULL,
	sub_envelope_id int NOT NULL,
	scheduled_date date NOT NULL,
	transaction_amount double NOT NULL,
	notes varchar(250),
	transaction_type varchar(10) NOT NULL,
	account_id int NOT NULL,
	is_transfer bool,
	from_envelope_id int NOT NULL,
	from_sub_enveloep_id int NOT NULL,
	PRIMARY KEY(scheduled_transaction_id)
);
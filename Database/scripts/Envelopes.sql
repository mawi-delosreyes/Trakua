CREATE TABLE Envelopes (
	envelope_id int AUTO_INCREMENT,
	envelope_name varchar(50) NOT NULL,
	user_id int NOT NULL,
	envelope_total_balance double NOT NULL,
	envelope_balance double NOT NULL,
	envelope_type varchar(10) NOT NULL,
	number_of_sub_envelope int NOT NULL,
	PRIMARY KEY(envelope_id)
);
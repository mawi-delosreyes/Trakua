CREATE TABLE Sub_Envelopes (
	sub_envelope_id int AUTO_INCREMENT,
	sub_envelope_name varchar(50) NOT NULL,
	sub_envelope_total_balance double NOT NULL,
	sub_envelope_balance double NOT NULL,
	envelope_id int NOT NULL,
	category varchar(10) NOT NULL,
	roll_over BOOL NOT NULL,
	PRIMARY KEY (sub_envelope_id)
);
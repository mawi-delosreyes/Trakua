CREATE TABLE Wallets (
	wallet_id int AUTO_INCREMENT,
	user_id int NOT NULL,
	wallet_name varchar(50),
	PRIMARY KEY (wallet_id)
);
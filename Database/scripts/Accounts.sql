CREATE TABLE Accounts (
	account_id int AUTO_INCREMENT,
	wallet_id int NOT NULL,
	account_name varchar(50) NOT NULL,
	account_balance double NOT NULL,
	PRIMARY KEY(account_id)
);

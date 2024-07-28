CREATE TABLE Profile_Details (
	user_id int AUTO_INCREMENT,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email_address varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	currency varchar(5) NOT NULL,
	monthly_income double NOT NULL,
	savings_goal double NOT NULL,
	profile_picture blob NOT NULL,
	start_time_period bigint NOT NULL,
	end_time_period bigint NOT NULL,
	PRIMARY KEY(user_id)
);
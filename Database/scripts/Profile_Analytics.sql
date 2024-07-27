CREATE TABLE Profile_Analytics (
	user_analytics_id int AUTO_INCREMENT,
	user_id int NOT NULL,
	analytics_date date NOT NULL,
	needs double NOT NULL,
	wants double NOT NULL,
	savings double NOT NULL,
	PRIMARY KEY(user_analytics_id)
);
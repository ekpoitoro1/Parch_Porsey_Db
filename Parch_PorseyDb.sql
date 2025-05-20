-- Create tables/entities

CREATE TABLE web_events(
	id SERIAL,
	account_id INT,
	occurred_at TIMESTAMP,
	channel VARCHAR(50)
);

ALTER TABLE web_events ADD PRIMARY KEY(id);

CREATE TABLE orders(
	id SERIAL,
	account_id INT,
	standard_qty INT,
	poster_qty INT,
	total INT,
	standard_amt_usd NUMERIC(10,2),
	total_amt_usd NUMERIC(10,2)
);

ALTER TABLE orders ADD PRIMARY KEY(id)

CREATE TABLE sales_reps(
	id INT PRIMARY KEY,
	name VARCHAR(100),
	region_id INT
);

CREATE TABLE region(
	id INT PRIMARY KEY,
	name VARCHAR(100)
	);

CREATE TABLE accounts(
	id INT PRIMARY KEY,
	name VARCHAR(100),
	website VARCHAR(255),
	lat DECIMAL(9,6),
	primary_poc VARCHAR(100),
	sales_rep_id INT
);

ALTER TABLE web_events ADD FOREIGN KEY(account_id) REFERENCES accounts(id);

ALTER TABLE orders ADD FOREIGN KEY(account_id) REFERENCES accounts(id);

ALTER TABLE sales_reps ADD FOREIGN KEY(region_id) REFERENCES region(id);

ALTER TABLE accounts ADD FOREIGN KEY(sales_rep_id) REFERENCES sales_reps(id);

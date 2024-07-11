CREATE TABLE Customer(
	Customer_id varchar primary key,
	Customer_name varchar,
	Segment varchar,
	age int,
	Country varchar,
	City varchar,
	State varchar,
	Postal_code bigint,
	Region varchar
);

CREATE TABLE Product(
	Product_id varchar PRIMARY KEY,
	Category varchar,
	Sub_category varchar,
	Product_name varchar
);

CREATE TABLE Sales(
	Order_line int PRIMARY KEY,
	Order_id varchar,
	Order_date varchar,
	Ship_date date,
	Ship_mode varchar,
	Customer_id varchar,
	Product_id varchar,
	Sales numeric,
	Quantity int,
	Discount numeric,
	Profit numeric
);

SELECT * FROM Customer

COPY Customer FROM 'C:\Personal Folder\Compass Academy Data_Engineering\SQL\Data\Supermart_DB\CSV Files\Customer.csv' CSV HEADER;
COPY Product FROM 'C:\Personal Folder\Compass Academy Data_Engineering\SQL\Data\Supermart_DB\CSV Files\Product.csv' CSV HEADER;
COPY Sales FROM 'C:\Personal Folder\Compass Academy Data_Engineering\SQL\Data\Supermart_DB\CSV Files\Sales.csv' CSV HEADER;
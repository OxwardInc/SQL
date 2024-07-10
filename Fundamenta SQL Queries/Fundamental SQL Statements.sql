INSERT INTO Customer_table VALUES
(1, 'bee', 'cee', 32, 'bc@xyz.com');

INSERT INTO Customer_table(cust_id, first_name, age, email_id) VALUES
(2, 'dee', 23, 'd@xyz.com');

INSERT INTO Customer_table VALUES
(3, 'ee', 'ef', 27, 'ef@xyz.com'),
(4, 'gee', 'eh', 35 'gh@xyz.com');

COPY Customer_table FROM 'C:\Personal Folder\Compass Academy Data_Engineering\SQL\Data\copy.csv' DELIMITER ',' CSV HEADER;
COPY Customer_table FROM 'C:\Personal Folder\Compass Academy Data_Engineering\SQL\Data\copytext.txt' DELIMITER ',';

SELECT First_name FROM Customer_table;
SELECT First_name, Last_name FROM Customer_table;
SELECT * FROM Customer_table;

SELECT DISTINCT First_name FROM Customer_table;
SELECT First_name FROM Customer_table;
SELECT DISTINCT First_name, age FROM Customer_table;
SELECT DISTINCT * FROM Customer_table;
COPY Customer_table FROM 'C:\Personal Folder\Compass Academy Data_Engineering\SQL\Data\copy.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM Customer_table;
SELECT DISTINCT * FROM Customer_table;

SELECT First_name FROM Customer_table WHERE age = 25;
SELECT DISTINCT First_name FROM Customer_table WHERE age = 25;
SELECT DISTINCT First_name FROM Customer_table WHERE age > 25;
SELECT * FROM Customer_table WHERE First_name = 'Gee';

SELECT First_name, Last_name, age FROM Customer_table WHERE age > 20 AND age < 30;
SELECT First_name, Last_name, age FROM Customer_table WHERE age < 20 OR age >= 30;
SELECT * FROM Customer_table WHERE NOT age=25;
SELECT * FROM Customer_table WHERE NOT age=25 AND NOT First_name='Jay';

SELECT * FROM Customer_table WHERE Cust_id = 2;
UPDATE Customer_table SET Last_name = 'Pe', age= 17 WHERE Cust_id = 2;
SELECT * FROM Customer_table;
UPDATE Customer_table SET Email_id = 'gee@xyz.com' WHERE First_name = 'Gee' or First_name = 'gee';

DELETE FROM Customer_table WHERE Cust_id = 6;
SELECT * FROM Customer_table;
DELETE FROM Customer_table WHERE Age > 30;
DELETE FROM Customer_table;
SELECT * FROM Customer_table;

ALTER TABLE Customer_table ADD test varchar(225);
ALTER TABLE Customer_table DROP test;
ALTER TABLE Customer_table DROP COLUMN test;
ALTER TABLE Customer_table ALTER COLUMN age TYPE varchar;
ALTER TABLE Customer_table RENAME COLUMN Email_id TO Customer_email;
ALTER TABLE Customer_table ALTER COLUMN Cust_id SET NOT Null;
INSERT INTO Customer_table(First_name, Last_name, Age, Customer_email) VALUES
('aa', 'bb', '25', 'ab@xyz.com');
ALTER TABLE Customer_table ALTER COLUMN Cust_id DROP NOT Null;
INSERT INTO Customer_table(First_name, Last_name, Age, Customer_email) VALUES
('aa', 'bb', '25', 'ab@xyz.com');
ALTER TABLE Customer_table ADD CONSTRAINT Cust_id CHECK (Cust_id>0);
INSERT INTO Customer_table VALUES (-1, 'cc', 'dd', '67', 'cd@xyz.com');
ALTER TABLE Customer_table ADD PRIMARY KEY (Cust_id);
DELETE FROM Customer_table;
INSERT INTO Customer_table VALUES (1, 'cc', 'dd', '67', 'cd@xyz.com');
SELECT * FROM Customer_table;
ALTER TABLE Customer_table ADD PRIMARY KEY (Cust_id);

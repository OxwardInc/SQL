--- Pattern Matching

SELECT * FROM Customer WHERE Customer_name~* '^a+[a-z\s]+$';

SELECT * FROM Customer WHERE Customer_name ~* '^(a|b|c|d)+[a-z\s]+$';

SELECT * FROM Customer WHERE Customer_name ~* '^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';

CREATE TABLE Users(
	Id serial primary key,
	Name varchar
);

DROP TABLE Users; --- To delete a table

insert into users (name) VALUES ('Alex'), ('Jon Snow'), ('Christopher'), ('Arya'),('Sandip Debnath'), ('Lakshmi'),('alex@gmail.com'),('@sandip5004'), ('lakshmi@gmail.com');

SELECT * FROM Users;

SELECT * FROM Users WHERE Name ~* '[a-z0-9\.\-\_]+@[a-z0-9\-]+\.[a-z]{2,5}';

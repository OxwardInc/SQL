--- Tablespace

CREATE TABLESPACE NewSpace LOCATION 'C:\Personal Folder\Compass Academy Data_Engineering\SQL\Data';

CREATE TABLE Customer_test (i int) TABLESPACE NewSpace;

SELECT * FROM pg_tablespace;


    CREATE TABLE Persons (    
      person_name varchar(45) NOT NULL,    
      product varchar(45) DEFAULT NULL,    
      country varchar(25) DEFAULT NULL,  
      price float,  
      years int NOT NULL    
    );  
---------------------------------------------------------------------

	INSERT INTO Persons (person_name, product, country, price, years)     
    VALUES ('Steffen', 'Computer', 'USA', 20000.00, 2018),     
    ('Joseph', 'Laptop', 'India', 35000.00, 2016),     
    ('Kevin', 'TV', 'USA', 15000.00, 2016),     
    ('Thompson', 'Mobile', 'France', 12500.00, 2017),   
    ('Donald', 'Laptop', 'England', 30000.00, 2018),    
    ('Joseph', 'Mobile', 'India', 18000.00, 2018),    
    ('Matthew', 'Desktop', 'France', 22000.00, 2017),     
    ('Antonio', 'Mouse', 'England', 1200.00, 2016);  

	select * from Persons

	-------------------------------------------------------------------
	SELECT *, ROW_NUMBER()   
	OVER (ORDER BY price) AS row_num  
	FROM Persons;
	-----------------------------------------------------------------
	SELECT person_name, product, price, years,   
    Row_Number() OVER ( PARTITION BY years ORDER BY price) AS row_num  
    FROM Persons;  
/*
	1. A variable is a named placeholder for a value or set of values.
	2. A variable only needs to be defined once
	3. This allows us to consolidate complex logic into a variable and refer to the variable as many times as we need without repeating the logic.

	a. We have a query where we intend to pull all products above a certain minimum price
    b. We have another query  which requires to show the products whose ListPrice is greater than the average price

*/

DECLARE @MinPrice Money
set @MinPrice = 1000

SELECT * FROM Production.Product
WHERE ListPrice >= @MinPrice

---------------------------------------
DECLARE @AvgPrice MONEY
SELECT @AvgPrice = (SELECT AVG(ListPrice) FROM Production.Product) -- WE JUST AVOIDED THE SUBQUERY TO BE REPEATED MORE THAN ONCE
SELECT 
    ProductID,
    Name,
    StandardCost,
    ListPrice,
    AvgListPrice = @AvgPrice,
    AvgListPriceDiff = @AvgPrice
FROM Production.Product
WHERE ListPrice > @AvgPrice
ORDER BY ListPrice ASC;
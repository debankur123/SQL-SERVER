/*
	This is a simple query where we want to display the results of the Sales from sales order header table in year 2011 and with todays date we are viewing it.
*/
Select 
	SalesOrderID,
	OrderDate,
	DueDate,
	ShipDate,
	Today = dbo.UFNCurrentDate()
from AdventureWorks2019.Sales.SalesOrderHeader A
where YEAR(A.OrderDate) = 2011
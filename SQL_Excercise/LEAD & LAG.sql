SELECT
	SalesOrderID,
	OrderDate,
	CustomerID,
	TotalDue,
	NextTotalDue = LEAD(TotalDue,1) over(partition by CustomerID order by SalesOrderID),
	PreviousTotalDue = LAG(TotalDue,1) over(partition by CustomerID order by SalesOrderID)
from Sales.SalesOrderHeader
order by CustomerID,SalesOrderID
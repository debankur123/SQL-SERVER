--Sum of line totals group by productid,orderQty , in an aggregrate query
SELECT 
	ProductID,
	OrderQty,
	LineTotal=SUM(LineTotal) 
FROM Sales.SalesOrderDetail
GROUP BY ProductID,OrderQty
ORDER BY 1,2 DESC

-- sum of line totals via OVER()
select 
	ProductID,
	--SalesOrderID,
	--SalesOrderDetailID,
	OrderQty,
	--UnitPrice,
	--UnitPriceDiscount,
	LineTotal,
	ProductLineIdTotal = SUM(LineTotal) over(partition by ProductID,OrderQty )
from AdventureWorks2019.Sales.SalesOrderDetail
order by ProductID,OrderQty desc

--- basically the group by clause performs in the whole records but in window we can perform this in row level queries
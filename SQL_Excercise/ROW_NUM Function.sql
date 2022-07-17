select 
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	productLineIdTotal = sum(LineTotal) over(partition by SalesOrderID),
	Ranking = ROW_NUMBER() over(partition by SalesOrderID order by LineTotal ),
	RankingWithRank =  Rank() over(partition by SalesOrderID order by LineTotal )	
from Sales.SalesOrderDetail
order by SalesOrderID,LineTotal 
create procedure OrderReports
(
	@TopN as INT = null
)
as
begin
	Select *
	from(
			Select 
				ProductName = B.Name
				,LineTotalSum = SUM(A.LineTotal)
				,LineTotalSumRank = DENSE_RANK() over(Order by SUM(A.LineTotal))
			from Sales.SalesOrderDetail A
			inner join Production.Product B
			on A.ProductID = B.ProductID
			group by B.Name
		) Report
	where LineTotalSumRank <= @TopN
end

--exec OrderReports 15
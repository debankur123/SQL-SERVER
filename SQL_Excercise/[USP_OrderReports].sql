USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[USP_OrderReports]    Script Date: 06-01-2023 10:32:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Multiple IF statements Records fetch

ALTER procedure [dbo].[USP_OrderReports]
(
	@TopN as INT,
	@OrderType as INT
)
as
begin
	IF @OrderType = 1
		begin
			select * from 
			(
				Select 
					ProductName = B.Name,
					LineTotalSum = SUM(A.LineTotal),
					LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) Desc)
				from Sales.SalesOrderDetail A
				INNER JOIN Production.Product B
				ON A.ProductID = B.ProductID
				GROUP BY B.Name
			) X
			where LineTotalSumRank <= @TopN
		end
	IF @OrderType = 2
		begin
			Select * from 
			(
				Select 
					ProductName = B.Name,
					LineTotalSum = SUM(A.LineTotal),
					LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) Desc)
				from Purchasing.PurchaseOrderDetail A
				INNER JOIN Production.Product B
				ON A.ProductID = B.ProductID
				GROUP BY B.Name
			) Y
			WHERE LineTotalSumRank <= @TopN
		end
	
	IF @OrderType = 3
		begin
			Select 
				ProductID,
				LineTotal
				Into #AllOrders
			from Sales.SalesOrderDetail

			INSERT into #AllOrders

			Select ProductID,LineTotal
			from Purchasing.PurchaseOrderDetail

			SELECT * from 
			(
				SELECT 
					B.Name,
					LineTotalSum = Sum(AL.LineTotal),
					LineTotalSUMRank = Dense_Rank() Over(Order By Sum(AL.LineTotal) Desc)
				from #AllOrders AL
				INNER JOIN Production.Product B
				ON AL.ProductID = B.ProductID
				GROUP BY B.Name
			)Z
			Where LineTotalSUMRank <= @TopN
			Drop Table #AllOrders
		end

end
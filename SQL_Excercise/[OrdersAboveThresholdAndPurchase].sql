USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[OrdersAboveThresholdAndPurchase]    Script Date: 06-01-2023 10:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[OrdersAboveThresholdAndPurchase]
(
	@Threshold as money,
	@StartYear as int,
	@EndYear as int,
	@OrderType as int
)
as
begin
	if(@OrderType = 1)
		begin
			select A.SalesOrderID,
			A.OrderDate,
			A.TotalDue
			from Sales.SalesOrderHeader A
			inner join AdventureWorks2019.dbo.Calendar B 
			on A.OrderDate = B.DateValue
			where A.TotalDue >= @Threshold 
			and B.YearNumber between @StartYear and @EndYear
		end
	else if(@OrderType = 2)
		begin
			select 
				A.PurchaseOrderID,
				A.OrderDate,
				A.TotalDue
			from Purchasing.PurchaseOrderHeader A
			inner join AdventureWorks2019.dbo.Calendar B
			ON A.OrderDate = B.DateValue
			where A.TotalDue >= @Threshold
			and B.YearNumber BETWEEN @StartYear AND @EndYear
			order by A.TotalDue DESC
		end
end
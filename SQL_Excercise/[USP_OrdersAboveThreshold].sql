USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[USP_OrdersAboveThreshold]    Script Date: 06-01-2023 10:49:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[USP_OrdersAboveThreshold]
(
	@Threshold as money,
	@StartYear as int,
	@EndYear as int
)
as
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
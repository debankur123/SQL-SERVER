USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[USP_TopNSalesDynamic]    Script Date: 06-01-2023 10:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[USP_TopNSalesDynamic]
(
	@TopN as INT,
	@AggFunction as VARCHAR(20)
)
AS
BEGIN
	
	DECLARE @DynamicSQL Varchar(Max)

	SET @DynamicSQL = 'select * from 
					(
						Select 
						ProductName = B.Name,
						LineTotalSum = '
	SET @DynamicSQL = @DynamicSQL + @AggFunction

	SET @DynamicSQL = @DynamicSQL + '(A.LineTotal),
									LineTotalSumRank = DENSE_RANK() OVER(ORDER BY '

	SET @DynamicSQL = @DynamicSQL + @AggFunction

	SET @DynamicSQL = @DynamicSQL + ' (A.LineTotal) Desc)
									from Sales.SalesOrderDetail A
									INNER JOIN Production.Product B
									ON A.ProductID = B.ProductID
									GROUP BY B.Name
									) X
									where LineTotalSumRank <= '

	SET @DynamicSQL = @DynamicSQL + CAST(@TopN as varchar)

	EXEC (@DynamicSQL)
END
/*
    The Common Table Expressions (CTE) were introduced into standard SQL in order to simplify
     various classes of SQL Queries for which a derived table was just unsuitable.In  Simple SQL
     words to get reduced from complex sub-queries it is used. 

     The problem for CTE is as given below:

     1. Identify top 10 sales orders per month 
     2. Aggregrate these into a sum total,
        by month
     3. Compare each month's total to the previous month's , on the same row
*/
-- Sub query approach
Select 
    A.OrderMonth,
    A.Top10Total,
    PrevTop10Total = B.Top10Total
    from
(select
	OrderMonth,
	Top10Total = SUM(TotalDue)
	from (
			select 
				OrderDate,
				TotalDue,
				OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1),
				OrderRank = ROW_NUMBER() over(partition by DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) order by TotalDue desc)
			from Sales.SalesOrderHeader ) X
where OrderRank<10
group by OrderMonth) A
left  join
(
    select
	OrderMonth,
	Top10Total = SUM(TotalDue)
	from (
			select 
				OrderDate,
				TotalDue,
				OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1),
				OrderRank = ROW_NUMBER() over(partition by DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) order by TotalDue desc)
			from Sales.SalesOrderHeader ) X
    where OrderRank<10
    group by OrderMonth
) B on A.OrderMonth = dateadd(MONTH,1, B.OrderMonth)
order by 1
/*
    The problem for TempTable is as given below:

     1. Identify top 10 sales orders per month 
     2. Aggregrate these into a sum total  by month
     3. Compare each month's total to the previous month's , on the same row
*/


select 
    OrderDate,
    TotalDue,
    OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1),
    OrderRank = ROW_NUMBER() over(partition by DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) order by TotalDue desc)
    into #Sales1
    from Sales.SalesOrderHeader
    -- select * from #Sales1

select
	OrderMonth,
	Top10Total = SUM(TotalDue)
    into #Top10
	from #Sales1
	where OrderRank<10
	group by OrderMonth
    -- select * from #Top10

Select 
    A.OrderMonth,
    A.Top10Total,
    PrevTop10Total = B.Top10Total
from #Top10 A
left join #Top10 B 
on A.OrderMonth = DATEADD(MONTH,1,B.OrderMonth)
order by OrderMonth    

drop table #Sales
drop table #Top10
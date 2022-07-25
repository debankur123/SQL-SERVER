/*
    The problem for TempTable is as given below:

     1. Identify top 10 sales orders per month 
     2. Aggregrate these into a sum total  by month
     3. Compare each month's total to the previous month's , on the same row

     This is done by creating a temp table and then inserting into it.
*/


CREATE table #Sales2(
    OrderDate  DATE,
    OrderMonth  Date,
    TotalDue  Money,
    OrderRank  Int
)

insert into #Sales2 (
    OrderDate ,
    OrderMonth ,
    TotalDue ,
    OrderRank 
)

select 
    OrderDate,
    OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1),
    TotalDue,
    OrderRank = ROW_NUMBER() over (partition by DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) order by TotalDue desc)
from Sales.SalesOrderHeader

--select * from #Sales2 

create table #Top10Sales(
    OrderMonth DATE,
    Top10Total money
)
insert into #Top10Sales 

select
    OrderMonth,
    Top10Total = sum(TotalDue)
from #Sales2
where OrderRank <=10
group by OrderMonth

-- select * from #Top10Sales
Select 
    A.OrderMonth,
    A.Top10Total,
    PrevTop10Total = B.Top10Total
from #Top10Sales A
left join #Top10Sales B 
on A.OrderMonth = DATEADD(MONTH,1,B.OrderMonth)
order by OrderMonth    



drop table #Sales2
drop table #Top10Sales

create table #NewOrders(
    OrderDate DATE,
    OrderMonth DATE,
    TotalDue   Money,
    OrderRank INT
)

INSERT into #NewOrders
(
	OrderDate,
	OrderMonth,
	TotalDue,
	OrderRank
)
select 
    OrderDate,
    OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1),
    TotalDue,
    OrderRank = ROW_NUMBER() over (partition by DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) order by TotalDue desc)
from Sales.SalesOrderHeader

SELECT * FROM #NewOrders

create table #Top10Orders(
    OrderMonth DATE,
	OrderType varchar(50),
    Top10Total money
)
insert into #Top10Orders 
select
    OrderMonth,
	OrderType = 'Sales',
    Top10Total = SUM(TotalDue)
from #NewOrders
where OrderRank <=10
group by OrderMonth


 select * from #Top10Orders
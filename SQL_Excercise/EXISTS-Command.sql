/* 
   Lets say we want to see all customer orders which has 
   atleast one item with the line total of more than $10,000
*/

-- First accomplishment using Joins.

select 
    A.SalesOrderID,
    A.OrderDate,
    A.TotalDue,
    B.SalesOrderDetailID,
    B.LineTotal
from Sales.SalesOrderHeader A
inner join Sales.SalesOrderDetail B on A.SalesOrderID = B.SalesOrderID
where B.LineTotal>10000
order by 1
------------------------------------------------------------------------------------------------
select 
    A.SalesOrderID,
    A.OrderDate,
    A.TotalDue
from Sales.SalesOrderHeader A
where Exists(
    select 1 
    from Sales.SalesOrderDetail B
    where B.LineTotal>10000
    and A.SalesOrderID = B.SalesOrderID
)
order by 1
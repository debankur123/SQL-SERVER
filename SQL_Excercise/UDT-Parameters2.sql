SELECT 
    SalesOrderID
    ,OrderDate
    ,DueDate
    ,ShipDate
    ,ElapsedDate = dbo.UFNelapsedBusinessDays(OrderDate,ShipDate)
from sales.SalesOrderHeader A
WHERE YEAR(A.OrderDate) = 2011
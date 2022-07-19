-- Correlated subqueries are used for row-by-row processing. Each subquery is executed once for every row of the outer query.
-- A correlated subquery is evaluated once for each row processed by the parent statement. 
--The parent statement can be a SELECT, UPDATE, or DELETE statement.
-- A correlated subquery is one way of reading every row in a table and comparing values in each row against related data.
-- It is used whenever a subquery must return a different result or set of results for each candidate row considered by the main query.
-- In other words, you can use a correlated subquery to answer a multipart question whose answer depends on the value in each row processed by the parent statement.



-- Now we just wanted to see that how many orders are there where OrderQuantity is greater than 1 
SELECT 
    SalesOrderID,
    OrderDate,
    Subtotal,
    TaxAmt,
    Freight,
    TotalDue,
    MultiOrderCount = 
    (
        select 
        count(*) 
        from Sales.SalesOrderDetail b 
        where b.salesOrderId = a.salesOrderId  -- here outer and inner table is kind of merged or joined in appropriate words
        and OrderQty>1
    )
from Sales.SalesOrderHeader A


--------------------------------------------------------------------

select 
    salesOrderId,
    OrderQty
from Sales.SalesOrderDetail
where salesOrderId = 43660
-- There are 6 recors which contains the orderQty value > 1 and
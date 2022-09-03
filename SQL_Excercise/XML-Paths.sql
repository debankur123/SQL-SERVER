/*
    The STUFF() function deletes a part of a string and then 
    inserts another part into the string, starting at a specified position. For example 

    SELECT STUFF('SQL Tutorial', 1, 3, 'HTML'); Parameters are :
    a. String name
    b. Starting position of STUFF()
    c. Length of the string to be deleted 
    d. New String which will be added 
    
    The output will be 'HTML Tutorial'
    Delete 3 characters from a string, starting in position 1, and then insert "HTML" in position 1
*/
select stuff(
    (
        select ','+ convert(varchar,convert(money,Linetotal))
        from Sales.SalesOrderDetail A
        where A.SalesOrderID = 43659
        for XML Path('')
    ),1,1,''
) 
/*
    Now for a real world example we will do this with the
    linetotal column.
*/
select 
	SalesOrderID,
	OrderDate,
	SubTotal,
	TaxAmt,
	Freight,
	TotalDue,
	LineTotals = stuff(
    (
        select ','+ convert(varchar,convert(money,Linetotal))
        from Sales.SalesOrderDetail B
        where A.SalesOrderID = B.SalesOrderID
        for XML Path('')
    ),1,1,''
) 
from Sales.SalesOrderHeader A

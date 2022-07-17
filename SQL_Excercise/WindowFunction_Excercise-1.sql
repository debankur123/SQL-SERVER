-- Excercise 1
--------------------------------------------------------------------------------------------------------------------
select B.FirstName,B.LastName,C.JobTitle,A.Rate,
		AverageRates = AVG(A.Rate) over()
from AdventureWorks2019.HumanResources.EmployeePayHistory A
	inner join AdventureWorks2019.Person.Person B
	on A.BusinessEntityID = B.BusinessEntityID
	inner join AdventureWorks2019.HumanResources.Employee C
	on A.BusinessEntityID = C.BusinessEntityID
----------------------------------------------------------------------------------------------------------------------
-- Excercise 2:
select B.FirstName,
		B.LastName,
		C.JobTitle,
		A.Rate,
		AverageRates = AVG(A.Rate) over(),
		MaximumRates = max(A.Rate) over()
	from HumanResources.EmployeePayHistory A
	inner join Person.Person B 
	on A.BusinessEntityID = B.BusinessEntityID
	inner join HumanResources.Employee C
	on A.BusinessEntityID = C.BusinessEntityID
---------------------------------------------------------------------------------------------------------------
-- Excercise 3:
select B.FirstName,
		B.LastName,
		C.JobTitle,
		A.Rate,
		AverageRates = AVG(A.Rate) over(),
		MaximumRates = max(A.Rate) over(),
		DiffFromAvgRate = A.Rate - AVG(A.Rate) over()
	from HumanResources.EmployeePayHistory A
	inner join Person.Person B 
	on A.BusinessEntityID = B.BusinessEntityID
	inner join HumanResources.Employee C
	on A.BusinessEntityID = C.BusinessEntityID
-----------------------------------------------------------------------------
-- Excercise 4:
select B.FirstName,
		B.LastName,
		C.JobTitle,
		A.Rate,
		AverageRates = AVG(A.Rate) over(),
		MaximumRates = max(A.Rate) over(),
		DiffFromAvgRate = A.Rate - AVG(A.Rate) over(),
		PercentofMaxRate = (A.Rate/max(A.Rate) over())*100
	from HumanResources.EmployeePayHistory A
	inner join Person.Person B 
	on A.BusinessEntityID = B.BusinessEntityID
	inner join HumanResources.Employee C
	on A.BusinessEntityID = C.BusinessEntityID
--------------------------------------------------------------------------------

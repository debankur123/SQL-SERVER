--- Excercise 1---
select
	BusinessEntityID,
	JobTitle,
	VacationHours,
	MaxVacationHours = (select MAX(VacationHours) from AdventureWorks2019.HumanResources.Employee)
from AdventureWorks2019.HumanResources.Employee
--order by VacationHours

--- Excercise 2-----
select
	BusinessEntityID,
	JobTitle,
	VacationHours,
	MaxVacationHours = (select MAX(VacationHours) from AdventureWorks2019.HumanResources.Employee),
	PercentMaxVacationHours = (VacationHours*1.0)/(select MAX(VacationHours) from AdventureWorks2019.HumanResources.Employee)
from AdventureWorks2019.HumanResources.Employee
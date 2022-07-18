select
	ProductID,
	Name,
	StandardCost,
	ListPrice,
	AvgListPrice = (select AVG(ListPrice) from Production.Product),
	AvgListPriceDiff = ListPrice-(select AVG(ListPrice) from Production.Product)
from Production.Product
where ListPrice>(select AVG(ListPrice) from Production.Product)
order by ListPrice
-- excercise 1
select 
	productName = a.name,
	a.ListPrice,
	ProductSubcategory = b.Name,
	ProductCategory	= c.Name 
	from AdventureWorks2019.Production.Product	a
	inner join Production.ProductSubcategory b
	on a.ProductSubcategoryID = b.ProductSubcategoryID
	inner join Production.ProductCategory c 
	on b.ProductCategoryID = c.ProductCategoryID
-------------------------------------------------------------------------------------
--excercise 2:
select 
	productName = a.name,
	a.ListPrice,
	ProductSubcategory = b.Name,
	ProductCategory	= c.Name,
	AvgPriceByCategory = AVG(a.ListPrice)  over(partition by c.Name)
	from AdventureWorks2019.Production.Product	a
	inner join Production.ProductSubcategory b
	on a.ProductSubcategoryID = b.ProductSubcategoryID
	inner join Production.ProductCategory c 
	on b.ProductCategoryID = c.ProductCategoryID
   --------------------------------------------------------------------------------------------
-- excercise 3:
select 
	productName = a.name,
	a.ListPrice,
	ProductSubcategory = b.Name,
	ProductCategory	= c.Name,
	AvgPriceByCategory = AVG(a.ListPrice)  over(partition by c.Name),
	AvgPriceByCategoryAndSubcategory = avg(a.ListPrice) over(partition by c.name,b.Name)
	from AdventureWorks2019.Production.Product	a
	inner join Production.ProductSubcategory b
	on a.ProductSubcategoryID = b.ProductSubcategoryID
	inner join Production.ProductCategory c 
	on b.ProductCategoryID = c.ProductCategoryID
	-------------------------------------------------------
	-- excercise 4:
select 
	productName = a.name,
	a.ListPrice,
	ProductSubcategory = b.Name,
	ProductCategory	= c.Name,
	AvgPriceByCategory = AVG(a.ListPrice)  over(partition by c.Name),
	AvgPriceByCategoryAndSubcategory = avg(a.ListPrice) over(partition by c.name,b.Name),
	ProductVsCategoryDelta = (a.ListPrice-avg(a.ListPrice) over(partition by c.Name))
	from AdventureWorks2019.Production.Product	a
	inner join Production.ProductSubcategory b
	on a.ProductSubcategoryID = b.ProductSubcategoryID
	inner join Production.ProductCategory c 
	on b.ProductCategoryID = c.ProductCategoryID
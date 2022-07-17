SELECT 
  ProductName = A.Name,
  A.ListPrice,
  ProductSubcategory = B.Name,
  ProductCategory = C.Name,
  [Price Rank] = ROW_NUMBER() OVER(ORDER BY A.ListPrice DESC),
  [Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC),
  [Category Price Rank With Rank] = RANK() over(partition by C.Name order by A.ListPrice desc),
  [Category Price Rank With Dense Rank] = DENSE_RANK() over(partition by C.Name order by A.ListPrice desc),
  [Top 5 Price In Category] = CASE 
								when ROW_NUMBER() over(partition by C.Name order by A.ListPrice desc) <=5 then 'Yes' 
								else 'No' end,
  [Top 5 Price In Category With Dense Rank] = CASE 
										      WHEN DENSE_RANK() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC) <= 5 THEN 'Yes'
												ELSE 'No'
											  END
FROM AdventureWorks2019.Production.Product A
JOIN AdventureWorks2019.Production.ProductSubcategory B
ON A.ProductSubcategoryID = B.ProductSubcategoryID
JOIN AdventureWorks2019.Production.ProductCategory C
ON B.ProductCategoryID = C.ProductCategoryID
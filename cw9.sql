/*ZAD1*/
WITH CTE AS 
(SELECT 
        e.BusinessEntityID, 
        e.JobTitle, 
        e.HireDate, 
        e.Gender, 
        p.FirstName, 
        p.LastName, 
        p.EmailPromotion, 
        p.Title
    FROM AdventureWorks2022.HumanResources.Employee e
    JOIN AdventureWorks2022.Person.Person p ON e.BusinessEntityID = p.BusinessEntityID)
SELECT *
INTO TempEmployeeInfo
FROM CTE;
/*ZAD2*/

WITH
StoreRevenue AS (
  SELECT StoreID, SUM(TotalDue) AS Revenue
  FROM Sales.Customer JOIN Sales.SalesOrderHeader ON
  Customer.CustomerID = SalesOrderHeader.CustomerID
  GROUP BY StoreID
),

StoreContacts AS (
	SELECT
		CONCAT(s.Name, ' (', FirstName,' ', LastName, ')') AS ContactName,
		p2.BusinessEntityID AS StoreID
	FROM Person.Person AS p1
	JOIN Person.BusinessEntityContact AS p2
		ON p1.BusinessEntityID = p2.PersonID
	JOIN Sales.Store AS s
		ON p2.BusinessEntityID = s.BusinessEntityID
	WHERE PersonType = 'SC'
)

SELECT ContactName, Revenue
FROM StoreContacts AS sc
JOIN StoreRevenue AS sr
	ON sc.StoreID = sr.StoreID
ORDER BY ContactName

/*ZAD3*/
WITH CTE AS (
    SELECT 
        c.Name AS CategoryName, 
        SUM(sod.LineTotal) AS TotalSales
    FROM AdventureWorksLT2022.SalesLT.SalesOrderDetail sod
    JOIN AdventureWorksLT2022.SalesLT.Product p ON sod.ProductID = p.ProductID
    JOIN AdventureWorksLT2022.SalesLT.ProductCategory sc ON p.ProductCategoryID = sc.ProductCategoryID
    JOIN AdventureWorksLT2022.SalesLT.ProductCategory c ON sc.ProductCategoryID = c.ProductCategoryID
    GROUP BY p.Name, c.Name
)
SELECT *
FROM CTE;
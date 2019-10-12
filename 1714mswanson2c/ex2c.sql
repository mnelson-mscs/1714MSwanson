-- Mark Swanson
-- Exercise 2C: Summary queries, groups, joins
-- PropertyManager db

-- 2C.1: Building table; Group by State, City
SELECT        State, City, COUNT(BuildingId) AS [Building Count]
FROM            Building
GROUP BY State, City

-- 2C.2: Building table; Group by City; Filter MN
SELECT        City, COUNT(BuildingId) AS [Building Count]
FROM            Building
WHERE        (State = N'MN')
GROUP BY City

-- 2C.3: Building, Apartment table; Group by BuildingId, BuildingName 
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Avg Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName

-- 2C.4: Building, Apartment table; Group by City, BuildingName; Filter MN
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING        (Building.State = N'MN')

-- 2C.5: Building, Apartment table; Group by City
SELECT        Building.City, MIN(Apartment.Rent) AS [Min Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.City

-- 2C.6: Building, Apartment table; Group by BuildingName; Filter Winona, Tenant is Null
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest Size], AVG(Apartment.SquareFeet) AS [Average Size], MAX(Apartment.SquareFeet) AS [Largest Size]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingName, Apartment.TenantId, Building.City
HAVING        (Apartment.TenantId IS NULL) AND (Building.City = N'Winona')

-- 2C.7: Invoice, LineItem table; Group by InvoiceId; Filter Garage during Sep 2018
SELECT        MIN(LineItem.Amount) AS [Cheapest Garage Sep 2018]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY LineItem.Description, Invoice.InvoiceDate
HAVING        (LineItem.Description = N'Garage') AND (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-10-01 00:00:00', 102))

-- 2C.8: Invoice, LineItem table; Group by InvoiceId; Filter Sep 2018
SELECT        Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total Amout Billed]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate
HAVING        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-10-01 00:00:00', 102))
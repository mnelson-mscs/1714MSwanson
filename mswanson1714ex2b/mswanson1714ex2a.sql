-- Mark Swanson
-- Exercise 2B: Summary queries
-- PropertyManager db

-- 1) Count All Buildings
SELECT	COUNT(*) AS [Count All Buildings]
FROM	Building

--2) Building count in Winona
SELECT	COUNT(*) AS [Count Buildings in Winona]
FROM	Building
GROUP BY City
Having	(City = N'Winona')

-- 3) Average Rent All Apartments
SELECT	AVG(Rent) AS [Avg Rent All Apts]
FROM	Apartment

-- 4) Building1 Total Rent
SELECT	SUM(Rent) AS [Bldg1 Total Rent]
FROM	Apartment
GROUP BY BuildingId
HAVING	(BuildingId = 1)

-- 5) Building 2 Cheapest Rent
SELECT MIN(Rent) AS [Bldg2 Cheapest Rent]
FROM	Apartment
GROUP BY BuildingId
HAVING	(BuildingId = 2)

-- 6) Smallest, Average, Largest Size
SELECT MIN(SquareFeet) AS [Smallest Size], AVG(SquareFeet) AS [Avg Size], MAX(SquareFeet) AS [Largest Size]
FROM	Apartment
GROUP BY BuildingId
Having	(BuildingId=1)

-- 7) Cheapest Garage 
SELECT	MIN(Amount) AS [Cheapest Garage]
FROM	LineItem
GROUP BY Description
HAVING	(Description = N'Garage')

-- 8) Total Gas Bill
SELECT	SUM(Amount) AS [Total Billed for Gas]
FROM	LineItem
GROUP BY Description
HAVING	(Description = N'Gas')

-- 9) Total October Rent
SELECT	SUM(Amount) AS [Total October Rent]
FROM	LineItem
GROUP BY Description
HAVING	(Description LIKE N'%October%')
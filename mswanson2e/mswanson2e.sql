-- 2e.1
SELECT        BuildingName, Address, City + N', ' + State + N' ' + Zip AS [City State Zip]
FROM            Building
WHERE        (City = N'Winona') AND (State = N'MN')

-- 2e.2
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms AS [Estimated Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId CROSS JOIN
                         LineItem
WHERE        (Building.City = N'Red Wing') AND (Building.State = N'MN')
GROUP BY Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms

-- 2e.3
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms) 
                         AS Difference
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId CROSS JOIN
                         LineItem
GROUP BY Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms, Building.City, Building.State, Apartment.Rent - (Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms), 
                         Apartment.Rent
HAVING        (Building.City = N'Red Wing') AND (Building.State = N'MN')

-- 2e.4
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM            LineItem INNER JOIN
                         Invoice ON LineItem.InvoiceId = Invoice.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate

-- 2e.5
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS InvoiceTotal, Receipt.Amount
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount

-- 2e.6
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoice.InvoiceDate, SUM(LineItem.Amount) AS InvoiceTotal, Receipt.Amount AS Received, SUM(LineItem.Amount) 
                         - Receipt.Amount AS Difference
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount
HAVING        (Receipt.Amount < SUM(LineItem.Amount))

-- 2e.7
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(day, Invoice.DueDate, Receipt.ReceiptDate) AS [Days Late]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(day, Invoice.DueDate, Receipt.ReceiptDate)
HAVING        (DATEDIFF(day, Invoice.DueDate, Receipt.ReceiptDate) > 0)

-- 2e.8
SELECT        Person.PersonId, Person.FirstName + N' ' + Person.LastName AS Tenant, MAX(Invoice.InvoiceDate) AS [Recent Invoice], DATEADD(month, 1, Invoice.InvoiceDate) AS [Next Invoice]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Person.PersonId, Person.FirstName + N' ' + Person.LastName, DATEADD(month, 1, Invoice.InvoiceDate)
-- 1) Buildings, apartments, admins
SELECT        Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, People.FirstName + N' ' + People.LastName AS Admin
FROM            Apartments INNER JOIN
                         Buildings ON Apartments.Building_Id = Buildings.Id INNER JOIN
                         People ON Apartments.Tenant_Id = People.Id
ORDER BY Buildings.Id

-- 2) Apartments, invoices, line items(I have no idea what order to sort this by)
SELECT        Apartments.Building_Id, Apartments.ApartmentNum, People.LastName + N', ' + People.FirstName AS Tenant, Invoices.Id AS InvoiceId, LineItems.Description, LineItems.Amount
FROM            Apartments INNER JOIN
                         Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
                         LineItems ON Invoices.Id = LineItems.Invoice_Id INNER JOIN
                         People ON Apartments.Tenant_Id = People.Id
GROUP BY Apartments.Building_Id, Apartments.ApartmentNum, People.LastName + N', ' + People.FirstName, Invoices.Id, LineItems.Description, LineItems.Amount
ORDER BY Apartments.ApartmentNum DESC

-- 3) Tenants, invoices, receipts
SELECT        Apartments.Id, People.LastName + N', ' + People.FirstName AS Tenant, Invoices.Id AS InvoiceId, Invoices.DueDate, Receipts.ReceiptDate, Receipts.Amount AS [Amount Received]
FROM            Apartments INNER JOIN
                         Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
                         People ON Apartments.Tenant_Id = People.Id INNER JOIN
                         Receipts ON Invoices.Id = Receipts.Invoice_Id
ORDER BY Apartments.Id DESC

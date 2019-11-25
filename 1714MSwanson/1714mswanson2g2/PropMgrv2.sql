--USE [PropertyManager]
--GO
SET IDENTITY_INSERT [dbo.Buildings] ON 
GO
INSERT [dbo.Buildings] ([Id], [BuildingName], [Address], [City], [State], [Zip]) VALUES (1, N'Southeast Apartments', N'308 Pioneer Rd', N'Red Wing', N'MN', N'55066     ')
GO
INSERT [dbo.Buildings] ([Id], [BuildingName], [Address], [City], [State], [Zip]) VALUES (2, N'Southwest Apartments', N'1250 Homer Rd', N'Winona', N'MN', N'55987     ')
GO
INSERT [dbo.Buildings] ([Id], [BuildingName], [Address], [City], [State], [Zip]) VALUES (3, N'Northeast Apartments', N'175 W Mark St', N'Winona', N'MN', N'55987     ')
GO
INSERT [dbo.Buildings] ([Id], [BuildingName], [Address], [City], [State], [Zip]) VALUES (4, N'Northwest Apartments', N'700 Terrace Heights', N'Winona', N'MN', N'55987     ')
GO
INSERT [dbo.Buildings] ([Id], [BuildingName], [Address], [City], [State], [Zip]) VALUES (5, N'Lacrosse Apartments', N'1725 State St', N'La Crosse', N'WI', N'54601     ')
GO
SET IDENTITY_INSERT [dbo.Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (1, N'John', N'Doe', N'111-111-1111', N'john.doe@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (2, N'James', N'Smith', N'111-111-1112', N'james.smith@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (3, N'Michael', N'Smith', N'111-111-1113', N'michael.smith@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (4, N'David', N'Johnson', N'111-111-1114', N'david.johnson@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (5, N'Mark', N'Swanson', N'111-111-1115', N'mswanson@southeastmn.edu')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (6, N'Shaun', N'Rivera', N'111-111-1116', N'shaun.rivera@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (7, N'Charleen', N'Carella', N'111-111-1117', N'charleen.carella@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (8, N'Merla', N'Berggren', N'111-111-1118', N'merla.berggren@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (9, N'Kimberlyn', N'Caldera', N'111-111-1119', N'kimberlyn.caldera@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (10, N'Glyn', N'Bainbridge', N'111-111-1121', N'glyn.bainbridge@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (11, N'Shantee', N'Bendele', N'111-111-1122', N'shantee.bendele@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (12, N'Abigael', N'Krikorian', N'111-111-1123', N'abigael.krikorian@email.com')
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartments] ON 
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (1, 1, N'101', 400, 1, 550.0000, 1, 5)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (2, 1, N'102', 550, 1, 700.0000, 2, 5)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (3, 1, N'103', 500, 1, 650.0000, 3, 5)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (4, 2, N'201', 700, 2, 900.0000, 4, 5)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (5, 2, N'202', 650, 2, 850.0000, 5, 5)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (6, 2, N'203', 600, 1, 700.0000, 6, 5)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (7, 3, N'301', 400, 1, 550.0000, 7, 12)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (8, 3, N'302', 550, 1, 700.0000, 8, 12)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (9, 3, N'303', 700, 2, 900.0000, 9, 12)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (10, 4, N'401', 650, 2, 850.0000, 10, 12)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (11, 4, N'402', 600, 1, 700.0000, 11, 12)
GO
INSERT [dbo].[Apartments] ([Id], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [Tenant_Id], [Admin_Id]) VALUES (12, 4, N'403', 400, 1, 550.0000, 12, 12)
GO
SET IDENTITY_INSERT [dbo].[Apartments] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON 
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10000, 1, CAST(N'2019-09-13T00:00:00' AS SmallDateTime), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10001, 2, CAST(N'2019-09-13T00:00:00' AS SmallDateTime), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10002, 3, CAST(N'2019-09-13T00:00:00' AS SmallDateTime), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10003, 4, CAST(N'2019-09-13T00:00:00' AS SmallDateTime), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10004, 5, CAST(N'2019-09-13T00:00:00' AS SmallDateTime), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10005, 1, CAST(N'2019-10-13T00:00:00' AS SmallDateTime), CAST(N'2019-11-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10006, 2, CAST(N'2019-10-13T00:00:00' AS SmallDateTime), CAST(N'2019-11-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10007, 3, CAST(N'2019-10-13T00:00:00' AS SmallDateTime), CAST(N'2019-11-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10008, 4, CAST(N'2019-10-13T00:00:00' AS SmallDateTime), CAST(N'2019-11-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoices] ([Id], [Apartment_Id], [InvoiceDate], [DueDate]) VALUES (10009, 5, CAST(N'2019-10-13T00:00:00' AS SmallDateTime), CAST(N'2019-11-01T00:00:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
SET IDENTITY_INSERT [dbo].[LineItems] ON 
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10000, 10000, N'Rent, October 2019', 550.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10001, 10000, N'Electricity', 50.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10002, 10000, N'Gas', 40.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10003, 10000, N'Garage', 60.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10004, 10000, N'Cable TV/Internet', 70.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10005, 10001, N'Rent, October 2019', 700.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10006, 10001, N'Electricity', 50.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10007, 10001, N'Gas', 40.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10008, 10001, N'Garage', 65.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10009, 10001, N'Cable TV/Internet', 70.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10010, 10002, N'Rent, October 2019', 650.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10011, 10002, N'Electricity', 50.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10012, 10002, N'Gas', 40.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10013, 10002, N'Garage', 70.0000)
GO
INSERT [dbo].[LineItems] ([Id], [Invoice_Id], [Description], [Amount]) VALUES (10014, 10002, N'CableTV/Internet', 70.0000)
GO
SET IDENTITY_INSERT [dbo].[LineItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipts] ON 
GO
INSERT [dbo].[Receipts] ([Id], [Invoice_Id], [ReceiptDate], [Amount]) VALUES (10000, 10000, CAST(N'2019-10-02T00:00:00' AS SmallDateTime), 770.0000)
GO
INSERT [dbo].[Receipts] ([Id], [Invoice_Id], [ReceiptDate], [Amount]) VALUES (10001, 10001, CAST(N'2019-10-02T00:00:00' AS SmallDateTime), 920.0000)
GO
INSERT [dbo].[Receipts] ([Id], [Invoice_Id], [ReceiptDate], [Amount]) VALUES (10002, 10002, CAST(N'2019-10-02T00:00:00' AS SmallDateTime), 870.0000)
GO
SET IDENTITY_INSERT [dbo].[Receipts] OFF
GO

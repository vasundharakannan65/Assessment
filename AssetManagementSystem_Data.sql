USE [AssetManagementSystem]
GO
DELETE FROM [dbo].[AssetHolderInfo]
GO
DELETE FROM [dbo].[Asset]
GO
DELETE FROM [dbo].[Brand]
GO
DELETE FROM [dbo].[User]
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([Id], [Username], [Companyname], [Address], [Mobilenumber]) VALUES (1, N'Arun karthick', N'Zenith Exports', N'Maharashtra, Mumbai', N'1234567892')
GO
INSERT [dbo].[User] ([Id], [Username], [Companyname], [Address], [Mobilenumber]) VALUES (2, N'Bhuvanesh Kumar', N'Altria group', N'Cochin, Kerela', N'6789212347')
GO
INSERT [dbo].[User] ([Id], [Username], [Companyname], [Address], [Mobilenumber]) VALUES (4, N'Fazil Ahmed', N'Salepush', N'Maharashtra, Mumbai', N'9876167892')
GO
INSERT [dbo].[User] ([Id], [Username], [Companyname], [Address], [Mobilenumber]) VALUES (5, N'Gomathi krishnan', N'Dwellsmith', N'Tamilnadu, Chennai', N'9321512892')
GO
INSERT [dbo].[User] ([Id], [Username], [Companyname], [Address], [Mobilenumber]) VALUES (6, N'Hari Krishnan', N'Swipewire', N'Maharastra, Mumbai', N'8956984992')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 
GO
INSERT [dbo].[Brand] ([Id], [Brandname]) VALUES (1, N'Acer')
GO
INSERT [dbo].[Brand] ([Id], [Brandname]) VALUES (2, N'Apple')
GO
INSERT [dbo].[Brand] ([Id], [Brandname]) VALUES (3, N'Benq')
GO
INSERT [dbo].[Brand] ([Id], [Brandname]) VALUES (4, N'Dell')
GO
INSERT [dbo].[Brand] ([Id], [Brandname]) VALUES (5, N'HP')
GO
INSERT [dbo].[Brand] ([Id], [Brandname]) VALUES (6, N'MSI')
GO
INSERT [dbo].[Brand] ([Id], [Brandname]) VALUES (7, N'Microsoft')
GO
INSERT [dbo].[Brand] ([Id], [Brandname]) VALUES (8, N'Lenova')
GO
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Asset] ON 
GO
INSERT [dbo].[Asset] ([Id], [BrandId], [Assetname], [Modelno], [Serialno], [Quantity], [Color], [Size], [Type], [Price], [Imagepath]) VALUES (5, 1, N'Laptop', N'BNA-FGN562L', N'1234567891234567', 80, N'Silver', N'L', N'Laptop', CAST(55000.00 AS Decimal(10, 2)), N'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fwindows-laptop&psig=AOvVaw3gP7feq_6eQmR7JLosd8lZ&ust=1635325311681000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIjx8tTb5_MCFQAAAAAdAAAAABAD')
GO
INSERT [dbo].[Asset] ([Id], [BrandId], [Assetname], [Modelno], [Serialno], [Quantity], [Color], [Size], [Type], [Price], [Imagepath]) VALUES (8, 2, N'Monitor', N'HYU-UIK897K', N'7894561233214569', 10, N'Black', N'M', N'Display', CAST(20000.00 AS Decimal(10, 2)), N'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.acer.com%2Fac%2Fen%2FUS%2Fcontent%2Fgroup%2Fmonitors&psig=AOvVaw0H3i4hRGi1rzddP0RL6iOI&ust=1635325354073000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLDAsenb5_MCFQAAAAAdAAAAABAZ')
GO
INSERT [dbo].[Asset] ([Id], [BrandId], [Assetname], [Modelno], [Serialno], [Quantity], [Color], [Size], [Type], [Price], [Imagepath]) VALUES (9, 4, N'Dell Laptop', N'ASDFHGHFG', N'2322445566', 4, N'Grey', N'M', N'Laptop', CAST(45000.00 AS Decimal(10, 2)), N'Laptop.jpg')
GO
INSERT [dbo].[Asset] ([Id], [BrandId], [Assetname], [Modelno], [Serialno], [Quantity], [Color], [Size], [Type], [Price], [Imagepath]) VALUES (10, 2, N'Dell Laptop', N'ASDFHGHFG', N'2322445566', 2, N'Grey', N'M', N'Laptop', CAST(345600.00 AS Decimal(10, 2)), N'Laptop.jpg')
GO
INSERT [dbo].[Asset] ([Id], [BrandId], [Assetname], [Modelno], [Serialno], [Quantity], [Color], [Size], [Type], [Price], [Imagepath]) VALUES (11, 3, N'kkk', N'A344asdfasdf', N'333555555555', 0, N'Grey', N'M', N'Laptop', CAST(-4.00 AS Decimal(10, 2)), N'monitor.jpg')
GO
SET IDENTITY_INSERT [dbo].[Asset] OFF
GO

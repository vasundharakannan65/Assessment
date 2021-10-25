USE [ShoppingCart]
GO
DELETE FROM [dbo].[ORDERDETAIL]
GO
DELETE FROM [dbo].[ORDER]
GO
DELETE FROM [dbo].[USER]
GO
DELETE FROM [dbo].[PRODUCT]
GO
DELETE FROM [dbo].[CATEGORY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] ON 
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (1, N'Beauty & Grooming', CAST(N'2021-10-25T13:13:06.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (2, N'Women Western Wear', CAST(N'2021-10-25T13:13:06.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (3, N'Men Western Wear', CAST(N'2021-10-25T13:13:06.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (4, N'Ethnic Wear', CAST(N'2021-10-25T13:13:06.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (5, N'Footwear', CAST(N'2021-10-25T13:13:06.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (6, N'Ethnic Bottoms', CAST(N'2021-10-25T13:13:06.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (7, N'Jewellery', CAST(N'2021-10-25T13:13:06.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (8, N'Accessories', CAST(N'2021-10-25T13:13:06.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (9, N'Mobile Phones', CAST(N'2021-10-25T14:38:44.773' AS DateTime), CAST(N'2021-10-25T15:34:26.587' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (1, N'Printed Women White T-Shirt', 2, N'D:\Images\Printed Women White T-Shirt.jpg', 10)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (2, N'Women Round Neck Black T-Shirt', 2, N'D:\Images\Women Round Neck Black T-Shirt.jpeg', 5)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (3, N'Men Slim Fit Collar Formal Shirt', 3, N'D:\Images\men-27s-formal-shirt-500x500.jpg', 3)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (4, N'Women Printed Anarkali Kurta', 4, N'D:\Images\women anarkali kurta.jpeg', 2)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (5, N'Women Printed Daily Wear Georgette Saree', 4, N'D:\Images\women georgette saree.jpeg', 5)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (6, N'Men Fit T-Shirt', 3, N'D:\Images\men tshirt.jpeg', 3)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (7, N'Men Fancy T-Shirt ', 3, N'D:\Images\Men fancy tshirt.jpg', 2)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (8, N'Women Fancy Sandals', 5, N'D:\Images\women sandals.jpg', 3)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (9, N'Women Sandals', 5, N'D:\Images\women sandals2.jpg', 1)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (10, N'Men Fancy Shoe', 5, N'D:\Images\men shoe 1.jpg', 1)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (11, N'Men Formal Shoe Brown Fit', 5, N'D:\Images\Men leather shoe2.jpg', 3)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (12, N'Sukhi Jewellery Set For Women', 7, N'D:\Images\jewel1.jpg', 2)
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [IMAGE], [STOCK]) VALUES (14, N'Fashionable Layered Necklace For Women', 7, N'D:\Images\jewel2.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
SET IDENTITY_INSERT [dbo].[USER] ON 
GO
INSERT [dbo].[USER] ([ID], [NAME], [EMAILID], [MOBILENO], [ADDRESS], [CREATEDAT], [MODIFIEDAT], [ISDELETED]) VALUES (1, N'Shyam', N'shyam@gmail.com', N'9123423452', N'#2 rajiv street, Chennai', CAST(N'2021-10-25T13:20:19.623' AS DateTime), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[USER] OFF
GO

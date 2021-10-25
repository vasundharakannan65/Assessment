USE [ShoppingCart]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PRODUCT__CATEGOR__286302EC]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRODUCT]'))
ALTER TABLE [dbo].[PRODUCT] DROP CONSTRAINT [FK__PRODUCT__CATEGOR__286302EC]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ORDERDETA__PRODU__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[ORDERDETAIL]'))
ALTER TABLE [dbo].[ORDERDETAIL] DROP CONSTRAINT [FK__ORDERDETA__PRODU__35BCFE0A]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ORDERDETA__ORDER__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[ORDERDETAIL]'))
ALTER TABLE [dbo].[ORDERDETAIL] DROP CONSTRAINT [FK__ORDERDETA__ORDER__36B12243]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ORDER__USERID__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[ORDER]'))
ALTER TABLE [dbo].[ORDER] DROP CONSTRAINT [FK__ORDER__USERID__2F10007B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USER__ISDELETED__2C3393D0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER] DROP CONSTRAINT [DF__USER__ISDELETED__2C3393D0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USER__CREATEDAT__2B3F6F97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER] DROP CONSTRAINT [DF__USER__CREATEDAT__2B3F6F97]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CATEGORY__ISDELE__25869641]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CATEGORY] DROP CONSTRAINT [DF__CATEGORY__ISDELE__25869641]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CATEGORY__CREATE__24927208]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CATEGORY] DROP CONSTRAINT [DF__CATEGORY__CREATE__24927208]
END
GO
/****** Object:  Table [dbo].[USER]    Script Date: 25-10-2021 17:35:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USER]') AND type in (N'U'))
DROP TABLE [dbo].[USER]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 25-10-2021 17:35:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCT]') AND type in (N'U'))
DROP TABLE [dbo].[PRODUCT]
GO
/****** Object:  Table [dbo].[ORDERDETAIL]    Script Date: 25-10-2021 17:35:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ORDERDETAIL]') AND type in (N'U'))
DROP TABLE [dbo].[ORDERDETAIL]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 25-10-2021 17:35:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ORDER]') AND type in (N'U'))
DROP TABLE [dbo].[ORDER]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 25-10-2021 17:35:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CATEGORY]') AND type in (N'U'))
DROP TABLE [dbo].[CATEGORY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 25-10-2021 17:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[CREATEDAT] [datetime] NOT NULL,
	[MODIFIEDAT] [datetime] NULL,
	[ISDELETED] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 25-10-2021 17:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERDETAIL]    Script Date: 25-10-2021 17:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERDETAIL](
	[ORDERID] [int] NULL,
	[PRODUCTID] [int] NULL,
	[PRICE] [decimal](18, 0) NULL,
	[QUANTITY] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 25-10-2021 17:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[CATEGORYID] [int] NULL,
	[IMAGE] [varchar](250) NOT NULL,
	[STOCK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 25-10-2021 17:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[EMAILID] [varchar](100) NOT NULL,
	[MOBILENO] [varchar](10) NOT NULL,
	[ADDRESS] [varchar](200) NOT NULL,
	[CREATEDAT] [datetime] NOT NULL,
	[MODIFIEDAT] [datetime] NULL,
	[ISDELETED] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CATEGORY] ADD  DEFAULT (getdate()) FOR [CREATEDAT]
GO
ALTER TABLE [dbo].[CATEGORY] ADD  DEFAULT ((0)) FOR [ISDELETED]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT (getdate()) FOR [CREATEDAT]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT ((0)) FOR [ISDELETED]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD FOREIGN KEY([USERID])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([ORDERID])
REFERENCES [dbo].[ORDER] ([ID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([PRODUCTID])
REFERENCES [dbo].[PRODUCT] ([ID])
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([CATEGORYID])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
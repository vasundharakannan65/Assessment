USE [ShoppingCart]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEPRODUCT]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UPDATEPRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_UPDATEPRODUCT]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATECATEGORY]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UPDATECATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_UPDATECATEGORY]
GO
/****** Object:  StoredProcedure [dbo].[SP_GETPRODUCTBYID]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GETPRODUCTBYID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GETPRODUCTBYID]
GO
/****** Object:  StoredProcedure [dbo].[SP_GETCATEGORYBYID]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GETCATEGORYBYID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GETCATEGORYBYID]
GO
/****** Object:  StoredProcedure [dbo].[SP_GETALLPRODUCT]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GETALLPRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GETALLPRODUCT]
GO
/****** Object:  StoredProcedure [dbo].[SP_GETALLCATEGORY]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GETALLCATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_GETALLCATEGORY]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETECATEGORY]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DELETECATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DELETECATEGORY]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADDUSER]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_ADDUSER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_ADDUSER]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADDPRODUCT]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_ADDPRODUCT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_ADDPRODUCT]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADDCATEGORY]    Script Date: 25-10-2021 17:34:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_ADDCATEGORY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_ADDCATEGORY]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADDCATEGORY]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To add new category into category table>
CREATE PROCEDURE [dbo].[SP_ADDCATEGORY](@NAME VARCHAR(100))
AS
BEGIN
	BEGIN TRY
		IF((SELECT COUNT(ID) FROM CATEGORY 
					 WHERE NAME = @NAME) > 0)
			BEGIN
				RAISERROR('Category %s already exits!',16,6,@NAME);
			END
		ELSE IF(@NAME IS NOT NULL AND (SELECT COUNT(ID) FROM CATEGORY 
					 WHERE NAME = @NAME) = 0)
			BEGIN	
				INSERT INTO CATEGORY(NAME) VALUES(@NAME) 
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		-- Use RAISERROR inside the CATCH block to return error  
		-- information about the original error that caused  
		-- execution to jump to the CATCH block.  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   );  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ADDPRODUCT]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To add new product into product table>
CREATE PROCEDURE [dbo].[SP_ADDPRODUCT]( @NAME VARCHAR(100)
									   ,@CATEGORYID INT
									   ,@IMAGE VARCHAR(250)
									   ,@STOCK INT)
AS
BEGIN
	
	DECLARE @CID INT
	SET @CID = (SELECT ID FROM CATEGORY WHERE ID = @CATEGORYID)

	BEGIN TRY
		IF((SELECT COUNT(ID) FROM PRODUCT 
					 WHERE NAME = @NAME) > 0)
			BEGIN
				RAISERROR('Product %s already exits!',16,6,@NAME);
			END
		ELSE IF(@CID IS NULL) 
			BEGIN 
				RAISERROR('Category ID is mandatory',16,6,@CATEGORYID) 
			END
		ELSE IF(@CID NOT IN (SELECT ID FROM CATEGORY))
			BEGIN 
				RAISERROR('Category ID %d does not exists!',16,6,@CID)
			END
		ELSE IF(@NAME IS NOT NULL AND @CATEGORYID IS NOT NULL AND @IMAGE IS NOT NULL AND
		   @STOCK IS NOT NULL AND (@CID IN (SELECT ID FROM CATEGORY)))
			BEGIN	
				INSERT INTO PRODUCT(NAME,CATEGORYID,IMAGE,STOCK) VALUES(@NAME,@CATEGORYID,@IMAGE,@STOCK) 
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		-- Use RAISERROR inside the CATCH block to return error  
		-- information about the original error that caused  
		-- execution to jump to the CATCH block.  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   );  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ADDUSER]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To add new user into user table>
CREATE PROCEDURE [dbo].[SP_ADDUSER](@NAME VARCHAR(100)
								   ,@EMAILID VARCHAR(100)
								   ,@MOBILENO VARCHAR(10)
								   ,@ADDRESS VARCHAR(200))
AS
BEGIN
	BEGIN TRY
		--IF((SELECT COUNT(ID) FROM USER 
		--			 WHERE NAME = @NAME AND EMAILID = @EMAILID) > 0)
		--	BEGIN
		--		RAISERROR('User %s already exits!',16,6,@NAME);
		--	END
		IF(@NAME IS NOT NULL AND @EMAILID IS NOT NULL AND @MOBILENO IS NOT NULL AND
		   @ADDRESS IS NOT NULL)
			BEGIN	
				INSERT INTO [USER](NAME,EMAILID,MOBILENO,ADDRESS) VALUES(@NAME,@EMAILID,@MOBILENO,@ADDRESS) 
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		-- Use RAISERROR inside the CATCH block to return error  
		-- information about the original error that caused  
		-- execution to jump to the CATCH block.  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   );  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETECATEGORY]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To delete category into category table>
CREATE PROCEDURE [dbo].[SP_DELETECATEGORY](@ID INT)
AS
BEGIN
	DECLARE @CATEGORYID INT
	SET @CATEGORYID = (SELECT ID FROM CATEGORY WHERE ID = @ID)
	BEGIN TRY
		IF(@CATEGORYID IS NULL)
			BEGIN
				RAISERROR('CATEGORY ID %d DOES NOT EXITS!',16,6,@ID);
			END 
		ELSE
			BEGIN	
				UPDATE CATEGORY 
				SET ISDELETED = 1 
				WHERE ID = @CATEGORYID
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ERRORMESSAGE NVARCHAR(4000);  
		DECLARE @ERRORSEVERITY INT;  
		DECLARE @ERRORSTATE INT;  
  
		SELECT   
			@ERRORMESSAGE = ERROR_MESSAGE(),  
			@ERRORSEVERITY = ERROR_SEVERITY(),  
			@ERRORSTATE = ERROR_STATE();  
  
		-- USE RAISERROR INSIDE THE CATCH BLOCK TO RETURN ERROR  
		-- INFORMATION ABOUT THE ORIGINAL ERROR THAT CAUSED  
		-- EXECUTION TO JUMP TO THE CATCH BLOCK.  
		RAISERROR (@ERRORMESSAGE, -- MESSAGE TEXT.  
				   @ERRORSEVERITY, -- SEVERITY.  
				   @ERRORSTATE -- STATE.  
				   );  
	END CATCH
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GETALLCATEGORY]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To get all category from category table>
CREATE PROCEDURE [dbo].[SP_GETALLCATEGORY]
AS
BEGIN
	BEGIN TRY
		IF((SELECT COUNT(ID) FROM CATEGORY) IS NULL)
			BEGIN
				RAISERROR('No Category exits!',16,6);
			END
		ELSE
			BEGIN	
				SELECT ID
					  ,NAME 
				FROM CATEGORY 
				WHERE ISDELETED = 0
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		-- Use RAISERROR inside the CATCH block to return error  
		-- information about the original error that caused  
		-- execution to jump to the CATCH block.  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   );  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETALLPRODUCT]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To get all product from product table>
CREATE PROCEDURE [dbo].[SP_GETALLPRODUCT]
AS
BEGIN

	BEGIN TRY
		IF((SELECT COUNT(ID) FROM PRODUCT) IS NULL)
			BEGIN
				RAISERROR('No Product exits!',16,6);
			END
		ELSE
			BEGIN	
				SELECT ID,NAME,CATEGORYID,IMAGE,STOCK 
				FROM PRODUCT
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		-- Use RAISERROR inside the CATCH block to return error  
		-- information about the original error that caused  
		-- execution to jump to the CATCH block.  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   );  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETCATEGORYBYID]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To get category by id from category table>
CREATE PROCEDURE [dbo].[SP_GETCATEGORYBYID](@ID INT)
AS
BEGIN
	DECLARE @CATEGORYID INT
	SET @CATEGORYID = (SELECT ID FROM CATEGORY WHERE ID = @ID)
	BEGIN TRY
		IF(@CATEGORYID IS NULL)
			BEGIN
				RAISERROR('CATEGORY ID %d DOES NOT EXITS!',16,6,@ID);
			END 
		ELSE
			BEGIN	
				SELECT ID,NAME 
				FROM CATEGORY 
				WHERE ID = @CATEGORYID
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ERRORMESSAGE NVARCHAR(4000);  
		DECLARE @ERRORSEVERITY INT;  
		DECLARE @ERRORSTATE INT;  
  
		SELECT   
			@ERRORMESSAGE = ERROR_MESSAGE(),  
			@ERRORSEVERITY = ERROR_SEVERITY(),  
			@ERRORSTATE = ERROR_STATE();  
  
		-- USE RAISERROR INSIDE THE CATCH BLOCK TO RETURN ERROR  
		-- INFORMATION ABOUT THE ORIGINAL ERROR THAT CAUSED  
		-- EXECUTION TO JUMP TO THE CATCH BLOCK.  
		RAISERROR (@ERRORMESSAGE, -- MESSAGE TEXT.  
				   @ERRORSEVERITY, -- SEVERITY.  
				   @ERRORSTATE -- STATE.  
				   );  
	END CATCH
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_GETPRODUCTBYID]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To get product by id from product table>
CREATE PROCEDURE [dbo].[SP_GETPRODUCTBYID](@ID INT)
AS
BEGIN
	DECLARE @PRODUCTID INT
	SET @PRODUCTID = (SELECT ID FROM PRODUCT WHERE ID = @ID)
	BEGIN TRY
		IF(@PRODUCTID IS NULL)
			BEGIN
				RAISERROR('Product ID %d does not exists!',16,6,@ID);
			END 
		ELSE
			BEGIN	
				SELECT ID,NAME,CATEGORYID,IMAGE,STOCK 
				FROM PRODUCT 
				WHERE ID = @ID
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		-- Use RAISERROR inside the CATCH block to return error  
		-- information about the original error that caused  
		-- execution to jump to the CATCH block.  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   );  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATECATEGORY]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To update category into category table>
CREATE PROCEDURE [dbo].[SP_UPDATECATEGORY](@ID INT
										 ,@NAME VARCHAR(100))
AS
BEGIN
	DECLARE @CATEGORYID INT
	SET @CATEGORYID = (SELECT ID FROM CATEGORY WHERE ID = @ID)
	BEGIN TRY
		IF(@CATEGORYID IS NULL)
			BEGIN
				RAISERROR('CATEGORY ID %d DOES NOT EXITS!',16,6,@ID);
			END 
		ELSE
			BEGIN	
				UPDATE CATEGORY 
				SET NAME = @NAME 
				WHERE ID = @CATEGORYID
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ERRORMESSAGE NVARCHAR(4000);  
		DECLARE @ERRORSEVERITY INT;  
		DECLARE @ERRORSTATE INT;  
  
		SELECT   
			@ERRORMESSAGE = ERROR_MESSAGE(),  
			@ERRORSEVERITY = ERROR_SEVERITY(),  
			@ERRORSTATE = ERROR_STATE();  
  
		-- USE RAISERROR INSIDE THE CATCH BLOCK TO RETURN ERROR  
		-- INFORMATION ABOUT THE ORIGINAL ERROR THAT CAUSED  
		-- EXECUTION TO JUMP TO THE CATCH BLOCK.  
		RAISERROR (@ERRORMESSAGE, -- MESSAGE TEXT.  
				   @ERRORSEVERITY, -- SEVERITY.  
				   @ERRORSTATE -- STATE.  
				   );  
	END CATCH
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEPRODUCT]    Script Date: 25-10-2021 17:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Vasundhara>
-- Create date: <25/10/21>
-- Description:	<To update product into product table>
CREATE PROCEDURE [dbo].[SP_UPDATEPRODUCT](  @ID INT
										   ,@NAME VARCHAR(100)
										   ,@CATEGORYID INT
										   ,@IMAGE VARCHAR(250)
										   ,@STOCK INT)
AS
BEGIN
	
	DECLARE @PRODUCTID INT
	SET @PRODUCTID = (SELECT ID FROM PRODUCT WHERE ID = @ID)

	BEGIN TRY
		IF(@PRODUCTID IS NULL)
			BEGIN
				RAISERROR('Product ID %d does not exits!',16,6,@id);
			END
		ELSE
			BEGIN	
				UPDATE PRODUCT 
				SET NAME = @NAME,
					CATEGORYID = @CATEGORYID,
					IMAGE = @IMAGE,
					STOCK = @STOCK 
				WHERE ID = @PRODUCTID
			END
	END TRY 
	BEGIN CATCH 
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		-- Use RAISERROR inside the CATCH block to return error  
		-- information about the original error that caused  
		-- execution to jump to the CATCH block.  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   );  
	END CATCH
END
GO

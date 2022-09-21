
Create Procedure [procsalesOrderDetail]
@SalesOrderID int, 
@SalesOrderDetailID int, 
@CarrierTrackingNumber varchar(25),  
@OrderQty smallint, 
@ProductID int, 
@SpecialOfferID int,
@UnitPrice money, 
@UnitPriceDiscount money,
@LineTotal varchar, 
@rowguid uniqueidentifier, 
@ModifiedDate datetime
AS
BEGIN      
BEGIN TRY        
BEGIN TRANSACTION     
 INSERT INTO Sales.SalesOrderDetail values 
(@SalesOrderID, 
@SalesOrderDetailID , 
@CarrierTrackingNumber ,  
@OrderQty , 
@ProductID , 
@SpecialOfferID ,
@UnitPrice, 
@UnitPriceDiscount ,
@LineTotal, 
@rowguid, 
@ModifiedDate)
 COMMIT TRANSACTION
END TRY
BEGIN CATCH    if(@@TRANCOUNT>0)        
ROLLBACK TRANSACTION

        EXEC dbo.uspLogError
END CATCH
END


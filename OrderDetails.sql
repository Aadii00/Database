use AdventureWorks2019
go
Create Procedure [procsalesOrderDetail]
@SalesOrderID int, 
@SalesOrderDetailID int, 
@CarrierTrackingNumber nvarchar(25),  
@OrderQty smallint, 
@ProductID int, 
@SpecialOfferID int,
@UnitPrice money, 
@UnitPriceDiscount money
AS
BEGIN     
  --SET Identityinsert ON
  --SET Identityinsert Off
BEGIN TRY        
BEGIN TRANSACTION 
 INSERT INTO Sales.Customer
        ([rowguid], [ModifiedDate])
        Values(NEWID(), getdate())

       Declare @Id bigint
        Select @ID = SCOPE_IDENTITY()
 INSERT INTO Sales.SalesOrderDetail values 
(@Id,@SalesOrderID, @CarrierTrackingNumber ,  @OrderQty , @ProductID ,
@SpecialOfferID ,@UnitPrice, @UnitPriceDiscount ,getdate())
 COMMIT TRANSACTION
END TRY
BEGIN CATCH    if(@@TRANCOUNT>0)        
ROLLBACK TRANSACTION

        EXEC dbo.uspLogError
END CATCH
END



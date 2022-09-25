Create Proc [ProcSalesOrderHead]
@SalesOrderID int, 
@RevisionNumber tinyint,
@OrderDate Date,
@DueDate Date,
@ShipDate Date,
@Status tinyint, 
@OnlineOrderFlag tinyint,
@PurchaseOrderNumber nvarchar(25), 
@AccountNumber nvarchar(15), 
@CustomerID int, 
@SalesPersonID int, 
@TerritoryID int, 
@BillToAddressID int, 
@ShipToAddressID int, 
@ShipMethodID int, 
@CreditCardID int, 
@CreditCardApprovalCode varchar(15), 
@CurrencyRateID int, 
@SubTotal money, 
@TaxAmt money, 
@Freight money, 
@Comment nvarchar(128),
@SalesOrderDetailID int,
@CarrierTrackingNumber nvarchar(25),
@OrderQty smallint,
@productId Int,
@SpecialOfferID int,
@UnitPrice money

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
 			 INSERT INTO Sales.SalesOrderHeader values 
			(@SalesOrderID,@RevisionNumber,@OrderDate,@DueDate,@ShipDate, @Status, @OnlineOrderFlag, @PurchaseOrderNumber, 
			@AccountNumber, @CustomerID, @SalesPersonID, @TerritoryID, @BillToAddressID, @ShipToAddressID, @ShipMethodID, 
			@CreditCardID, @CreditCardApprovalCode, @CurrencyRateID, @SubTotal, @TaxAmt, @Freight,@Comment,getdate())
			
			Insert Into Sales.SalesOrderDetail values(@SalesOrderID, @ID,@CarrierTrackingNumber,
			@OrderQty,@productid, @SpecialOfferID, @UnitPrice)

 COMMIT TRANSACTION
END TRY
BEGIN CATCH    if(@@TRANCOUNT>0)        
ROLLBACK TRANSACTION

        EXEC dbo.uspLogError
END CATCH
END
Go



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
(@Id, @salesOrderDetailId,@CarrierTrackingNumber ,  @OrderQty , @ProductID ,
@SpecialOfferID ,@UnitPrice, @UnitPriceDiscount ,getdate())
 COMMIT TRANSACTION
END TRY
BEGIN CATCH    if(@@TRANCOUNT>0)        
ROLLBACK TRANSACTION

        EXEC dbo.uspLogError
END CATCH
END
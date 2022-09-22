select * from[Production].[Product]
select top 10 * from Production.Product

select * from[Production].[ProductInventory]

select * from [Sales].[SalesOrderHeader]

select * from [Sales].[SalesOrderDetail]
Go

--SalesOrderDetail product id only contain id from 700 to 900
--inventory contains product id from 1 to 999

Alter PROC [dbo].[prcSaveEmployeeData]
@EmpName varchar(20),
@EmpEmail varchar(20),
@NationalIDNumber varchar(15),
@LoginID nvarchar(256),
@OrganizationNode hierarchyId,
@JobTitle nvarchar(50),
@BirthDate date,
@MaritalStatus nchar(1),
@Gender nchar(1),
@HireDate date,
@SalariedFlag tinyint,
@VacationHours smallint,
@SickLeaveHours smallint,
@CurrentFlag tinyint,
@Rate money
AS
BEGIN
    -- Set IDENTITYINSERT ON
    
BEGIN TRY
    
    BEGIN TRANSACTION
        -- INSERTING DATA IN MASTER TABLE
        
        INSERT INTO Person.BusinessEntity
        ([rowguid], [ModifiedDate])
        Values(NEWID(), getdate())

       Declare @Id bigint
        Select @ID = SCOPE_IDENTITY()

       INSERT INTO HumanResources.Employee
        ([BusinessEntityID],[NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus],
        [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours],
        [CurrentFlag], [ModifiedDate])
        VALUES(@Id, @NationalIDNumber,@LoginID,@OrganizationNode, @JobTitle,@BirthDate, @MaritalStatus,@Gender,
        @HireDate, @SalariedFlag,@VacationHours,@SickLeaveHours,@CurrentFlag, getdate())
                
         -- @@Identity
        -- INSERT / UPADET DATA in CHILD TABLE(S)
        INSERT INTO HumanResources.EmployeePayHistory
        ([BusinessEntityID], [RateChangeDate], [Rate], [PayFrequency], [ModifiedDate])
        VALUES(@Id, getdate(), @Rate, '1',getdate())
    
    COMMIT TRANSACTION



END TRY
BEGIN CATCH
    if(@@TRANCOUNT>0)
        ROLLBACK TRANSACTION



       EXEC dbo.uspLogError
END CATCH
END

select * from [Sales].[CountryRegionCurrency]
select * from [Sales].[CreditCard]
select * from [Sales].[Currency]
select * from [Sales].[CurrencyRate]
select * from [Sales].[Customer]
select * from [Sales].[PersonCreditCard]
select * from [Sales].[SalesOrderHeaderSalesReason]
select * from [Sales].[SalesPerson]
select * from [Sales].[SalesPersonQuotaHistory]
select * from [Sales].[SalesReason]
select * from [Sales].[SalesTaxRate]
select * from [Sales].[SalesTerritory]
select * from [Sales].[SalesTerritoryHistory]
select * from [Sales].[ShoppingCartItem]
select * from [Sales].[SpecialOffer]
select * from [Sales].[SpecialOfferProduct]
select * from [Sales].[Store]

Select * from Customer

Select CustID, FName FirstName, LtName LastName, City from Customer

Select CustID, FName + ' ' + LtName FullName, City from Customer Select CustID, FName, LtName, City from Customer Where City = 'Kolkata' -- Restriction

Select * from Account

Select * from Account Where MaxDailyTransAmt = 100000

select CustID, FName FirstName, LtName LastName, City from Customer Where FirstName = 'Ramesh' 


Select AcNumber, CustId, AType, AStatus, MaxDailyTransAmt, MaxDailyTransAmt + 10000 NewLimit from Account
Where MaxDailyTransAmt + 10000 > 50000

Select CustID, Upper(FName) FirstNameU, lower(FName) FirstNameL, City, SUBSTRING(City, 1, 3) City3 from Customer

Select replicate('X', 5)
Select Fname, len(FName) from Customer
Select CustID, Upper(FName) FirstNameU, replicate('X', 10 - len(FName)) + Upper(FName) FirstName from Customer

Select Floor(1234.56), round(1234.56, 2), Ceiling(1234.56)

select GetDate()
Select Datepart(m, GetDate())

Select Datepart(m, GetDate()) -- nesting of functions

Select Datepart(m, GetDate()) -- nesting of functions

Select DateDiff(d, GetDate(), (GetDate() + 10)), DateDiff(m, GetDate(), (GetDate() + 100)), DateDiff(YY, GetDate(), (GetDate() + 2000))

Select * from Account Where Day(AOD) <= 15 -- Account opened within the first 15 days of the month

Select * from Account Where Month(AOD) >= 4 And Month(AOD) <= 6 -- Account opened in the first quarter of the year


Select * from Account Where Convert(varchar, Opening_Balance) = '1000'

Select * from Account Where Opening_Balance = '1000'

Select * from Account Where AOD = '2012-02-29'

Select * from Account Where AOD = Convert(date, '2012-05-17')

Select * from Account Where Opening_Balance = Convert(int, '1000')
Select * from Account Where AStatus = 'Suspended' Or AStatus = 'Terminated'
Select * from Account Where AStatus in ('Suspended', 'Terminated')
Select * from Customer Where NewDate Is Not Null -- Is Null

Select CustID, FName, MName, LtName, FName + ' ' + LTName FullName, FName + ' ' + MName + ' ' + LTName FullMidName from Customer
Select CustID, FName, MName, LtName, FName + ' ' + Isnull(LTName, '') FullName, FName + ' ' + IsNull(MName, '') + ' ' + IsNull(LTName, '') FullMidName from Customer

Select *, Convert(varchar, Dob, 1) Dates from Customer
Select Dob, Convert(varchar, Dob, 113) Dates from Customer

Select CustID, Sum(MaxDailyTransAmt), Count(MaxDailyTransAmt), Avg(MaxDailyTransAmt), Min(MaxDailyTransAmt), Max(MaxDailyTransAmt) from Account Group By CustID

Select CustID, Sum(MaxDailyTransAmt), Count(MaxDailyTransAmt), Avg(MaxDailyTransAmt), Min(MaxDailyTransAmt),
Max(MaxDailyTransAmt) from Account
Group By CustID
Having Sum(MaxDailyTransAmt) > 100000 -- Aggregate Row Restriction

Select AcNumber, BCity, Account.Bid from Account, Branch Where Account.BID = Branch.BID
Select AcNumber, BCity, Account.Bid from Account Inner Join Branch On Account.BID = Branch.BID

Select AcNumber, c.CustId, FName from Customer c Inner Join Account a On a.custid = c.CustId

Select AcNumber, c.CustId, FName from Customer c Left Outer Join Account a On a.custid = c.CustId
Select AcNumber, c.CustId, FName from Customer c Left Outer Join Account a On a.custid = c.CustId Where AcNumber is null

Select E.EmpID, E.EmpName, E.Salary, M.EmpID MgrID, M.EmpName MgrName, M.Salary MgrSalary
from Employee E Left Outer Join Employee M On E.MgrCode = m.EmpId

Select Transaction_Type, Sum(Transaction_Amount) Amount from TranDetails Group By Transaction_Type

select  Transaction_Type, medium_of_transaction,  Sum(Transaction_amount) amount from TranDetails Group BY  Transaction_Type, medium_of_transaction

select  Transaction_Type, medium_of_transaction,  Sum(Transaction_amount) amount from TranDetails
Where Transaction_Amount >= 3000   --- single row restriction
Group BY  Transaction_Type, medium_of_transaction
Having Sum(Transaction_amount) > 5000 --- aggregate row restriction

select Transaction_Type, medium_of_transaction,  Sum(Transaction_amount) amount from TranDetails
Where Not (Transaction_Type = 'Deposit' And medium_of_transaction = 'Cash' And Transaction_Amount < 3000)
Group BY  Transaction_Type, medium_of_transaction

Select * from TranDetails Order By DoT
Select Sum(Transaction_Amount) from TranDetails Where Month(DOT) = 1 And Year(DOT) = 2013

Select * from TranDetails Order By TNumber
Offset 0 Rows Fetch Next 4 Rows Only

Select Top (5) * from TranDetails Order By Transaction_Amount Desc

Select * from Customer where CustID in (Select Distinct CustID from Account)  -- ordinary / nested subquery

Select * from Customer where CustID in ('C00001', 'C00002', 'C00003', 'C00004', 'C00006', 'C00007')



Select count(CustID) from Customer

Select Count(Distinct CustID) from Account

Select * from Account Where BID in (Select BID from Branch where BCity = 'Mumbai')

Select * from Employee e where Exists (Select EmpID from Employee m where m.EmpID = e.MgrCode And m.Salary < e.Salary)  -- correlated subquery
Select * from Customer where Exists (Select 'A' from Account Where Account.CustID = Customer.CustID)

Create View V_Customer as Select * from Customer
Select * from V_Customer

Create view [dbo].[v_Customer] As
Select fName + mName + ltname Name, city, mobileno, dob, convert(varchar, dob, 101) FDob from Customer
Where City = 'Delhi'

CREATE View [dbo].[V_Emplpyee_1] as 
    Select EmpName, Salary, Salary * 1.2 NewSalary, ((power(((Salary * 1.2) * 2.7), 3) ) % 7) NuValue, Convert(varchar, Date_of_Birth, 103) BirthDate From Employee 



/*to see the query stored in view*/
Exec sp_helptext 'V_Customer'

Exec sp_helptext 'V_Emplpyee_1'
Exec sp_Help 'Employee'

SELECT OBJECT_DEFINITION (OBJECT_ID('V_Emplpyee_1')) AS ObjectDefinition;

SELECT definition, uses_ansi_nulls, uses_quoted_identifier, is_schema_bound
FROM sys.sql_modules WHERE object_id = OBJECT_ID('V_Emplpyee_1');

/*View is not updatable when:
---------------------------
1. View query projection has expressions
2. View query projection does not contain not null column/s
3. View query contain aggreate function*/

Create View V_Branch as Select BID, BName, BCity from Branch
Select * from V_Branch
Insert into V_Branch values('B444', 'Delhi Cantonment', 'New Delhi')
Update V_Branch Set BName = 'South Ex - II' where BID = 'B444'

Select * from Branch
Delete from Branch where BID = 'B444'
Alter View V_Branch as Select BID, BName, BCity from Branch Where BCity = 'Delhi'
Select * from V_Branch
Insert into V_Branch values('B444', 'Delhi Cantonment', 'New Delhi')

Alter View V_Branch as Select BID, BName, BCity from Branch Where BCity = 'Delhi'
With Check Option
Select * from V_Branch
Insert into V_Branch values('B445', 'Delhi Cantonment', 'New Delhi')

Alter View V_Branch as Select BID, BName, BCity from Branch
union all 
Select 'A', 'A', 'A' where 1 = 0
Insert into V_Branch values('B444', 'Delhi Cantonment', 'New Delhi')

/*Declare
  @var1 int,
  @var2 int
Begin
  set @var1 = 10
  set @var2 = 12
  print 'sum is: ' + convert(varchar, @var1 + @var2)
End*/

Declare
  @var1 int,
  @var2 int
Begin
  set @var1 = 10
  set @var2 = 12
  if (@var1 > @var2)
  Begin
    print '@var1 is greater'
  End
  else if (@var1 < @var2)
  Begin
    print '@var2 is greater'
  End
  Else
  Begin
    print 'Both are equal'
  End
End


Declare
  @var1 int, 
  @var2 int
Begin
  set @var1 = 10
  set @var2 = 12   set @var1 = @var1 + @var2 -- @var1 -> 22, @var2 = 12
  set @var2 = @var1 - @var2 -- @var1 -> 22, @var2 = 10
  set @var1 = @var1 - @var2 -- @var1 -> 12, @var2 = 10 End


Declare
  @var1 int, 
  @var2 int
Begin
  set @var1 = 10
  set @var2 = 12
 
  print '@var1, @var2 - before swap: ' + convert(varchar, @var1) + ' ' + convert(varchar, @var2)
  set @var1 = @var1 + @var2 -- @var1 -> 22, @var2 = 12
  set @var2 = @var1 - @var2 -- @var1 -> 22, @var2 = 10
  set @var1 = @var1 - @var2 -- @var1 -> 12, @var2 = 10
  print '@var1, @var2 - after swap: ' + convert(varchar, @var1) + ' ' + convert(varchar, @var2)
End


Begin
  Declare @FirstName varchar(30)
  Declare @LasttName varchar(30)
  Select @FirstName = FName, @LasttName = LtName from Customer Where CustID = 'C00002'
  Print 'FirstName: ' + @FirstName + ' LastName: ' + @LasttName
End

Begin
  Declare @V_FName varchar(30)
  Declare @V_LtName varchar(30)
  Declare Cur_Customer Cursor For Select FName, LtName from Customer
  open Cur_Customer
  Fetch Next from Cur_Customer into @V_FName, @V_LtName
  while(@@FETCH_STATUS = 0)
  Begin
    Print 'FirstName: ' + @V_FName + ' LastName: ' + @V_LtName
    Fetch Next from Cur_Customer into @V_FName, @V_LtName
  End
  close Cur_Customer
  DeAllocate Cur_Customer
End

Create procedure Proc_Customer
As
Begin
  Declare @V_FName varchar(30)
  Declare @V_LtName varchar(30)
  Declare Cur_Customer Cursor For Select FName, LtName from Customer
  open Cur_Customer
  Fetch Next from Cur_Customer into @V_FName, @V_LtName
  while(@@FETCH_STATUS = 0)
  Begin
    Print 'FirstName: ' + @V_FName + ' LastName: ' + @V_LtName
    Fetch Next from Cur_Customer into @V_FName, @V_LtName
  End
  close Cur_Customer
  DeAllocate Cur_Customer
End

 

Alter procedure Proc_Customer
@vCustID varchar(6)
As
Begin
  Declare @V_FName varchar(30)
  Declare @V_LtName varchar(30)
  Declare Cur_Customer Cursor For Select FName, LtName from Customer Where CustID = @vCustID
  open Cur_Customer
  Fetch Next from Cur_Customer into @V_FName, @V_LtName
  while(@@FETCH_STATUS = 0)
  Begin
    Print 'FirstName: ' + @V_FName + ' LastName: ' + @V_LtName
    Fetch Next from Cur_Customer into @V_FName, @V_LtName
  End
  close Cur_Customer
  DeAllocate Cur_Customer
End

Exec Proc_Customer 'C00008'


Create Procedure Proc_Branch_Insert
@vBID varchar(6),
@vBName varchar(30),
@vBCity varchar(30)
As
Begin Transaction
  Insert into Branch(BID, BName, BCity) values(@vBID, @vBName, @vBCity)
Commit Transaction 


Alter Procedure Proc_Branch_Insert
@vBID varchar(6),
@vBName varchar(30),
@vBCity varchar(30)
As
Begin
  Begin Transaction
    if ((len(@vBName) > 0) And (len(@vBCity) > 0))
    Begin
      Insert into Branch(BID, BName, BCity) values(@vBID, @vBName, @vBCity)
    End
    Else
    Begin
      Print 'Cannot insert blank Branch Name and / City'
    End
  Commit Transaction
End
Exec Proc_Branch_Insert 'B11224', 'Branch1', 'City1'
Exec Proc_Branch_Insert 'B11663', '', '' 
Exec Proc_Branch_Insert 'B11663', 'Branch2', 'City2'

Create Function FindSum(@a int, @b int)
returns int
As
Begin
    Return (@a + @b)
End

Select dbo.FindSum(2, 3)

Begin
 Declare @vResult int
 set @vResult = dbo.FindSum(2, 3)
 Print 'Result is : ' + Convert(varchar, @vResult)
End


Create function factorial(@val int)
returns int
As
Begin
    Declare @ret int
    set @ret = 1
  if (@val > 1 )
  Begin
    set @ret = @val * dbo.factorial(@val - 1)
  End
  return @ret
End

Select dbo.Factorial(5)

Create Function TVF_BranchForCity(@vCity varchar(30))
returns Table
As
Return
Select BId, BName, BCity from Branch Where BCity = @vCity
Select * from dbo.TVF_BranchForCity('Delhi')


Create Function MSTVF_BranchForCity(@vCity varchar(30))
returns @TempBrTable Table
(
  Bid varchar(6),
  BName varchar(30),
  BCity varchar(30),
  Stat varchar(10)
)
As
Begin
  Insert into @TempBrTable
    Select BId, BName, BCity, 'Matched' from Branch Where BCity = @vCity;
  Insert into @TempBrTable
    Select BId, BName, BCity, 'UnMatched' from Branch Where BCity != @vCity; return;
End

Select * from dbo.MSTVF_BranchForCity('Delhi')




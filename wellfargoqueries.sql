Create Table branch (
    bid varchar(10) NOT NULL,
    baddress varchar(30) NULL,
    bcity varchar(20) NULL,
 CONSTRAINT [branch_bid_pk] PRIMARY KEY CLUSTERED
(
    [bid] ASC
)
) ON [PRIMARY]

INSERT branch ([bid],[baddress],[bcity]) VALUES ('NW0001', '492 West 42nd Street','NewYork')
INSERT [branch] ([bid], [baddress], [bcity]) VALUES ('NW0002','1300 I Street','California')
INSERT [branch] ([bid], [baddress], [bcity]) VALUES ('NW0003', '350 New York Avenue Northwest ','Washington')
select * from branch

drop table branch
create PROCEDURE B_branch
AS
BEGIN Transaction
   declare  @b_bid varchar(10)
   declare @b_baddress varchar(50)
   declare @b_bcity varchar(10)
    insert into branch(bid,baddress,bcity) values(@b_bid,@b_bcity,@b_baddress)
Commit Transaction
/*Alter Procedure B_branch
@b_bid varchar(6),
@b_bname varchar(30),
@b_bcity varchar(30)
As
Begin
  Begin Transaction
    if ((len(@b_bname) >= 0) And (len(@b_bcity) >= 0))
    Begin
      Insert into B_Branch(bid, bname, bcity) values(@b_bid, @b_bname, @b_bcity)
    End
    Else
    Begin
      Print 'Cannot insert blank Branch Name and / City'
    End
  Commit Transaction
End*/



ALTER PROCEDURE B_branch
AS
BEGIN
   declare  @b_bid varchar(10)
   declare @b_baddress varchar(50)
   declare @b_bcity varchar(10)
    insert into B_branch values(@b_bid,@b_bcity,@b_baddress)
   insert into branch(bid,baddress,bcity) values('NW0007','West 42nd Avenue','California')
	/*insert into branch(bid,baddress,bcity) values('NW0006','east 34th Avenue','New York')
	insert into branch(bid,baddress,bcity) values('NW0005','West 42nd Avenue','Washington')*/
END

exec B_branch 'NW0008', 'Avenue','California'
select * from branch






Create Table [dbo].[Customer](
    [customer_id] [varchar](10) NOT NULL,
    [fname] [varchar](30) NULL,
    [mname] [varchar](30) NULL,
    [ltname] [varchar](30) NULL,
    [city] [varchar](15) NULL,
    [mobileno] [varchar](10) NULL,
    [occupation] [varchar](10) NULL,
    [dob] [date] NULL,
  
 CONSTRAINT [customer_customerid_pk] PRIMARY KEY CLUSTERED
(
    [customer_id] ASC
)
) ON [PRIMARY]
delete Customer

INSERT [dbo].[customer] ([customer_id], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0001', N'Ramesh', N'Chandra', N'Sharma', N'Delhi', N'9543198345', N'Service', CAST(N'1976-12-06' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0002', N'Avinash', N'Sunder', N'Minha', N'Delhi', N'9876532109', N'Service', CAST(N'1974-10-16' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0004', N'Parul', NULL, N'Gandhi', N'Delhi', N'9876532109', N'Housewife', CAST(N'1976-11-03' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0006', N'Chitresh', NULL, N'Barwe', N'Pune', N'7651298321', N'Student', CAST(N'1992-11-06' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0007', N'Amit', N'Kumar', N'Borkar', N'Mumbai', N'9875189761', N'Student', CAST(N'1981-09-06' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0008', N'Nisha', NULL, N'Damle', N'Mumbai', N'7954198761', N'Service', CAST(N'1975-12-03' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0009', N'Abhishek', NULL, N'Dutta', N'Kolkata', N'9856198761', N'Service', CAST(N'1973-05-22' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0003', N'Abhishek', NULL, N'Dutta', N'Kolkata', N'9856198761', N'Service', CAST(N'1973-05-22' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0005', N'Abhishek', NULL, N'Dutta', N'Kolkata', N'9856198761', N'Service', CAST(N'1973-05-22' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'X0010', N'Abhishek', NULL, N'Dutta', N'Kolkata', N'9856198761', N'Service', CAST(N'1973-05-22' AS Date))

select * from customer;

Create Table [dbo].[Account](
    [acnumber] [varchar](6) NOT NULL,
    [custid] [varchar](6) NULL,
    [bid] [varchar](6) NULL,
    [opening_balance] [int] NULL,
    [aod] [date] NULL,
    [atype] [varchar](10) NULL,
    [astatus] [varchar](10) NULL,
    [MaxDailyTransAmt] [numeric](10, 2) NULL,
 CONSTRAINT [account_acnumber_pk] PRIMARY KEY CLUSTERED
(
    [acnumber] ASC
)
) ON [PRIMARY]
select *from Account

INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0001', N'X0001', N'NW0001', 5000, CAST(N'2022-12-15' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0002', N'X0002', N'NW0002', 10000, CAST(N'2022-06-12' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0003', N'X0003', N'NW0003', 5000, CAST(N'2022-05-17' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0004', N'X0002', N'NW0004', 5000, CAST(N'2022-01-27' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0005', N'X0006', N'NW0006', 10000, CAST(N'2022-12-17' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0006', N'X0007', N'NW0007', 5000, CAST(N'2022-08-12' AS Date), N'Saving', N'Suspended', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0007', N'X0007', N'NW0001', 5000, CAST(N'2022-10-02' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0008', N'X0001', N'NW0003', 10000, CAST(N'2022-11-09' AS Date), N'corporate', N'Terminated', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0009', N'X0003', N'NW0007', 5000, CAST(N'2022-11-30' AS Date), N'savings', N'Terminated', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [custid], [bid], [opening_balance], [aod], [atype], [astatus], [MaxDailyTransAmt]) VALUES (N'N0010', N'X0004', N'NW0002', 10000, CAST(N'2022-03-01' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))


Create Table [dbo].[TranDetails](
    [tnumber] [varchar](6) NOT NULL,
    [acnumber] [varchar](6) NULL,
    [dot] [date] NULL,
    [medium_of_transaction] [varchar](20) NULL,
    [transaction_type] [varchar](20) NULL,
    [transaction_amount] [int] NULL,
 CONSTRAINT [trandetails_tnumber_pk] PRIMARY KEY CLUSTERED
(
    [tnumber] ASC
)
) ON [PRIMARY]

INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00001', N'N0001', CAST(N'2022-01-01' AS Date), N'Cheque', N'Deposit', 2000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00002', N'N0001', CAST(N'2022-02-01' AS Date), N'Cash', N'Withdrawal', 1000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00003', N'N0002', CAST(N'2022-01-01' AS Date), N'Cash', N'Deposit', 2000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00004', N'N0002', CAST(N'2022-02-01' AS Date), N'Cash', N'Deposit', 3000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00005', N'N0007', CAST(N'2022-01-11' AS Date), N'Cash', N'Deposit', 7000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00006', N'N0007', CAST(N'2022-01-13' AS Date), N'Cash', N'Deposit', 9000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00007', N'N0001', CAST(N'2022-03-13' AS Date), N'Cash', N'Deposit', 4000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00008', N'N0001', CAST(N'2022-03-14' AS Date), N'Cheque', N'Deposit', 3000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00009', N'N0001', CAST(N'2022-03-21' AS Date), N'Cash', N'Withdrawal', 9000)
INSERT [dbo].[trandetails] ([tnumber], [acnumber], [dot], [medium_of_transaction], [transaction_type], [transaction_amount]) VALUES (N'T00010', N'N0001', CAST(N'2022-03-22' AS Date), N'Cash', N'Withdrawal', 2000)

select * from trandetails


delete categories
CREATE TABLE [dbo].[categories](
	[bid] [varchar](6) NOT NULL,
	[Customer_id] [varchar](10) NOT NULL,
	[Customer_type] [varchar](8) NULL,
	[AvgMonthly_balance] [int]  NULL,
	[Withdrawal_limit] [int] null,
	[Dailyatm_withdrawal] [int]  null,
	[Account_no][varchar](10) not null,

 CONSTRAINT [categories_account_no_pk] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)ON [PRIMARY]
)

INSERT categories(bid,Account_no,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001', 'X0001', 'Silver','2000','50000','25000')



select * from categories
Create Table Mutualfund(
	[bid] [varchar](6) NULL,
    [customer_id] [varchar](10) NOT NULL,
	[dfo] [date] null,
    [Amount] [varchar] (8) NULL,
 CONSTRAINT [customer_id] PRIMARY KEY CLUSTERED
(
    [customer_id] ASC
)
) ON [PRIMARY]

INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0001', 'X0007', CAST (N'2022-3-26' AS Date),'70000')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X0002', CAST (N'2022-7-16'AS Date),'20000')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X0003', CAST (N'2022-11-6'AS Date),'12000')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X0005', CAST (N'2022-8-3'AS Date),'2000')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X0001', CAST (N'2022-5-20'AS Date),'65000')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X0004', CAST (N'2022-9-2'AS Date),'78000')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X0009', CAST (N'2022-3-18'AS Date),'20500')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X0006', CAST (N'2022-7-6'AS Date),'20000')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X0008', CAST (N'2022-11-9'AS Date),'102000')
INSERT Mutualfund ([bid], [customer_id], [dfo], [Amount]) VALUES (N'NW0010', 'X00010', CAST (N'2022-5-10'AS Date),'6000')

select * from Mutualfund
delete Mutualfund


Select count(CustID) from Customer
Select Count(Distinct CustID) from Account


Select Top (5) * from TranDetails Order By Transaction_Amount Desc

Select * from Customer where CustID in (Select Distinct CustID from Account)  -- ordinary / nested subquery

Select * from Customer where CustID in ('X00001', 'X00002', 'X00003', 'X00004', 'X00006', 'X00007')
Select * from TranDetails Order By DoT
Select Sum(Transaction_Amount) from TranDetails Where Month(DOT) = 1 And Year(DOT) = 2013

Select * from TranDetails Order By TNumber
Offset 0 Rows Fetch Next 4 Rows Only

select Transaction_Type, medium_of_transaction,  Sum(Transaction_amount) amount from TranDetails
Where Not (Transaction_Type = 'Deposit' And medium_of_transaction = 'Cash' And Transaction_Amount < 3000)
Group BY  Transaction_Type, medium_of_transaction

CREATE TABLE [dbo].[categories](
	[bid] [varchar](6) NOT NULL,
	[Customer_id] [varchar](10) NOT NULL,
	[Customer_type] [varchar](8) NULL,
	[AvgMonthly_balance] [int]  NULL,
	[Withdrawal_limit] [int] null,
	[Dailyatm_withdrawal] [int]  null,
	[Account_no][varchar](10) not null,
	[Account_type] [varchar](15) not null,
 FOREIGN KEY (Customer_id) REFERENCES dbo.Customer(Customer_id))

select * from categories
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0001','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0001','Mutual_fund', 'X0002', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0001','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0002','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0003','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0003','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0004','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0003','N0005','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0003','N0006','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0007','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0008','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0003','N0009','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0010','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0011','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0012','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0013','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0014','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0015','Savings', 'X0001', 'Silver','2000','50000','25000')


create PROCEDURE B_branch
AS
BEGIN
   declare  @b_bid varchar(10)
   declare @b_baddress varchar(50)
   declare @b_bcity varchar(10)
    insert into branch(bid,baddress,bcity) values(@b_bid,@b_bcity,@b_baddress)
end
ALTER PROCEDURE B_branch
AS
BEGIN
   declare  @b_bid varchar(10)
   declare @b_baddress varchar(50)
   declare @b_bcity varchar(10)
    insert into branch(bid,baddress,bcity) values(@b_bid,@b_bcity,@b_baddress)
    /*insert into branch(bid,baddress,bcity) values('NW0007','West 42nd Avenue','California')
	insert into branch(bid,baddress,bcity) values('NW0006','east 34th Avenue','New York')
	insert into branch(bid,baddress,bcity) values('NW0005','West 42nd Avenue','Washington')*/
END

exec B_branch 'NW0008','South Avenue','California'
select * from branch
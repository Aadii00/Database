Create Table branch (
    bid varchar(6) NOT NULL,
    bname varchar(30) NULL,
    bcity varchar(30) NULL,
 CONSTRAINT [branch_bid_pk] PRIMARY KEY CLUSTERED
(
    [bid] ASC
)
) ON [PRIMARY]
Create Table [dbo].[Customer](
    [custid] [varchar](6) NOT NULL,
    [fname] [varchar](30) NULL,
    [mname] [varchar](30) NULL,
    [ltname] [varchar](30) NULL,
    [city] [varchar](15) NULL,
    [mobileno] [varchar](10) NULL,
    [occupation] [varchar](10) NULL,
    [dob] [date] NULL,
    [NewDate] [datetime] NULL,
 CONSTRAINT [customer_custid_pk] PRIMARY KEY CLUSTERED
(
    [custid] ASC
)
) ON [PRIMARY]
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

CREATE TABLE [dbo].[Employee](
    [EmpID] [int] NOT NULL,
    [EmpName] [varchar](30) NOT NULL,
    [Salary] [numeric](18, 2) NULL,
    [MgrCode] [int] NULL,
    [Desig] [varchar](20) NULL,
    [Date_of_Birth] [datetime] NOT NULL,
    [Date_of_Joining] [datetime] NOT NULL,
    [EmpAddress] [varchar](100) NOT NULL,
    [PassportNo] [varchar](100) NULL,
 CONSTRAINT [PK_Employee_EmpID] PRIMARY KEY CLUSTERED
(
    [EmpID] ASC
)
) ON [PRIMARY]

Select * from Account Where MaxDailyTransAmt = 50000

Select AcNumber, CustId, AType, AStatus, MaxDailyTransAmt, MaxDailyTransAmt + 10000 NewLimit from Account
Where MaxDailyTransAmt + 10000 > 50000

Create Table School(
                Year int,
                ClassNo int,
                SecID int,
                RollNo int,
                StudName varchar(10),
                Constraint PK_School Primary Key (Year, ClassNo, SecID, RollNo)
                )
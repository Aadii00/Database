



CREATE TABLE [dbo].[categories](
	[bid] [varchar](6) NOT NULL,
	[Customer_id] [varchar](10) NOT NULL,
	[Customer_type] [varchar](8) NULL,
	[AvgMonthly_balance] [int]  NULL,
	[Withdrawal_limit] [int] null,
	[Dailyatm_withdrawal] [int]  null,
	[Account_no][varchar](10) not null,
	[Account_type][varchar](15) not null,
 FOREIGN KEY (Customer_id) REFERENCES dbo.Customer(Customer_id))

select * from categories
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0001','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0010','Mutual_fund', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0001','Corporate', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0002','Recurring_Deposit', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0003','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0003','Mutual_fund', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0004','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0003','N0005','Term_Deposit','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0003','N0006','Recurring_Deposit','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0001','N0007','Savings','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0008','corporate','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0003','N0009','Corporaye','X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0010','Term Deposit', 'X0001', 'Silver','2000','50000','25000')

/*INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0011','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0012','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0013','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0014','Savings', 'X0001', 'Silver','2000','50000','25000')
INSERT categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) VALUES ('NW0002','N0015','Savings', 'X0001', 'Silver','2000','50000','25000')
*/

create view b_categories as select bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal from categories
Select * from b_categories
drop view b_branch
Insert into b_categories values('NW0002','N0015','Savings', 'X0002', 'Gold','2000','50000','25000')

Delete from b_categories where bid= 'NW0002'
Delete from b_categories where Customer_id = 'X0002'
Select * from b_categories

Create Procedure Proc_categories_Insert
    @bid [varchar](6),
	@Customer_id [varchar](10),
	@Customer_type [varchar](8),
	@AvgMonthly_balance [int],
	@Withdrawal_limit [int],
	@Dailyatm_withdrawal [int],
	@Account_no [varchar](10),
	@Account_type[varchar](15)
	
    AS
	Begin Transaction
  Insert into categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) 
  values(@bid,@Customer_id,@Customer_type,@AvgMonthly_balance,@Withdrawal_limit,@Dailyatm_withdrawal,@Account_no,@Account_type)
Commit Transaction

Exec Proc_categories_Insert 'NW0002','0005','Savings', 'X0002', 'Silver','2000','5000','2500'
Exec Proc_categories_Insert 'NW0002','N0005','Savings', 'X0002', 'Silver','2000','5000','2500'

drop procedure Proc_categories_Insert
Select * from categories

Alter Procedure Proc_categories_Insert
@bid [varchar](6),
	@Customer_id [varchar](10),
	@Customer_type [varchar](8),
	@AvgMonthly_balance [int],
	@Withdrawal_limit [int],
	@Dailyatm_withdrawal [int],
	@Account_no [varchar](10),
	@Account_type[varchar](15)
As
Begin
 Begin Transaction
   if ((len(@Account_type) > 0) And (len(@Customer_id) > 0))
   Begin
    Insert into categories(bid,Account_no,Account_type,Customer_id,Customer_type,AvgMonthly_balance,Withdrawal_limit,Dailyatm_withdrawal) 
	values( 'NW0002','N0005','Savings', 'X0002', 'Silver','2000','5000','2500')
   End
    Else
      Begin
          Print 'Cannot insert blank Branch Name and / Locate'
   End
 Commit Transaction
End

Exec Proc_categories_Insert  'NW0002','N0005','Savings', 'X0002', 'Silver','2000','5000','2500'
Exec Proc_categories_Insert  'NW0002','N0005','Savings', 'X0002', 'Silver','2000','5000','2500'

Select * from categories


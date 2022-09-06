CREATE TABLE [dbo].[categories](
	[bid] [varchar](6) NOT NULL,
	[custid] [varchar](10) NOT NULL,
	[ctype] [varchar](8) NULL,
	[ambm] [varchar](20) Not NULL,
	[wl] [varchar] (10)Not null,
	[datm] [varchar](10) Not null,

 CONSTRAINT [categories_custid_pk] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)ON [PRIMARY]
)

INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0001', N'X0001', N'Silver','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0002', N'X0002', N'premium','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0005', N'X0004', N'Silver','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0004', N'X0005', N'gold','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0006', N'X0006', N'premium','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0008', N'X0003', N'Silver','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0010', N'X0008', N'gold','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0003', N'X0009', N'Silver','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0002', N'X0010', N'premium','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0001', N'X0003', N'gold','2000','50,000','25,000')
INSERT categories(bid, custid, ctype, ambm, wl, datm) VALUES (N'NW0007', N'X0001', N'gold','2000','50,000','25,000')

Create View C_categories as Select bid, custid, ctype, ambm, wl, datm from categories
Select * from C_categories
Insert into C_categories values('NW0011', 'X0011', 'Silver', '750','50,000','25,000')
Update C_categories Set ambm = '70000' where BID = 'NW0011'
Delete from C_categories where bid = 'NW0011'
drop view C_categories
alter View C_categories as Select bid, custid, ctype, ambm, wl, datm from C_categories where ambm = '750'


Create procedure Proc_categories
As                                                                                    /*bid, custid, ctype, ambm, wl, datm*/
Begin
  Declare @V_bid varchar(30)
  Declare @V_custid varchar(30)
  Declare Cur_ctype Cursor For Select bid, custid from categories
  open Cur_categories
  Fetch Next from Cur_categories into @V_bid, @V_custid
  while(@@FETCH_STATUS = 0)
  Begin
    Print 'FirstName: ' + @V_bid + ' LastName: ' + @V_custid
    Fetch Next from Cur_Categories into @V_bid, @V_custid
  End
  close Cur_categories
  DeAllocate Cur_categories
End

Exec Proc_categories'NW0008'


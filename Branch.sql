Create Table branch (
    bid varchar(10),
    baddress varchar(30),
    bcity varchar(20),
 CONSTRAINT [branch_bid_pk] PRIMARY KEY CLUSTERED
(
    [bid] ASC
)
) ON [PRIMARY]
 
 drop table branch

INSERT branch ([bid],[baddress],[bcity]) VALUES ('NW0001', '492 West 42nd Street','NewYork')
INSERT [branch] ([bid], [baddress], [bcity]) VALUES ('NW0002','1300 I Street','California')
INSERT [branch] ([bid], [baddress], [bcity]) VALUES ('NW0003', '350 New York Avenue Northwest ','Washington')
select * from branch

create view b_branch as select bid, baddress,bcity from branch
Select * from b_Branch
drop view b_branch
Insert into b_branch values('NW012','Rome','California')

Delete from b_branch where bid= 'NW012'
Delete from b_branch where baddress = 'Rome'
Select * from b_branch

Alter View b_branch
as
Select bid,baddress,bcity  from branch union all Select 'A', 'A', 'A' where 1 = 0
Insert into b_branch values('NW012','Rome','California')


Create Procedure Proc_Branch_Insert
    @Vbid [varchar](10),
    @Vbaddress [varchar](30),
    @Vbcity[varchar](50)
    AS
	Begin Transaction
  Insert into Branch(bid, baddress,bcity) values(@Vbid,@Vbaddress, @Vbcity)
Commit Transaction

drop proc  Proc_Branch_Insert
Exec Proc_Branch_Insert'NW012','Rome','New York'
Select * from Branch

Alter Procedure Proc_Branch_Insert
@Vbid [varchar](10),
    @Vbaddress [varchar](30),
    @Vbcity[varchar](50)
As
Begin
 Begin Transaction
   if ((len(@vbcity) > 0) And (len(@Vbaddress) > 0))
   Begin
    Insert into Branch(bid,baddress,bcity) values(@Vbid,@Vbaddress,@Vbcity)
   End
    Else
      Begin
          Print 'Cannot insert blank Branch Name and / Locate'
   End
 Commit Transaction
End

Exec Proc_Branch_Insert 'NW022','Bravia','California'
Exec Proc_Branch_Insert 'NW023','North Avenue','California'

select * from branch
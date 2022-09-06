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
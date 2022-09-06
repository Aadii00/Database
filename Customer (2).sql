
Create Table [dbo].[Customer](
    [custid] [varchar](6) NOT NULL,
    [fname] [varchar](30) NULL,
    [mname] [varchar](30) NULL,
    [ltname] [varchar](30) NULL,
    [city] [varchar](15) NULL,
    [mobileno] [varchar](10) NULL,
    [occupation] [varchar](10) NULL,
    [dob] [date] NULL,
  
 CONSTRAINT [customer_custid_pk] PRIMARY KEY CLUSTERED
(
    [custid] ASC
)
) ON [PRIMARY]

INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'C00001', N'Ramesh', N'Chandra', N'Sharma', N'Delhi', N'9543198345', N'Service', CAST(N'1976-12-06' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'C00001', N'Avinash', N'Sunder', N'Minha', N'Delhi', N'9876532109', N'Service', CAST(N'1974-10-16' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'C00004', N'Parul', NULL, N'Gandhi', N'Delhi', N'9876532109', N'Housewife', CAST(N'1976-11-03' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'C00006', N'Chitresh', NULL, N'Barwe', N'Pune', N'7651298321', N'Student', CAST(N'1992-11-06' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'C00007', N'Amit', N'Kumar', N'Borkar', N'Mumbai', N'9875189761', N'Student', CAST(N'1981-09-06' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'C00008', N'Nisha', NULL, N'Damle', N'Mumbai', N'7954198761', N'Service', CAST(N'1975-12-03' AS Date))
INSERT [dbo].[customer] ([custid], [fname], [mname], [ltname], [city], [mobileno], [occupation], [dob]) VALUES (N'C00009', N'Abhishek', NULL, N'Dutta', N'Kolkata', N'9856198761', N'Service', CAST(N'1973-05-22' AS Date))
select * from customer;


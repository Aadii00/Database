CREATE TABLE [LOCATION](
[LOCATE_Id] INT,
[State_Name] VARCHAR(15)  NOT Null,
CONSTRAINT [PK_LOCATE_Id] PRIMARY KEY CLUSTERED
(
[LOCATE_Id] ASC
)
) ON [PRIMARY]





select * from [LOCATION]
INSERT [LOCATION] ([LOCATE_Id],[State_Name]) VALUES (11001,'Uttar Pradesh')
INSERT [LOCATION] ([LOCATE_Id],[State_Name]) VALUES (11002,'Delhi')
INSERT [LOCATION] ([LOCATE_Id],[State_Name]) VALUES (11003,'Haryana')




--drop table





CREATE TABLE Location_Cities(
  
  City_Id    INT PRIMARY KEY NOT NUll,
  LOCATE_Id INT,
  City_Name VARCHAR (20)        NOT Null,
  CONSTRAINT FK_locate FOREIGN KEY (LOCATE_Id)
  REFERENCES [LOCATION](LOCATE_Id)
  )
INSERT Location_cities (LOCATE_Id,[City_Id],[City_Name]) VALUES (11001,2001,'Noida')
INSERT Location_cities (LOCATE_Id,[City_Id],[City_Name]) VALUES (11002,2002,'New Delhi')
INSERT Location_cities (LOCATE_Id,[City_Id],[City_Name]) VALUES (11003,2003,'Gurugram')
INSERT Location_cities (LOCATE_Id,[City_Id],[City_Name]) VALUES (11001,2004,'Gorakhpur') 
INSERT Location_cities (LOCATE_Id,[City_Id],[City_Name]) VALUES (11001,2005,'lucknow')
INSERT Location_cities (LOCATE_Id,[City_Id],[City_Name]) VALUES (11003,2006,'Sonipath')


select * from Location_cities

CREATE TABLE Branch (
    Branch_Id INT PRIMARY KEY NOT NULL,
	City_Id   INT   NOT NULL,
    Branch_Address VARCHAR(30)	NULL,
    Branch_Manager VARCHAR(20) NULL,
 CONSTRAINT FK_City_Id FOREIGN KEY (City_Id)
  REFERENCES Location_cities(City_Id)
  )
drop table Branch	

INSERT [Branch] ([Branch_Id],[City_Id],[Branch_address],[Branch_Manager]) VALUES (1001,2001, 'Dlf Sector18','Saurabh Pant')
INSERT [Branch] ([Branch_id],[City_Id],[Branch_address],[Branch_Manager]) VALUES (1002,2002,'Mayur Vihar Metro','Pankaj Kumar')
INSERT [Branch] ([Branch_id],[City_Id],[Branch_address],[Branch_Manager]) VALUES (1003,2003, 'Cyberhub','Kapil Tyagi')
INSERT [Branch] ([Branch_Id],[City_Id],[Branch_address],[Branch_Manager]) VALUES (1004,2004, 'Near Big Bazzar','Adityanath')
INSERT [Branch] ([Branch_Id],[City_Id],[Branch_address],[Branch_Manager]) VALUES (1005,2005, 'Hazarthganj','Mahesh Kumar')
INSERT [Branch] ([Branch_Id],[City_Id],[Branch_address],[Branch_Manager]) VALUES (1006,2006, 'Murthal','Satyendra')
INSERT [Branch] ([Branch_Id],[City_Id],[Branch_address],[Branch_Manager]) VALUES (1007,2001, 'Beta 2 near Omaxe Mall','Rishabh')
INSERT [Branch] ([Branch_Id],[City_Id],[Branch_address],[Branch_Manager]) VALUES (1008,2004, 'Near Gorakhnath Temple','Aditya')

select * from branch

select branch_id,branch_address
from Location_cities
where city_id = '2001'


select * from Citymaster
drop table branch

ALTER TABLE Branch
alter column branch_id varchar

ALTER TABLE Branch
ADD City_id int;


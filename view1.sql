Create View C_categories as Select bid, custid, ctype, ambm, wl, datm from categories
select * from C_categories
Insert into C_categories values('NW0011', 'X0011', 'Silver', '750','50,000','25,000')
Update C_categories Set ambm = '70000' where BID = 'NW0011'
Delete from C_categories where bid = 'NW0011'
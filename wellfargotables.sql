Create Table branch (
    bid varchar(6) NOT NULL,
    baddress varchar(30) NULL,
    bcity varchar(30) NULL,
 CONSTRAINT [branch_bid_pk] PRIMARY KEY CLUSTERED
(
    [bid] ASC
)
) ON [PRIMARY]
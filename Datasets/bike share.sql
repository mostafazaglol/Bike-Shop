select * from bike_share_yr_0
select * from bike_share_yr_1
select * from cost_table
------------------------------------------------

with CTE as (
select * from bike_share_yr_0
union all
select * from bike_share_yr_1 )

select dteday,season,a.yr,weekday,hr,rider_type,riders,price,COGS,
		riders*price as Revenue,riders*COGS as Total_Cost, riders*price - riders*COGS as Profit
from CTE a left outer join cost_table b 
on a.yr = b.yr
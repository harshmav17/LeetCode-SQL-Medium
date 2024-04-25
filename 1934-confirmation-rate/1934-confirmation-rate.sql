with cte1 as (
select a.user_id,count(*) as count_confirmed
from Signups a
left join Confirmations b on a.user_id=b.user_id
where action='confirmed'
group by a.user_id),

cte2 as (
select a.user_id,count(*) as count_all
from Signups a
left join Confirmations b on a.user_id=b.user_id
group by a.user_id)


select b.user_id,round(ifnull(count_confirmed,0)/count_all,2) as confirmation_rate
from cte1 a
right join cte2 b on a.user_id=b.user_id
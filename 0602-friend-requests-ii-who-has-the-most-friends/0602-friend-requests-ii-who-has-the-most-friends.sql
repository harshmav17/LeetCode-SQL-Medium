/* Write your T-SQL query statement below */
with cte as
(select requester_id,count(*) as num
from RequestAccepted 
group by requester_id
union all
select accepter_id,count(*) as num
from RequestAccepted 
group by accepter_id
),

cte1 as(
select requester_id as id,sum(num) as num
from cte
group by requester_id)

select id,num from cte1
where num = (Select MAX(Num) from cte1)



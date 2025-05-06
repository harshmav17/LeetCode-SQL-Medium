/* Write your T-SQL query statement below */
-- select * from sales
-- order by product_id,year

select product_id,year as first_year,quantity,price from (
select *,dense_rank() over(partition by product_id order by year) as rn 
from sales)a
where rn=1
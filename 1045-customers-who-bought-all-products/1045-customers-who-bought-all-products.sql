/* Write your T-SQL query statement below */
select customer_id from (
select customer_id,count(product_key) as cnt 
from (select distinct customer_id,product_key from Customer)x
group by customer_id)a
where cnt = (select count(product_key) from Product)

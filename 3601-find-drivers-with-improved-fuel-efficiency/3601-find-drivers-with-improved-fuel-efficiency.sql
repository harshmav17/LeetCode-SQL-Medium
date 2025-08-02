/* Write your T-SQL query statement below */
select * from (
select distinct a.driver_id,c.driver_name,ROUND(Avg(a.distance_km/a.fuel_consumed),2) as first_half_avg,ROUND(Avg(b.distance_km/b.fuel_consumed),2) as second_half_avg,
ROUND((Avg(b.distance_km/b.fuel_consumed) - Avg(a.distance_km/a.fuel_consumed)),2) as efficiency_improvement
from trips a
join trips b on (month(a.trip_date) between 1 and 6) and (month(b.trip_date) between 7 and 12) and a.driver_id = b.driver_id
join drivers c on a.driver_id = c.driver_id
group by a.driver_id,c.driver_name
)a
where efficiency_improvement > 0
order by efficiency_improvement desc,driver_name
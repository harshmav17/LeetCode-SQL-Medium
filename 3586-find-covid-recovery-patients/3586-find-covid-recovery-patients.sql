/* Write your T-SQL query statement below */
;with cte as (
select a.patient_id,c.patient_name,c.age,a.test_date as test_date_p,b.test_date as test_date_n,
       row_number() over(partition by a.patient_id order by a.test_date) as rn_positive,
	   row_number() over(partition by a.patient_id order by a.test_date) as rn_negative
from covid_tests a
join covid_tests b on a.result = 'Positive' and b.result = 'Negative' and a.patient_id = b.patient_id and a.test_date<b.test_date
join patients c on a.patient_id = c.patient_id
)

select patient_id,patient_name,age,DATEDIFF(DAY,test_date_p,test_date_n) as recovery_time 
from cte
where rn_positive = 1 and rn_negative=1
order by recovery_time,patient_name
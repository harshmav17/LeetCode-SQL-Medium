select top 1 person_name from (
    select person_name,Sum(weight) over(order by turn) as cumm_sum
    from Queue
)a
where cumm_sum <= 1000
order by cumm_sum desc
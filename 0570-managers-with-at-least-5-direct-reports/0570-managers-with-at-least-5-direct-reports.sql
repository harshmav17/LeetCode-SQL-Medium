with cte as (
select managerId,count(*) as count_M from Employee
where managerid is not null
group by  managerId)


select a.name from Employee a 
join cte b on a.id=b.managerId
where b.count_M>=5;
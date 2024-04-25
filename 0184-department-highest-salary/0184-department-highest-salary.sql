SELECT
  d.name AS Department,
  e.name AS Employee,
  e.salary
FROM
  employee e
  LEFT JOIN department d ON d.id = e.departmentid
  LEFT JOIN (
    SELECT
      departmentid,
      MAX(salary) AS max
    FROM
      employee
    GROUP BY
      departmentid
  ) m ON m.departmentid = e.departmentid
WHERE m.max = e.salary
  AND d.name IS NOT NULL;
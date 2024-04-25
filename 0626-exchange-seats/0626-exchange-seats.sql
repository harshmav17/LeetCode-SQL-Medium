SELECT ROW_NUMBER() OVER (ORDER BY CASE WHEN id % 2 = 1 THEN id + 1 ELSE id - 1 END) AS id, student
FROM seat

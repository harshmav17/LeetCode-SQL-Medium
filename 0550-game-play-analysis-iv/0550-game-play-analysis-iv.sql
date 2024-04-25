WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) as first_login_date
    FROM Activity
    GROUP BY player_id
)

SELECT ROUND(SUM(CASE WHEN a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY) THEN 1 ELSE 0 END) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM Activity a
JOIN FirstLogin f ON a.player_id = f.player_id;
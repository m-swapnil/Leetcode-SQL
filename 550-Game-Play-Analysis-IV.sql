WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity 
    GROUP BY player_id 
),
NextDayLogin AS (
    SELECT DISTINCT a.player_id
    FROM Activity a
    JOIN FirstLogin f
    ON a.player_id = f.player_id
    AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
)
SELECT ROUND(COUNT(DISTINCT n.player_id) / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM FirstLogin f
LEFT JOIN NextDayLogin n
ON f.player_id = n.player_id;

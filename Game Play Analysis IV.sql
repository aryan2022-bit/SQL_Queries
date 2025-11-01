WITH t1 AS (
    SELECT player_id,
            MIN(event_date) AS first_login_date
            FROM Activity
            GROUP BY player_id
)

SELECT ROUND(
            COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
        FROM Activity
        JOIN t1
        ON Activity.player_id = t1.player_id
        AND Activity.event_date = DATE_ADD(t1.first_login_date, INTERVAL 1 DAY)

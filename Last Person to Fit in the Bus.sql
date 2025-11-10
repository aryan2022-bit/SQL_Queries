SELECT person_name
FROM (
    SELECT person_name,
    SUM(weight) OVER (ORDER BY turn) AS total_current_running_weight
    FROM Queue
) t
WHERE total_current_running_weight <= 1000
ORDER BY total_current_running_weight DESC
LIMIT 1

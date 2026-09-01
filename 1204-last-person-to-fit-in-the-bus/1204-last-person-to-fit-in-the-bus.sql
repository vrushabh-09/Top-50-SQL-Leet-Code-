# Write your MySQL query statement below
SELECT person_name
FROM (SELECT *, SUM(weight) OVER(ORDER BY turn)as bus_weight
    FROM Queue
    )t
WHERE t.bus_weight<=1000
ORDER BY t.bus_weight DESC 
LIMIT 1;

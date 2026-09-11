# Write your MySQL query statement belo
WITH cte as(
    SELECT visited_on, SUM(amount) as daily_amount
    FROM Customer
    GROUP BY visited_on),
    cte2 as(
        SELECT visited_on, SUM(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount 
        FROM cte 
    )
SELECT visited_on, amount, ROUND((amount/7),2) as average_amount
FROM cte2
WHERE visited_on>=(SELECT visited_on FROM cte LIMIT 1 OFFSET 6)
ORDER BY visited_on;

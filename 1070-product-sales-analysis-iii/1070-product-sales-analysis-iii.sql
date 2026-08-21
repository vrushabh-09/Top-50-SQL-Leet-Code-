# Write your MySQL query statement below
WITH cte as(SELECT *, rank() OVER(Partition by product_id ORDER BY year)as rnk
FROM Sales)
SELECT product_id, year as first_year, quantity, price
FROM cte
WHERE rnk=1;
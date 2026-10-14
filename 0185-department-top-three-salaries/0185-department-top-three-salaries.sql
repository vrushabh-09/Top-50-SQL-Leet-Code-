# Write your MySQL query statement below
WITH ranked_emp as
    (
        SELECT *, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) as rnk 
        FROM Employee
    )

SELECT d.name as "Department", e.name as "Employee", e.salary as "Salary"
FROM ranked_emp e 
JOIN Department d 
ON e.departmentId=d.id
WHERE e.rnk<=3;

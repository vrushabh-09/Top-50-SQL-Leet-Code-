-- # Write your MySQL query statement below
SELECT mgr.employee_id as employee_id, mgr.name as name, COUNT(*)as reports_count, ROUND(AVG(emp.age))as average_age
FROM Employees emp
JOIN Employees mgr 
ON emp.reports_to=mgr.employee_id 
GROUP BY mgr.employee_id, mgr.name
ORDER BY mgr.employee_id;

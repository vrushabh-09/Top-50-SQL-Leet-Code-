# Write your MySQL query statement below
SELECT mgr.name
FROM Employee mgr 
JOIN Employee e
ON e.managerId=mgr.id
GROUP BY mgr.id,mgr.name
HAVING COUNT(*)>=5;


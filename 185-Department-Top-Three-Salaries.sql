SELECT 
    D.name AS Department,
    E.name AS Employee,
    E.salary AS Salary
FROM Department AS D
INNER JOIN Employee AS E ON D.id = E.departmentId
WHERE (
    SELECT COUNT(DISTINCT E2.salary)
    FROM Employee AS E2
    WHERE E2.departmentId = E.departmentId AND E2.salary > E.salary
) < 3;

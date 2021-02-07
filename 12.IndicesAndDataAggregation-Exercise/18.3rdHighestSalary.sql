SELECT DISTINCT SQ.DepartmentID, SQ.Salary AS ThirdHighestSalary
    FROM (
        SELECT DepartmentID, Salary, DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
            FROM Employees
        ) AS SQ
    WHERE SQ.Rank = 3;
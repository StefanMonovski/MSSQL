SELECT TOP (10) E.FirstName, E.LastName, E.DepartmentID
    FROM Employees AS E
    JOIN (
        SELECT DepartmentID, AVG(Salary) AS AverageDepartmentSalary FROM Employees GROUP BY DepartmentID
        ) AS SQ ON E.DepartmentID = SQ.DepartmentID
    WHERE E.Salary > SQ.AverageDepartmentSalary
    ORDER BY DepartmentID;
SELECT *
    INTO #Employees
    FROM Employees
    WHERE Salary > 30000;

DELETE
    FROM #Employees
    WHERE ManagerID = 42;

UPDATE #Employees
SET
    Salary += 5000
    WHERE DepartmentID = 1;

SELECT DepartmentID, AVG(Salary) AS AverageSalary
    FROM #Employees
    GROUP BY DepartmentID;
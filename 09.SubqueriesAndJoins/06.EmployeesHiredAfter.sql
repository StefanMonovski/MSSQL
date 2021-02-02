SELECT E.FirstName, E.LastName, E.HireDate, D.Name AS DeptName
    FROM Employees AS E
    JOIN Departments AS D ON D.DepartmentID = E.DepartmentID
    WHERE DATEPART(YEAR, E.HireDate) >= 1999 AND (D.Name = 'Sales' OR D.Name = 'Finance')
    ORDER BY E.HireDate;
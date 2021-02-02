SELECT TOP (50) E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeName,
    M.FirstName + ' ' + M.LastName AS ManagerName, D.Name AS DepartmentName
    FROM Employees AS E
    JOIN Employees AS M ON M.EmployeeID = E.ManagerID
    JOIN Departments D ON D.DepartmentID = E.DepartmentID
    ORDER BY E.EmployeeID;
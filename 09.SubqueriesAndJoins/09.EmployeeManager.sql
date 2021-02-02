SELECT E.EmployeeID, E.FirstName, E.ManagerID, M.FirstName AS ManagerName
    FROM Employees AS E
    JOIN Employees AS M ON M.EmployeeID = E.ManagerID
    WHERE E.ManagerID IN (3, 7)
    ORDER BY E.EmployeeID;
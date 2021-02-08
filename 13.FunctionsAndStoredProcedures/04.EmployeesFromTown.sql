CREATE PROC usp_GetEmployeesFromTown(@townName VARCHAR(50)) AS
SELECT E.FirstName, E.LastName
    FROM Employees AS E
    JOIN Addresses AS A ON A.AddressID = E.AddressID
    JOIN Towns AS T ON T.TownID = A.TownID
    WHERE T.Name = @townName;
CREATE PROC usp_EmployeesBySalaryLevel(@level VARCHAR(10)) AS
SELECT SQ.FirstName, SQ.LastName
    FROM (
        SELECT FirstName, LastName, dbo.ufn_GetSalaryLevel(Salary) AS Level FROM Employees
        ) AS SQ
    WHERE SQ.Level = @level;
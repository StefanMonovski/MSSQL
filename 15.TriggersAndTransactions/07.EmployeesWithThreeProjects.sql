CREATE PROC usp_AssignProject(@employeeId INT, @projectId INT) AS
BEGIN TRANSACTION
IF (SELECT COUNT(EmployeeID) FROM EmployeesProjects WHERE EmployeeID = @employeeId) + 1 > 3
    BEGIN
        ROLLBACK;
        THROW 50001, 'The employee has too many projects!', 1;
    END;
INSERT INTO EmployeesProjects (EmployeeID, ProjectID)
    VALUES
        (@employeeId, @projectId)
COMMIT;
CREATE TABLE Deleted_Employees (
    EmployeeId INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(50) NOT NULL,
    DepartmentId INT NOT NULL,
    Salary MONEY NOT NULL,
    );

CREATE TRIGGER tr_AddToDeletedEmployeesOnEmployeeDelete
    ON Employees FOR DELETE AS
    INSERT INTO Deleted_Employees (FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary)
        SELECT FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary
        FROM deleted;
CREATE TABLE Employees (
    Id INT IDENTITY,
    CONSTRAINT PK_EmployeeId PRIMARY KEY (Id),
    Name VARCHAR(30) NOT NULL,
    );

CREATE TABLE Projects (
    Id INT IDENTITY,
    CONSTRAINT PK_ProjectId PRIMARY KEY (Id),
    Name VARCHAR(30) NOT NULL,
    );

CREATE TABLE EmployeesProjects (
    EmployeeId INT,
    ProjectId INT,
    CONSTRAINT PK_EmployeesProjects PRIMARY KEY (EmployeeId, ProjectId),
    CONSTRAINT FK_EmployeesProjectsEmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
    CONSTRAINT FK_EmployeesProjectsProjectId FOREIGN KEY (ProjectId) REFERENCES Projects(Id),
    );
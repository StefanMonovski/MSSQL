CREATE DATABASE SoftUni;

CREATE TABLE Towns (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_TownId PRIMARY KEY (Id),
    Name VARCHAR(MAX) NOT NULL,
    );

CREATE TABLE Addresses (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_AddressId PRIMARY KEY (Id),
    AddressText VARCHAR(MAX) NOT NULL,
    TownId INT NOT NULL,
    CONSTRAINT FK_AddressTownId FOREIGN KEY (TownId) REFERENCES Towns(Id),
    );

CREATE TABLE Departments (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_DepartmentId PRIMARY KEY (Id),
    Name VARCHAR(MAX) NOT NULL,
    );

CREATE TABLE Employees (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_EmployeeId PRIMARY KEY (Id),
    FirstName VARCHAR(MAX) NOT NULL,
    MiddleName VARCHAR(MAX) NOT NULL,
    LastName VARCHAR(MAX) NOT NULL,
    JobTitle VARCHAR(MAX) NOT NULL,
    DepartmentId INT NOT NULL,
    CONSTRAINT FK_EmployeeDepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
    HireDate DATE NOT NULL,
    Salary DECIMAL NOT NULL,
    AddressId INT NOT NULL,
    CONSTRAINT FK_EmployeeAddressId FOREIGN KEY (AddressId) REFERENCES Addresses(Id),
    );
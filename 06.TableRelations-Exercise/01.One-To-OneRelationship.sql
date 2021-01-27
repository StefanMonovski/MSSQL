CREATE TABLE Persons (
    PersonID INT IDENTITY,
    FirstName VARCHAR(30) NOT NULL,
    Salary DECIMAL(7, 2) NOT NULL,
    PassportID INT NOT NULL,
    );

CREATE TABLE Passports (
    PassportID INT NOT NULL,
    PassportNumber CHAR(8) NOT NULL,
    );

INSERT INTO Persons (firstname, salary, PassportID)
    VALUES
        ('Roberto', 43300.00, 102),
        ('Tom', 56100.00, 103),
        ('Yana', 60200.00, 101);

INSERT INTO Passports (PassportID, PassportNumber)
    VALUES
        (101, 'N34FG21B'),
        (102, 'K65LO4R7'),
        (103, 'ZE657QP2');

ALTER TABLE Persons
    ADD CONSTRAINT PK_PersonId PRIMARY KEY (PersonID),
        CONSTRAINT UQ_PassportId UNIQUE (PassportId);

ALTER TABLE Passports
    ADD CONSTRAINT PK_PassportId PRIMARY KEY (PassportID),
        CONSTRAINT UQ_PassportNumber UNIQUE (PassportNumber);

ALTER TABLE Persons
    ADD CONSTRAINT FK_PersonPassportId FOREIGN KEY (PassportID) REFERENCES Passports(PassportID);
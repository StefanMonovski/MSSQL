CREATE TABLE Drivers (
    Id INT IDENTITY,
    CONSTRAINT PK_DriverId PRIMARY KEY (Id),
    Name VARCHAR(50) NOT NULL,
    );

CREATE TABLE Cars (
    Registration CHAR(8),
    CONSTRAINT PK_CarRegistration PRIMARY KEY (Registration),
    DriverId INT NOT NULL,
    CONSTRAINT UQ_DriverId UNIQUE (DriverId),
    CONSTRAINT FK_CarDriverId FOREIGN KEY (DriverId) REFERENCES Drivers(Id),
    );
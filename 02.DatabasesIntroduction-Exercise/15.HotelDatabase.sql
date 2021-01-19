CREATE DATABASE Hotel;

CREATE TABLE Employees (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_EmployeeId PRIMARY KEY (Id),
    FirstName VARCHAR(MAX) NOT NULL,
    LastName VARCHAR(MAX) NOT NULL,
    Title VARCHAR(MAX) NOT NULL,
    Notes VARCHAR(MAX),
    );

CREATE TABLE Customers (
    AccountNumber INT NOT NULL,
    CONSTRAINT PK_CustomerAccountNumber PRIMARY KEY (AccountNumber),
    FirstName VARCHAR(MAX) NOT NULL,
    LastName VARCHAR(MAX) NOT NULL,
    PhoneNumber VARCHAR(MAX) NOT NULL,
    EmergencyName VARCHAR(MAX) NOT NULL,
    EmergencyNumber VARCHAR(MAX) NOT NULL,
    Notes VARCHAR(MAX),
    );

CREATE TABLE RoomStatus (
    RoomStatus VARCHAR(100) NOT NULL,
    CONSTRAINT PK_RoomStatus PRIMARY KEY (RoomStatus),
    Notes VARCHAR(MAX),
    );

CREATE TABLE RoomTypes (
    RoomType VARCHAR(100) NOT NULL,
    CONSTRAINT PK_RoomType PRIMARY KEY (RoomType),
    Notes VARCHAR(MAX),
    );

CREATE TABLE BedTypes (
    BedType VARCHAR(100) NOT NULL,
    CONSTRAINT PK_BedType PRIMARY KEY (BedType),
    Notes VARCHAR(MAX),
    );

CREATE TABLE Rooms (
    RoomNumber INT NOT NULL,
    CONSTRAINT PK_RoomNumber PRIMARY KEY (RoomNumber),
    RoomType VARCHAR(100) NOT NULL,
    CONSTRAINT FK_RoomType FOREIGN KEY (RoomType) REFERENCES RoomTypes(RoomType),
    BedType VARCHAR(100) NOT NULL,
    CONSTRAINT FK_BedType FOREIGN KEY (BedType) REFERENCES BedTypes(BedType),
    Rate DECIMAL NOT NULL,
    RoomStatus VARCHAR(100) NOT NULL,
    CONSTRAINT FK_RoomStatus FOREIGN KEY (RoomStatus) REFERENCES RoomStatus(RoomStatus),
    Notes VARCHAR(MAX),
    );

CREATE TABLE Payments (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_PaymentId PRIMARY KEY (Id),
    EmployeeId INT NOT NULL,
    CONSTRAINT FK_PaymentEmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
    PaymentDate DATE NOT NULL,
    AccountNumber INT NOT NULL,
    CONSTRAINT FK_PaymentAcountNumber FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber),
    FirstDateOccupied DATE NOT NULL,
    LastDateOccupied DATE NOT NULL,
    TotalDays INT NOT NULL,
    AmountCharged DECIMAL NOT NULL,
    TaxRate DECIMAL NOT NULL,
    TaxAmount DECIMAL NOT NULL,
    PaymentTotal DECIMAL NOT NULL,
    Notes VARCHAR(MAX),
    );

CREATE TABLE Occupancies (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_OccupancyId PRIMARY KEY (Id),
    EmployeeId INT NOT NULL,
    CONSTRAINT FK_OccupancyEmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
    DateOccupied DATE NOT NULL,
    AccountNumber INT NOT NULL,
    CONSTRAINT FK_OccupancyAccountNumber FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber),
    RoomNumber INT NOT NULL,
    RateApplied DECIMAL NOT NULL,
    PhoneCharge DECIMAL NOT NULL,
    Notes VARCHAR(MAX),
    );

INSERT INTO Employees (FirstName, LastName, Title)
    VALUES
        ('Maxim', 'Osborn', 'Front desk'),
        ('Ira', 'Pearson', 'Adminstrative'),
        ('Anton', 'Devlin', 'Manager');

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber)
    VALUES
        (39257, 'Jackson', 'Wheatley', '(243) 611-8834', 'Mary Wheatley', '(501) 803-4953'),
        (40285, 'Beatrice', 'Becker', '(501) 803-4953', 'Matt Becker', '(779) 232-6106'),
        (18429, 'Nora', 'Hester', '(397) 624-4660', 'Diego Hester', '(266) 325-1688');

INSERT INTO RoomStatus (RoomStatus)
    VALUES
        ('vacant'),
        ('occupied'),
        ('out of order');

INSERT INTO RoomTypes (RoomType)
    VALUES
        ('single'),
        ('double'),
        ('suite');

INSERT INTO BedTypes (BedType)
    VALUES
        ('twin'),
        ('standard'),
        ('queen');

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus)
    VALUES
        (101, 'single', 'twin', 100.00, 'vacant'),
        (201, 'double', 'standard', 150.00, 'occupied'),
        (301, 'suite', 'queen', 200.00, 'out of order');

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied,
                      TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal)
    VALUES
        (1, '2018-06-15', 39257, '2018-06-13', '2018-06-14', 2, 100.00, 0.20, 20.00, 120.00),
        (3, '2019-10-04', 18429, '2019-10-01', '2019-10-03', 3, 150.00, 0.20, 30.00, 180.00),
        (2, '2020-05-27', 40285, '2020-05-25', '2020-05-26', 2, 100.00, 0.20, 20.00, 120.00);

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge)
    VALUES
        (2, '2021-01-18', 18429, 101, 100.00, 0.00),
        (1, '2021-01-19', 39257, 201, 150.00, 5.00),
        (3, '2021-01-20', 40285, 101, 100.00, 0.00);
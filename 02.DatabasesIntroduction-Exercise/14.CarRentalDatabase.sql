CREATE DATABASE CarRental;

CREATE TABLE Categories (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_CategoryId PRIMARY KEY (Id),
    CatagoryName VARCHAR(MAX) NOT NULL,
    DailyRate DECIMAL NOT NULL,
    WeeklyRate DECIMAL NOT NULL,
    MonthlyRate DECIMAL NOT NULL,
    WeekendRate DECIMAL NOT NULL,
    );

CREATE TABLE Cars (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_CarId PRIMARY KEY (Id),
    PlateNumber INT NOT NULL,
    Manufacturer VARCHAR(MAX) NOT NULL,
    Model VARCHAR(MAX) NOT NULL,
    CarYear DATE NOT NULL,
    CategoryId INT NOT NULL,
    CONSTRAINT FK_CatagoryId FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    Doors INT NOT NULL,
    Picture VARBINARY(2000),
    Condition VARCHAR(MAX) NOT NULL,
    Available VARCHAR(MAX) NOT NULL,
    );

CREATE TABLE Employees (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_EmployeesId PRIMARY KEY (Id),
    FirstName VARCHAR(MAX) NOT NULL,
    LastName VARCHAR(MAX) NOT NULL,
    Title VARCHAR(MAX) NOT NULL,
    Notes VARCHAR(MAX),
    );

CREATE TABLE Customers (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_CustomerId PRIMARY KEY (Id),
    DriverLicenceNumber INT NOT NULL,
    FullName VARCHAR(MAX) NOT NULL,
    Address VARCHAR(MAX) NOT NULL,
    City VARCHAR(MAX) NOT NULL,
    ZIPCode INT NOT NULL,
    Notes VARCHAR(MAX),
    );

CREATE TABLE RentalOrders (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_RentalOrderId PRIMARY KEY (Id),
    EmployeeId INT NOT NULL,
    CONSTRAINT FK_EmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
    CustomerId INT NOT NULL,
    CONSTRAINT FK_CustomerId FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    CarId INT NOT NULL,
    CONSTRAINT FK_CarId FOREIGN KEY (CarId) REFERENCES Cars(Id),
    TankLevel VARCHAR(MAX) NOT NULL,
    KilometrageStart INT NOT NULL,
    KilometrageEnd INT NOT NULL,
    TotalKilometrage INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalDays INT NOT NULL,
    RateApplied DECIMAL NOT NULL,
    TaxRate DECIMAL NOT NULL,
    OrderStatus VARCHAR(MAX) NOT NULL,
    Notes VARCHAR(MAX),
    );

INSERT INTO Categories (CatagoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
    VALUES
        ('Economy', 20.00, 100.00, 1500.00, 75.00),
        ('Compact', 30.00, 125.00, 2000.00, 100.00),
        ('Premium', 50.00, 150.00, 2500.00, 125.00);

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Condition, Available)
    VALUES
        (53298, 'Chevrolet', 'Aveo', '2002', 1, 4, 'fair', 'available'),
        (27364, 'Ford', 'Focus', '2007', 2, 2, 'good', 'unavailable'),
        (84193, 'Nissan', 'Maxima', '2014', 3, 4, 'excellent', 'available');

INSERT INTO Employees (FirstName, LastName, Title)
    VALUES
        ('Simon', 'Franks', 'trainee'),
        ('Lewis', 'Powell', 'coordinator'),
        ('Alisa', 'Sherman', 'specialist');

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City, ZIPCode)
    VALUES
        (197542, 'Cooper Hook', '1548 Haymond Rocks Road', 'Eugene', 9740),
        (754014, 'Nicholas Calvert', '102 Southend Avenue', 'Blackbrook', 4603),
        (619473, 'Benjamin Koch', '125 Creek Street', 'Queensland', 4405);

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd,
                          TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus)
    VALUES
        (1, 3, 2, 'full', 23565, 23780, 215, '2018-06-12', '2018-06-13', 2, 0.10, 0.20, 'completed'),
        (2, 1, 1, 'half', 34520, 35185, 665, '2019-08-01', '2019-08-07', 7, 0.15, 0.20, 'completed'),
        (3, 2, 3, 'empty', 12940, 13453, 513, '2020-11-23', '2020-11-24', 2, 0.15, 0.20, 'completed');
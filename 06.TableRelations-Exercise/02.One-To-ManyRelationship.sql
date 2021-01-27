CREATE TABLE Models (
    ModelID INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    ManufacturerID INT NOT NULL,
    );

CREATE TABLE Manufacturers (
    ManufacturerID INT IDENTITY,
    Name VARCHAR(30) NOT NULL,
    EstablishedOn DATE NOT NULL,
    );

INSERT INTO Models (ModelID, Name, ManufacturerID)
    VALUES
        (101, 'X1', 1),
        (102, 'i6', 1),
        (103, 'Model S', 2),
        (104, 'Model X', 2),
        (105, 'Model 3', 2),
        (106, 'Nova', 3);

INSERT INTO Manufacturers (Name, EstablishedOn)
    VALUES
        ('BMW', '1916-03-07'),
        ('Tesla', '2003-01-01'),
        ('Lada', '1966-05-01');

ALTER TABLE Models
    ADD CONSTRAINT PK_ModelId PRIMARY KEY (ModelID);

ALTER TABLE Manufacturers
    ADD CONSTRAINT PK_ManufacturerId PRIMARY KEY (ManufacturerID);

ALTER TABLE Models
    ADD CONSTRAINT FK_ModelManufacturerId FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID);
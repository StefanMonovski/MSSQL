CREATE TABLE People (
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    Picture VARBINARY(2000),
    Height FLOAT(2),
    Weight FLOAT(2),
    Gender CHAR CHECK (Gender = 'm' OR Gender = 'f') NOT NULL,
    Birthdate DATE NOT NULL,
    Biography NVARCHAR(MAX),
    );

INSERT INTO People (Name, Height, Weight, Gender, Birthdate)
    VALUES ('Stephen', 180.2, 70.3, 'm', '2002-12-21'),
        ('Michael', 190.4, 80.5, 'm', '2000-10-13'),
        ('Alexandra', 160.5, 50.2, 'f', '2001-03-17'),
        ('Tracy', 170.9, 60.7, 'f', '1999-02-04'),
        ('Clara', 150.1, 40.4, 'f', '2005-11-06');
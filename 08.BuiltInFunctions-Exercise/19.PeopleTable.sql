CREATE TABLE People (
    Id INT IDENTITY,
    CONSTRAINT PK_PersonId PRIMARY KEY (Id),
    Name VARCHAR(30) NOT NULL,
    Birthdate DATETIME NOT NULL,
    );

INSERT INTO People (Name, Birthdate)
    VALUES
        ('Victor', '2000-12-07'),
        ('Steven', '1992-09-10'),
        ('Stephen', '1910-09-19'),
        ('John', '2010-01-06');

SELECT Name, DATEDIFF(YEAR, Birthdate, GETDATE()) AS AgeInYears, DATEDIFF(MONTH, Birthdate, GETDATE()) AS AgeInMonths,
    DATEDIFF(DAY, Birthdate, GETDATE()) AS AgeInDays, DATEDIFF(MINUTE, Birthdate, GETDATE()) AS AgeInMinutes
    FROM People;
CREATE DATABASE Movies;

CREATE TABLE Directors (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_DirectorId PRIMARY KEY (Id),
    DirectorName VARCHAR(MAX) NOT NULL,
    Notes VARCHAR(MAX),
    );

CREATE TABLE Genres (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_GenreId PRIMARY KEY (Id),
    GenreName VARCHAR(MAX) NOT NULL,
    Notes VARCHAR(MAX),
    );

CREATE TABLE Categories (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_CatagoryId PRIMARY KEY (Id),
    CategoryName VARCHAR(MAX) NOT NULL,
    Notes VARCHAR(MAX),
    );

CREATE TABLE Movies (
    Id INT IDENTITY NOT NULL,
    CONSTRAINT PK_MovieId PRIMARY KEY (Id),
    Title VARCHAR(MAX) NOT NULL,
    DirectorId INT NOT NULL,
    CONSTRAINT FK_DirectorId FOREIGN KEY (DirectorId) REFERENCES Directors(Id),
    CopyrightYear DATE NOT NULL,
    Length TIME NOT NULL,
    GenreId INT NOT NULL,
    CONSTRAINT FK_GenreId FOREIGN KEY (GenreId) REFERENCES Genres(Id),
    CatagoryId INT NOT NULL,
    CONSTRAINT FK_CatagoryId FOREIGN KEY (CatagoryId) REFERENCES Genres(Id),
    Rating VARCHAR(MAX),
    Notes VARCHAR(MAX),
    );

INSERT INTO Directors (DirectorName)
    VALUES
        ('Frank Darabont'),
        ('Francis Ford Coppola'),
        ('Christopher Nolan'),
        ('Sidney Lumet'),
        ('Quentin Tarantino');

INSERT INTO Genres (GenreName)
    VALUES
        ('Action'),
        ('Adventure'),
        ('Comedy'),
        ('Crime'),
        ('Drama');

INSERT INTO Categories (CategoryName)
    VALUES
        ('Animation'),
        ('Feature-length'),
        ('Fictional'),
        ('Live-action'),
        ('Non-fictional');

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CatagoryId)
    VALUES
        ('The Shawshank Redemption', 1, '1994', '02:22:00', 5, 2),
        ('The Godfather', 2, '1972', '02:55:00', 4, 4),
        ('The Dark Knight', 3, '2008', '02:32:00', 1, 3),
        ('12 Angry Men', 4, '1957', '01:36:00', 4, 4),
        ('Pulp Fiction', 5, '1994', '02:34:00', 5, 2);
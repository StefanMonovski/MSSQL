CREATE TABLE Mountains (
    Id INT IDENTITY,
    CONSTRAINT PK_MountainId PRIMARY KEY (Id),
    Name VARCHAR(30) NOT NULL,
    );

CREATE TABLE Peaks (
    Id INT IDENTITY,
    CONSTRAINT PK_PeakId PRIMARY KEY (Id),
    MountainId INT NOT NULL,
    CONSTRAINT FK_PeakMountainId FOREIGN KEY (MountainId) REFERENCES Mountains(Id),
    );
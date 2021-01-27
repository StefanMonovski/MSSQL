CREATE TABLE Teachers (
    TeacherID INT IDENTITY (101, 1),
    Name VARCHAR(30) NOT NULL,
    ManagerID INT,
    );

INSERT INTO Teachers (Name, ManagerID)
    VALUES
        ('John', NULL),
        ('Maya', 106),
        ('Silvia', 106),
        ('Ted', 105),
        ('Mark', 101),
        ('Greta', 101);

ALTER TABLE Teachers
    ADD CONSTRAINT PK_TeacherId PRIMARY KEY (TeacherID),
        CONSTRAINT FK_ManagerId FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID);
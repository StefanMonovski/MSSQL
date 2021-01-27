CREATE TABLE Students (
    StudentID INT IDENTITY,
    Name VARCHAR(30) NOT NULL,
    );

CREATE TABLE Exams (
    ExamID INT IDENTITY (101, 1),
    Name VARCHAR(30) NOT NULL,
    );

CREATE TABLE StudentsExams (
    StudentID INT NOT NULL,
    ExamID INT NOT NULL,
    );

INSERT INTO Students (Name)
    VALUES
        ('Mila'),
        ('Toni'),
        ('Ron');

INSERT INTO Exams (Name)
    VALUES
        ('SpringMVC'),
        ('Neo4j'),
        ('Oracle 11g');

INSERT INTO StudentsExams (StudentID, ExamID)
    VALUES
        (1, 101),
        (1, 102),
        (2, 101),
        (3, 103),
        (2, 102),
        (2, 103);

ALTER TABLE Students
    ADD CONSTRAINT PK_StudentId PRIMARY KEY (StudentID);

ALTER TABLE Exams
    ADD CONSTRAINT PK_ExamId PRIMARY KEY (ExamID);

ALTER TABLE StudentsExams
    ADD CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID, ExamID),
        CONSTRAINT FK_StudentsExamsStudentId FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
        CONSTRAINT FK_StudentsExamsExamId FOREIGN KEY (ExamID) REFERENCES Exams(ExamID);
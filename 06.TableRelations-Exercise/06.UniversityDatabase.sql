CREATE DATABASE University;

CREATE TABLE Students (
    StudentID INT NOT NULL,
    CONSTRAINT PK_StudentId PRIMARY KEY (StudentID),
    StudentNumber INT NOT NULL,
    StudentName VARCHAR(30) NOT NULL,
    MajorID INT NOT NULL,
    );

CREATE TABLE Majors (
    MajorID INT NOT NULL,
    CONSTRAINT PK_MajorId PRIMARY KEY (MajorID),
    Name VARCHAR(30) NOT NULL,
    );

ALTER TABLE Students
    ADD CONSTRAINT FK_StudentMajorId FOREIGN KEY (MajorID) REFERENCES Majors(MajorID);

CREATE TABLE Payments (
    PaymentID INT NOT NULL,
    CONSTRAINT PK_PaymentId PRIMARY KEY (PaymentID),
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    StudentID INT NOT NULL,
    );

ALTER TABLE Payments
    ADD CONSTRAINT FK_PaymentStudentId FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

CREATE TABLE Subjects (
    SubjectID INT NOT NULL,
    CONSTRAINT PK_SubjectId PRIMARY KEY (SubjectID),
    SubjectName VARCHAR(30) NOT NULL,
    );

CREATE TABLE Agenda (
    StudentID INT NOT NULL,
    SubjectID INT NOT NULL,
    CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID),
    CONSTRAINT FK_AgendaStudentId FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_AgendaSubjectId FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
    );
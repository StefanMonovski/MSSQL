CREATE DATABASE Bitbucket;

CREATE TABLE Users (
    Id INT IDENTITY,
    CONSTRAINT PK_UserId PRIMARY KEY (Id),
    Username VARCHAR(30) NOT NULL,
    Password VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    );

CREATE TABLE Repositories (
    Id INT IDENTITY,
    CONSTRAINT PK_RepositoryId PRIMARY KEY (Id),
    Name VARCHAR(50) NOT NULL,
    );

CREATE TABLE RepositoriesContributors (
    RepositoryId INT NOT NULL,
    CONSTRAINT FK_RepositoryContributorRepositoryId FOREIGN KEY (RepositoryId) REFERENCES Repositories(Id),
    ContributorId INT NOT NULL,
    CONSTRAINT FK_RepositoryContributorContributorId FOREIGN KEY (ContributorId) REFERENCES Users(Id),
    CONSTRAINT PK_RepositoryContributor PRIMARY KEY (RepositoryId, ContributorId),
    );

CREATE TABLE Issues (
    Id INT IDENTITY,
    CONSTRAINT PK_IssueId PRIMARY KEY (Id),
    Title VARCHAR(255) NOT NULL,
    IssueStatus CHAR(6) NOT NULL,
    RepositoryId INT NOT NULL,
    CONSTRAINT FK_IssueRepositoryId FOREIGN KEY (RepositoryId) REFERENCES Repositories(Id),
    AssigneeId INT NOT NULL,
    CONSTRAINT FK_IssueAssigneeId FOREIGN KEY (AssigneeId) REFERENCES Users(Id),
    );

CREATE TABLE Commits (
    Id INT IDENTITY,
    CONSTRAINT PK_CommitId PRIMARY KEY (Id),
    Message VARCHAR(255) NOT NULL,
    IssueId INT,
    CONSTRAINT FK_CommitIssueId FOREIGN KEY (IssueId) REFERENCES Issues(Id),
    RepositoryId INT NOT NULL,
    CONSTRAINT FK_CommitRepositoryId FOREIGN KEY (RepositoryId) REFERENCES Repositories(Id),
    ContributorId INT NOT NULL,
    CONSTRAINT FK_CommitContributorId FOREIGN KEY (ContributorId) REFERENCES Users(Id),
    );

CREATE TABLE Files (
    Id INT IDENTITY,
    CONSTRAINT PK_FileId PRIMARY KEY (Id),
    Name VARCHAR(100) NOT NULL,
    Size DECIMAL(18, 2) NOT NULL,
    ParentId INT,
    CONSTRAINT FK_FileParentId FOREIGN KEY (ParentId) REFERENCES Files(Id),
    CommitId INT NOT NULL,
    CONSTRAINT FK_FileCommitId FOREIGN KEY (CommitId) REFERENCES Commits(Id),
    );
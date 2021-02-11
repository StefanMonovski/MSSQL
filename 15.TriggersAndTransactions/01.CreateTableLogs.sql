CREATE TABLE Logs (
    LogId INT IDENTITY,
    CONSTRAINT PK_LogId PRIMARY KEY (LogId),
    AccountId INT NOT NULL,
    OldSum MONEY NOT NULL,
    NewSum MONEY NOT NULL,
    );

CREATE TRIGGER tr_AddToLogsOnAccountUpdate
    ON Accounts FOR UPDATE AS
    INSERT INTO Logs (AccountId, OldSum, NewSum)
        SELECT d.Id, d.Balance, i.Balance
        FROM deleted AS d
        JOIN inserted AS i ON i.Id = d.Id
        WHERE d.Balance != i.Balance;
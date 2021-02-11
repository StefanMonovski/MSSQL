CREATE TABLE NotificationEmails (
    Id INT IDENTITY,
    CONSTRAINT PK_NotificationEmailId PRIMARY KEY (Id),
    Recipient INT NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    Body VARCHAR(100) NOT NULL,
    );

CREATE TRIGGER tr_AddToNotificationEmailsOnLog
    ON Logs FOR INSERT AS
    INSERT INTO NotificationEmails (Recipient, Subject, Body)
        SELECT AccountId, 'Balance change for account: ' + CONVERT(VARCHAR, AccountId),
            'On ' + CONVERT(VARCHAR, GETDATE()) + ' your balance was changed from ' + CONVERT(VARCHAR, OldSum)
                + ' to ' + CONVERT(VARCHAR, NewSum) + '.'
        FROM inserted
    GO;
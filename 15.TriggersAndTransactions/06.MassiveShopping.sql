DECLARE @userId INT = (SELECT Id FROM Users WHERE Username = 'Stamat');
DECLARE @gameId INT = (SELECT Id FROM Games WHERE Name = 'Safflower');

BEGIN TRANSACTION
DECLARE @firstSum MONEY = (
    SELECT SUM(Price)
        FROM Items
        WHERE MinLevel BETWEEN 11 AND 12
    );
DECLARE @firstMoney MONEY = (
    SELECT Cash
        FROM UsersGames
        WHERE UserId = @userId AND GameId = @gameId
    );
IF @firstMoney - @firstSum < 0
    BEGIN
        ROLLBACK
    END;
UPDATE UsersGames
SET
    Cash -= @firstSum
    WHERE UserId = @userId AND GameId = @gameId
INSERT INTO UserGameItems
SELECT *
    FROM (
        SELECT Id AS ItemId, (
            SELECT UsersGames.Id
                FROM UsersGames
                WHERE UserId = @userId AND GameId = @gameId
            ) AS UserId
            FROM Items
            WHERE MinLevel BETWEEN 11 AND 12
        ) AS SQ
COMMIT;

BEGIN TRANSACTION
DECLARE @secondSum MONEY = (
    SELECT SUM(Price)
        FROM Items
        WHERE MinLevel BETWEEN 19 AND 21
    );
DECLARE @secondMoney MONEY = (
    SELECT Cash
        FROM UsersGames
        WHERE UserId = @userId AND GameId = @gameId
    );
IF @secondMoney - @secondSum < 0
    BEGIN
        ROLLBACK
    END;
UPDATE UsersGames
SET
    Cash -= @secondSum
    WHERE UserId = @userId AND GameId = @gameId
INSERT INTO UserGameItems
SELECT *
    FROM (
        SELECT Id AS ItemId, (
            SELECT UsersGames.Id
                FROM UsersGames
                WHERE UserId = @userId AND GameId = @gameId
            ) AS UserId
            FROM Items
            WHERE MinLevel BETWEEN 19 AND 21
        ) AS SQ
COMMIT;

SELECT I.Name AS ItemName
    FROM Users
    JOIN UsersGames UG ON Users.Id = UG.UserId
    JOIN Games G ON G.Id = UG.GameId
    JOIN UserGameItems UGI ON UG.Id = UGI.UserGameId
    JOIN Items I ON I.Id = UGI.ItemId
    WHERE Username = 'Stamat' AND G.Name = 'Safflower'
    ORDER BY I.Name;
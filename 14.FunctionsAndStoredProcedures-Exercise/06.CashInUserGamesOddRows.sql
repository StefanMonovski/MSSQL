CREATE FUNCTION ufn_CashInUsersGames(@gameName NVARCHAR(50)) RETURNS @cashSum TABLE (SumCash MONEY) AS
BEGIN
    INSERT INTO @cashSum
    SELECT SUM(SQ.Cash)
        FROM (
            SELECT Cash, ROW_NUMBER() OVER (PARTITION BY G.Name ORDER BY Cash DESC) AS Rank
                FROM UsersGames
                JOIN Games G ON G.Id = UsersGames.GameId
                WHERE G.Name = @gameName
            ) AS SQ
        WHERE SQ.Rank % 2 = 1
    RETURN
END;
CREATE PROC usp_DepositMoney(@accountId INT, @moneyAmount MONEY) AS
IF @moneyAmount > 0
    BEGIN
        UPDATE Accounts
        SET Balance += @moneyAmount
        WHERE Id = @accountId
    END;
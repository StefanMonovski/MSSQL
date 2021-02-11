CREATE PROC usp_TransferMoney(@senderId INT, @recieverId INT, @amount MONEY) AS
IF @amount > 0
    BEGIN
        EXEC usp_WithdrawMoney @senderId, @amount
        EXEC usp_DepositMoney @recieverId, @amount
    END;
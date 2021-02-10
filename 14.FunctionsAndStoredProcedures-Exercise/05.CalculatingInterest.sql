CREATE PROC usp_CalculateFutureValueForAccount(@accountId INT, @interestRate FLOAT) AS
SELECT AccountHolderId AS AccountId, FirstName, LastName, SUM(A.Balance) AS CurrentBalance,
    dbo.ufn_CalculateFutureValue(SUM(A.Balance), @interestRate, 5) AS BalanceIn5Years
    FROM AccountHolders
    JOIN Accounts A ON AccountHolders.Id = A.AccountHolderId
    WHERE A.Id = @accountId
    GROUP BY AccountHolderId, FirstName, LastName;
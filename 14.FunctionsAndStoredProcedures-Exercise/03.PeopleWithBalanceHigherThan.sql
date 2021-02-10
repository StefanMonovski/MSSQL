CREATE PROC usp_GetHoldersWithBalanceHigherThan(@minimumBalance MONEY) AS
SELECT FirstName, LastName
    FROM AccountHolders
    JOIN Accounts A ON AccountHolders.Id = A.AccountHolderId
    GROUP BY FirstName, LastName
    HAVING SUM(A.Balance) > @minimumBalance
    ORDER BY FirstName, LastName;
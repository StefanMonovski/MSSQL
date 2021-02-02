SELECT SQ.ContinentCode, SQ.CurrencyCode, SQ.CurrencyUsage
    FROM (
        SELECT ContinentCode, CurrencyCode, COUNT(CurrencyCode) AS CurrencyUsage,
            RANK() OVER (PARTITION BY ContinentCode ORDER BY COUNT(CurrencyCode) DESC) AS Rank
            FROM Countries
            GROUP BY CurrencyCode, ContinentCode
        ) AS SQ
    WHERE SQ.CurrencyUsage > 1 AND SQ.Rank = 1
    ORDER BY ContinentCode;
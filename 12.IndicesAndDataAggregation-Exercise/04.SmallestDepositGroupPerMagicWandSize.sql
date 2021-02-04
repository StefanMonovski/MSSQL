SELECT TOP (2) DepositGroup
    FROM (
        SELECT WD.DepositGroup, AVG(WD.MagicWandSize) AS AverageMagicWandSize
            FROM WizzardDeposits AS WD
            GROUP BY WD.DepositGroup
        ) AS SQ
    ORDER BY SQ.AverageMagicWandSize
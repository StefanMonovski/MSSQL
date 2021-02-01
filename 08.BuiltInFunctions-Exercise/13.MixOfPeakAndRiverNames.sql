SELECT P.PeakName, R.RiverName, LOWER(LEFT(P.PeakName, LEN(P.PeakName) - 1) + R.RiverName) AS Mix
    FROM Peaks AS P, Rivers AS R
    WHERE SUBSTRING(P.PeakName, LEN(P.PeakName), 1) = SUBSTRING(R.RiverName, 1, 1)
    ORDER BY Mix;
SELECT TOP (5) C.CountryName, SQ.HighestPeakName, SQ.HighestPeakElevation, SQ.Mountain
    FROM (
        SELECT C.CountryName,
            CASE
                WHEN P.PeakName IS NULL THEN '(no highest peak)'
                ELSE P.PeakName
                END AS HighestPeakName,
            CASE
                WHEN P.Elevation IS NULL THEN 0
                ELSE P.Elevation
                END AS HighestPeakElevation,
            CASE
                WHEN M.MountainRange IS NULL THEN '(no mountain)'
                ELSE M.MountainRange
                END AS Mountain, 
            RANK() OVER (PARTITION BY C.CountryName ORDER BY P.Elevation DESC) AS Rank
            FROM Countries AS C
            LEFT JOIN MountainsCountries AS MC ON C.CountryCode = MC.CountryCode
            LEFT JOIN Mountains AS M ON M.Id = MC.MountainId
            LEFT JOIN Peaks AS P ON M.Id = P.MountainId
        ) AS SQ
    WHERE SQ.Rank = 1
    ORDER BY C.CountryName, SQ.HighestPeakName;
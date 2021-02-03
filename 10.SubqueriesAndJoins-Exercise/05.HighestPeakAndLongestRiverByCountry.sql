SELECT TOP (5) C.CountryName, MAX(P.Elevation) AS HighestPeakElevation, MAX(R.Length) AS LongestRiverLength
    FROM Countries AS C
    LEFT JOIN MountainsCountries AS MC ON C.CountryCode = MC.CountryCode
    LEFT JOIN Mountains AS M ON M.Id = MC.MountainId
    LEFT JOIN Peaks AS P ON M.Id = P.MountainId
    LEFT JOIN CountriesRivers AS CR ON C.CountryCode = CR.CountryCode
    LEFT JOIN Rivers AS R ON R.Id = CR.RiverId
    GROUP BY C.CountryName
    ORDER BY MAX(P.Elevation) DESC, MAX(R.Length) DESC, C.CountryName;
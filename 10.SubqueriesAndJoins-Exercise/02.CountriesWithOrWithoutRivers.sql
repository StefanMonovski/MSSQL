SELECT TOP (5) C.CountryName, R.RiverName
    FROM Countries AS C
    LEFT JOIN Continents AS C2 ON C.ContinentCode = C2.ContinentCode
    LEFT JOIN CountriesRivers AS CR ON C.CountryCode = CR.CountryCode
    LEFT JOIN Rivers AS R ON R.Id = CR.RiverId
    WHERE C2.ContinentName = 'Africa'
    ORDER BY C.CountryName;
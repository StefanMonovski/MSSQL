SELECT COUNT(SQ.CountryName) AS Count
    FROM (
        SELECT C.CountryName
            FROM Countries AS C
            LEFT JOIN MountainsCountries AS MC ON C.CountryCode = MC.CountryCode
            WHERE MC.MountainId IS NULL
        ) AS SQ;
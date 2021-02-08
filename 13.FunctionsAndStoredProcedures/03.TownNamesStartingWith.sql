CREATE PROC usp_GetTownsStartingWith(@containString VARCHAR(50)) AS
SELECT Name
    FROM Towns
    WHERE LEFT(Name, LEN(@containString)) = @containString;
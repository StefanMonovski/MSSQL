CREATE PROC usp_SearchForFiles(@fileExtension VARCHAR(30)) AS
BEGIN
    DECLARE @searchString VARCHAR(30);
    SET @searchString = '%' + @fileExtension;
    SELECT Id, Name, CONVERT(VARCHAR, Size) + 'KB' AS Size
        FROM Files
        WHERE Name LIKE @searchString
        ORDER BY Id, Name, Size DESC;
END;
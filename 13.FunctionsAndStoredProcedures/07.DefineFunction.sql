CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(50)) RETURNS INT AS
BEGIN
    DECLARE @i INT = 1
    WHILE(@i <= LEN(@word))
    BEGIN
        IF (CHARINDEX(SUBSTRING(@word, @i, 1), @setOfLetters) < 1)
            RETURN 0
        SET @i += 1;
    END
    RETURN 1
END;
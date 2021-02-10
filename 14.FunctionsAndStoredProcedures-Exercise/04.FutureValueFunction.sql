CREATE FUNCTION ufn_CalculateFutureValue(@sum DECIMAL(18, 4), @interestRate FLOAT, @years INT) RETURNS DECIMAL(18, 4) AS
BEGIN
    RETURN @sum * POWER(1 + @interestRate, @years)
END;
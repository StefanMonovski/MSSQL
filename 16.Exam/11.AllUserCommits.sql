CREATE FUNCTION udf_AllUserCommits(@username VARCHAR(30)) RETURNS INT AS
BEGIN
    DECLARE @userCommitsCount INT;
    DECLARE @usernameId INT;
    SET @usernameId = (
        SELECT Id
            FROM Users
            WHERE Username = @username
        );
    SET @userCommitsCount = (
        SELECT COUNT(DISTINCT (C.Id))
            FROM Commits AS C
            LEFT JOIN Files F ON C.Id = F.CommitId
            LEFT JOIN Users U ON U.Id = C.ContributorId
            WHERE ContributorId = @usernameId
        );
    RETURN @userCommitsCount
END;
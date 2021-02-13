SELECT TOP (5) C.RepositoryId AS Id, R.Name, COUNT(C.Id) AS Commits
    FROM RepositoriesContributors AS RC
    JOIN Repositories AS R ON R.Id = RC.RepositoryId
    JOIN Commits AS C ON R.Id = C.RepositoryId
    GROUP BY C.RepositoryId, R.Name
    ORDER BY Commits DESC, C.RepositoryId, R.Name;
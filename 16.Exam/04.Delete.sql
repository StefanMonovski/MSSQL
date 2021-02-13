DELETE
    FROM RepositoriesContributors
    FROM RepositoriesContributors
    JOIN Repositories AS R ON R.Id = RepositoriesContributors.RepositoryId
    WHERE R.Name = 'Softuni-Teamwork';

DELETE
    FROM Issues
    FROM Issues
    JOIN Repositories AS R ON R.Id = Issues.RepositoryId
    WHERE R.Name = 'Softuni-Teamwork';
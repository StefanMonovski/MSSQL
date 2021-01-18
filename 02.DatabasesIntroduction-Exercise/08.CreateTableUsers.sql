CREATE TABLE Users (
    Id BIGINT IDENTITY PRIMARY KEY,
    Username VARCHAR(30) NOT NULL,
    Password VARCHAR(26) NOT NULL,
    ProfilePicture VARBINARY(900),
    LastLoginTime DATETIME2,
    IsDeleted VARCHAR(5) CHECK (IsDeleted = 'true' OR IsDeleted = 'false') NOT NULL,
    );

INSERT INTO Users (Username, Password, IsDeleted)
    VALUES ('Stephen1945', '1945', 'false'),
        ('Michael3648', '3648', 'false'),
        ('Alexandra9327', '9327', 'false'),
        ('Tracy2041', '2041', 'true'),
        ('Clara6159', '6159', 'true');
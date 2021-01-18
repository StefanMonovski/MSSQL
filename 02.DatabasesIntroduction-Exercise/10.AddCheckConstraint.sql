TRUNCATE TABLE Users;

ALTER TABLE Users
    ADD CHECK (DATALENGTH(Password) >= 5);

INSERT INTO Users (Username, Password, IsDeleted)
    VALUES ('Stephen19453', '19453', 'false'),
        ('Michael36482', '36482', 'false'),
        ('Alexandra93274', '93274', 'false'),
        ('Tracy20418', '20418', 'true'),
        ('Clara61594', '61594', 'true');
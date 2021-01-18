ALTER TABLE Users
    ADD DEFAULT GETDATE() FOR LastLoginTime;

UPDATE Users
SET LastLoginTime = GETDATE()
    WHERE LastLoginTime IS NULL;
ALTER TABLE Users
    DROP CONSTRAINT PK__Users__3214EC07C296BC8C;

ALTER TABLE Users
    ADD PRIMARY KEY (Id, Username);
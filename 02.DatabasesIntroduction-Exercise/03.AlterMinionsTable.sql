ALTER TABLE Minions ADD TownId INT,
	FOREIGN KEY (TownId) REFERENCES Towns (Id);
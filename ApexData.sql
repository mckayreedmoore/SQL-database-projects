USE apexData;


CREATE TABLE tbl_guns (
	gunsId INT PRIMARY KEY NOT NULL IDENTITY(50,1),
	playerName VARCHAR(50) NOT NULL,
	first_gun VARCHAR(25) NOT NULL,
	second_gun VARCHAR(25) NOT NULL
	);


CREATE TABLE tbl_roster (
	roster_id INT PRIMARY KEY NOT NULL IDENTITY (1,1), 
	player_name VARCHAR(50) NOT NULL,
	player_team VARCHAR(15) NOT NULL,
	player_gunsId INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_guns(gunsId) ON UPDATE CASCADE ON DELETE CASCADE
	);

INSERT INTO tbl_guns (playerName, first_gun, second_gun)
VALUES
	('Lulu', 'Kraber', 'R301'),
	('Sweet', 'Flatline','Mastiff'),
	('Aceu', 'Wingman', 'R99'),
	('Rogue', 'R301', 'Peacekeeper'),
	('Daltoosh', 'Wingman', 'Peacekeeper')
;

INSERT INTO tbl_roster (player_name, player_team)
VALUES
	('Lulu','NRG'),
	('Sweet','NRG'),
	('Aceu','NRG'),
	('Rogue','NRG'),
	('Daltoosh','TSM')
;

SELECT * FROM tbl_guns, tbl_roster
INNER JOIN tbl_guns ON tbl_guns.gunsId = tbl_roster.player_gunsId

WHERE player_team = 'NRG'
;

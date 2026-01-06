CREATE DATABASE Lista_Prezentow;

CREATE TABLE Prezenty_2020 (
	id INTEGER PRIMARY KEY,
    Imie_Obdarowanego VARCHAR (20) NOT NULL, 
    Pomysl_na_prezent VARCHAR (100) NOT NULL,
    Cena INTEGER NOT NULL,
    Miejsce_zakupu VARCHAR (20) NOT NULL
);

SELECT *
FROM prezenty_2020;

INSERT INTO prezenty_2020 (id, Imie_Obdarowanego, Pomysl_na_prezent, Cena, Miejsce_zakupu)
VALUES
	(1, 'Misiek', 'Zelazko', 200, 'Amazon'),
    (2, 'Stefan', 'Rekawice', 50, 'Allegro'),
    (3, 'Babcia Hela', 'Diosminex', 40, 'Super-pharm'),
    (4, 'Babcia Danusia', 'Slodycze', 50, 'Carrefour'),
    (5, 'Ola', 'Obraz', 30, 'Empik');
    
SELECT * 
FROM Prezenty_2020;

UPDATE Prezenty_2020
SET Pomysl_na_prezent = 'Rower'
WHERE id = 3;

SELECT *
FROM Prezenty_2020
WHERE id = 3;

DELETE FROM Prezenty_2020
WHERE id = 1;

SELECT *
FROM Prezenty_2020;

ALTER TABLE Prezenty_2020
DROP COLUMN Miejsce_zakupu;

SELECT *
FROM Prezenty_2020;

SELECT Imie_Obdarowanego
FROM Prezenty_2020
WHERE id IN (3, 4, 5);
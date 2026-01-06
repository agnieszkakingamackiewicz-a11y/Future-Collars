CREATE DATABASE Moje_zainteresowania;
CREATE TABLE Zainteresowania (
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nazwa VARCHAR (100),
    Opis VARCHAR (200),
    Data_realizacji DATE
);
INSERT INTO Zainteresowania (Nazwa, Opis)
VALUES
	("Dziewiarstwo", "Robienie na drutach"),
    ("Haft", "Haft płaski na kanwie"),
    ("Gotowanie", "Testowanie nowych przepisów"),
    ("Pieczenie", "Pieczenie ciast"),
    ("Książki", "Czytanie klasyków literatury polskiej");
    
SELECT *
FROM Zainteresowania;

SELECT ID, Data_realizacji
FROM Zainteresowania;

UPDATE Zainteresowania
SET Data_realizacji = "2020-01-01"
WHERE ID = 1;

UPDATE Zainteresowania
SET Data_realizacji = "2021-01-01"
WHERE ID = 2;

UPDATE Zainteresowania
SET Data_realizacji = "2022-01-01"
WHERE ID = 3;

UPDATE Zainteresowania
SET Data_realizacji = "2023-01-01"
WHERE ID = 4;

UPDATE Zainteresowania
SET Data_realizacji = "2024-01-01"
WHERE ID = 5;

SELECT Data_realizacji
FROM Zainteresowania;

SELECT *
FROM Zainteresowania;

DELETE FROM Zainteresowania
WHERE Nazwa IS NULL
   OR Opis IS NULL
   OR Data_realizacji IS NULL;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Zainteresowania
WHERE Nazwa IS NULL
   OR Opis IS NULL
   OR Data_realizacji IS NULL;
   
SELECT *
FROM Zainteresowania;
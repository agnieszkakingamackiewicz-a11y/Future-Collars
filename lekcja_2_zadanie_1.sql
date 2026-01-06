CREATE DATABASE baza_danych;

USE baza_danych;

CREATE TABLE Biblioteczka (
	ID INTEGER,
    Tytul TEXT,
    Data_zakupu DATE
);

INSERT INTO Biblioteczka (id, tytul, data_zakupu)
VALUES (1, 'Chlopi', '2025-12-15');

SELECT *
FROM Biblioteczka
WHERE Tytul = 'Chlopi';

INSERT INTO Biblioteczka (id, tytul, data_zakupu)
VALUES 
	(2, 'Noce i dnie', '2025-11-01'),
    (3, 'Metamorfoza', '2025-10-13');
    
UPDATE Biblioteczka
SET Tytul = 'Krzyzacy'
WHERE ID = 1;

ALTER TABLE Biblioteczka
ADD PRIMARY KEY (id);

UPDATE Biblioteczka
SET Tytul = 'Krzyzacy'
WHERE id = 1;

SELECT *
FROM Biblioteczka;

ALTER TABLE Biblioteczka
ADD COLUMN Autor TEXT;

SELECT *
FROM Biblioteczka;

INSERT INTO Biblioteczka (autor)
VALUES
	('Sienkiewicz', 'Dabrowska', 'Kafka');
    
UPDATE Biblioteczka
SET Autor = 'Sienkiewicz'
WHERE ID = 1;

UPDATE Biblioteczka
SET Autor = 'Dabrowska'
WHERE ID = 2;

UPDATE Biblioteczka
SET Autor = 'Kafka'
WHERE ID = 3;

SELECT *
FROM Biblioteczka;

DELETE FROM Biblioteczka
WHERE ID = 2 
	OR ID = 3;
    
SELECT *
FROM Biblioteczka;

SELECT Autor
FROM Biblioteczka
WHERE ID = 1;
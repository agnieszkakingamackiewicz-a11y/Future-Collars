CREATE DATABASE School_Coding;

CREATE TABLE Mentors (
	id INTEGER PRIMARY KEY,
    Imie VARCHAR (50) NOT NULL,
    Nazwisko VARCHAR (50) NOT NULL,
    Specjalizacja VARCHAR (150) NOT NULL,
    Data_zatrudnienia DATE NOT NULL,
    Data_zwolnienia DATE
);

SELECT *
FROM Mentors;

DROP TABLE Mentors;

CREATE TABLE Mentors (
	id INTEGER PRIMARY KEY,
    Imie VARCHAR (50) NOT NULL,
    Nazwisko VARCHAR (50) NOT NULL,
    Specjalizacja VARCHAR (150) NOT NULL,
    Data_zatrudnienia DATE NOT NULL,
    Data_zwolnienia DATE NOT NULL
);

INSERT INTO Mentors (id, Imie, Nazwisko, Specjalizacja, Data_zatrudnienia, Data_zwolnienia)
VALUES
	(1, 'Agnieszka', 'Markiewicz', 'Szkoleniowiec', '2025-07-01', '2025-11-30'),
    (2, 'Kinga', 'Majewska', 'Asystent', '2023-01-07', '2024-12-12'),
    (3, 'Adam', 'Kotarski', 'Szkoleniowiec', '2020-03-16', '2024-10-13'),
    (4, 'Beata', 'Kotarska', 'Kierownik', '2019-04-23', '2025-06-30'),
    (5, 'Dorota', 'Rybarczyk', 'Szkoleniowiec', '2022-05-26', '2023-01-01'),
    (6, 'Jan', 'Nowak', 'Kierownik', '2025-07-01', '2025-09-23'),
    (7, 'Jan', 'Kowalski', 'Stazysta', '2025-05-01', '2025-08-01'),
    (8, 'Jerry', 'Smith', 'Szkoleniowiec', '2021-11-03', '2024-11-03'),
    (9, 'Wanda', 'Nowak', 'Asystent', '2024-02-03', '2024-12-30'),
    (10, 'Jacek', 'Placek', 'Szkoleniowiec', '2018-06-05', '2025-12-12');
    
SELECT *
FROM Mentors;

UPDATE Mentors
SET Nazwisko = 'Kijowska'
WHERE id = 5;

SELECT *
FROM Mentors
WHERE id = 5;

UPDATE Mentors
SET Specjalizacja = 'Szkoleniowiec'
WHERE id = 9;

SELECT *
FROM Mentors
WHERE id = 9;

ALTER TABLE Mentors
ADD COLUMN Wynagrodzenie INTEGER NOT NULL;

SELECT * 
FROM Mentors;

UPDATE Mentors
SET Wynagrodzenie = 1000
WHERE ID = 1;

UPDATE Mentors
SET Wynagrodzenie = 1000
WHERE ID = 2;

UPDATE Mentors
SET Wynagrodzenie = 1000
WHERE ID = 3;

SELECT Wynagrodzenie 
FROM Mentors
WHERE ID = 1;

SELECT Wynagrodzenie 
FROM Mentors
WHERE ID = 2;

SELECT Wynagrodzenie 
FROM Mentors
WHERE ID = 3;
CREATE DATABASE Lista_pracownikow;
CREATE TABLE Pracownicy (
	ID INTEGER PRIMARY KEY,
	Imie VARCHAR (50) NOT NULL,
	Nazwisko VARCHAR (100) NOT NULL,
	Stanowisko VARCHAR (50) NOT NULL,
	Dzial VARCHAR (50) NOT NULL
);
INSERT INTO Pracownicy (ID, Imie, Nazwisko, Stanowisko, Dzial)
VALUES
	(1, "Maciek", "Placek", "Senior Compliance Associate", "Compliance"),
    (2, "Kornelia", "Waligorska", "Subject Matter Expert", "Compliance"),
    (3, "Silvie", "Krajewska", "Webiste Auditor", "Compliance"),
    (4, "Agata", "Walczak-Sandorska", "Manager", "Program Team"),
    (5, "Steffen", "Smith", "Legal", "Legal Team");
    
SELECT *
FROM Pracownicy;

ALTER TABLE Pracownicy
ADD COLUMN Data_zatrudnienia DATE;

INSERT INTO Pracownicy (ID, Imie, Nazwisko, Stanowisko, Dzial, Data_zatrudnienia)
VALUES
	(6, "Karol", "Wodnicki", "Senior Compliance Associate", "Compliance", "2024-11-05");
    
SELECT *
FROM Pracownicy;

UPDATE Pracownicy
SET Data_zatrudnienia = '2021-03-01'
WHERE ID = 1;

UPDATE Pracownicy
SET Data_zatrudnienia = '2022-07-15'
WHERE ID = 2;

UPDATE Pracownicy
SET Data_zatrudnienia = '2020-11-10'
WHERE ID = 3;

UPDATE Pracownicy
SET Data_zatrudnienia = '2019-05-01'
WHERE ID = 4;

UPDATE Pracownicy
SET Data_zatrudnienia = '2023-01-08'
WHERE ID = 5;

SELECT *
FROM Pracownicy;
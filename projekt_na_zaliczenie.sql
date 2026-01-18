/* 1. Stwórz Bazę „Sklep odzieżowy”
*/

CREATE DATABASE Sklep_odziezowy
CHARACTER SET utf8mb4
COLLATE utf8mb4_polish_ci;

USE Sklep_odziezowy;

/* 2. Utwórz tabelę „Producenci” z kolumnami:

id producenta
nazwa producenta
adres producenta
nip producenta
data podpisania umowy z producentem
Do każdej kolumny ustaw odpowiedni „constraint”
*/

CREATE TABLE Producenci (
	id_producenta INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_producenta VARCHAR(50) NOT NULL,
    adres_producenta VARCHAR(300) NOT NULL,
    nip_producenta CHAR(10) NOT NULL UNIQUE,
    data_podpisania_umowy_z_producentem DATE NOT NULL
);
    
/* 3. Utwórz tabelę „Produkty” z kolumnami:

id produktu
id producenta
nazwa produktu
opis produktu
cena netto zakupu
cena brutto zakupu
cena netto sprzedaży
cena brutto sprzedaży
procent VAT sprzedaży
Do każdej kolumny ustaw odpowiedni „constraint”
*/

CREATE TABLE Produkty (
	id_produktu INT AUTO_INCREMENT PRIMARY KEY,
    id_producenta INT NOT NULL,
    nazwa_produktu VARCHAR(200) NOT NULL,
    opis_produktu TEXT NOT NULL,
    cena_netto_zakupu DECIMAL(8, 2) NOT NULL 
		CHECK (cena_netto_zakupu >=0),
    cena_brutto_zakupu DECIMAL(8, 2) NOT NULL 
		CHECK (cena_brutto_zakupu >=0),
    cena_netto_sprzedazy DECIMAL(8, 2) NOT NULL 
		CHECK (cena_netto_sprzedazy >=0),
    cena_brutto_sprzedazy DECIMAL(8, 2) NOT NULL 
		CHECK (cena_brutto_sprzedazy >=0),
    procent_vat_sprzedazy DECIMAL(5, 2) NOT NULL
		CHECK (procent_vat_sprzedazy >= 0 AND procent_vat_sprzedazy <= 100),
	CONSTRAINT fk_produkty_producenci
		FOREIGN KEY (id_producenta)
        REFERENCES Producenci(id_producenta)
);

/* 5. Utwórz tabelę „Klienci” z kolumnami:

id klienta
imię
nazwisko
adres
Do każdej kolumny ustaw odpowiedni „constraint”
*/

CREATE TABLE Klienci (
	id_klienta INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    adres VARCHAR(300) NOT NULL
);


/* 4. Utwórz tabelę „Zamówienia” z kolumnami:

id zamówienia
id klienta
id produktu
Data zamówienia
Do każdej kolumny ustaw odpowiedni „constraint”
*/

CREATE TABLE  Zamowienia (
	id_zamowienia INT AUTO_INCREMENT PRIMARY KEY,
    id_klienta INT NOT NULL,
    id_produktu INT NOT NULL,
    data_zamowienia DATE NOT NULL,
    CONSTRAINT fk_zamowienia_produkty
		FOREIGN KEY (id_produktu)
        REFERENCES Produkty(id_produktu),
	CONSTRAINT fk_zamowienia_klienci
		FOREIGN KEY (id_klienta)
        REFERENCES Klienci(id_klienta)
);

/*7. Każdą tabelę uzupełnij danymi wg:

Tabela „Producenci” – 4 pozycje
Tabela „Produkty” – 20 pozycji
Tabela „Zamówienia” – 10 pozycji
Tabela „Klienci” – 10 pozycji
*/

INSERT INTO Producenci (nazwa_producenta, adres_producenta, nip_producenta, data_podpisania_umowy_z_producentem)
	VALUES
		('Knitteria', 'ul. Słowackiego 33, 80-250 Gdańsk', '1234567890', '2022-01-01'),
		('Modoteka', 'ul. Barbakan 5, 30-001 Kraków', '2345678901', '2023-06-10'),
		('Klasyk', 'ul. Miejska 8, 16-400 Suwałki', '3456789012', '2021-03-20'),
		('Ciucholand', 'ul. Szafarnia 8, 60-004 Poznań', '4567890123', '2024-11-05');
        
SELECT * FROM Producenci;
        
INSERT INTO Produkty (id_producenta, nazwa_produktu, opis_produktu, cena_netto_zakupu, cena_brutto_zakupu, cena_netto_sprzedazy, cena_brutto_sprzedazy, procent_vat_sprzedazy)
	VALUES
		(1, 'Koszulka Basic', 'Bawełniana koszulka', 20, 24.6, 40, 49.2, 23),
		(2, 'Bluza Classic', 'Bluza z kapturem', 50, 61.5, 90, 110.7, 23),
		(3, 'Spodnie Jeans', 'Jeansy slim', 70, 86.1, 130, 159.9, 23),
		(4, 'Kurtka Wiosenna', 'Lekka kurtka', 120, 147.6, 220, 270.6, 23),
		(4, 'Koszula Elegance', 'Koszula wizytowa', 60, 73.8, 110, 135.3, 23),
		(3, 'Marynarka', 'Marynarka męska', 150, 184.5, 280, 344.4, 23),
		(2, 'Spódnica', 'Spódnica damska', 45, 55.35, 85, 104.55, 23),
		(1, 'Płaszcz', 'Płaszcz zimowy', 200, 246, 350, 430.5, 23),
		(4, 'T-shirt Urban', 'T-shirt streetwear', 25, 30.75, 50, 61.5, 23),
		(1, 'Bluza Oversize', 'Bluza oversize', 65, 79.95, 120, 147.6, 23),
		(2, 'Czapka', 'Czapka zimowa', 15, 18.45, 30, 36.9, 23),
		(3, 'Spodenki', 'Spodenki sportowe', 35, 43.05, 70, 86.1, 23),
		(1, 'Koszula Classic', 'Koszula klasyczna', 55, 67.65, 100, 123, 23),
		(2, 'Sweter', 'Sweter wełniany', 80, 98.4, 150, 184.5, 23),
		(3, 'Kamizelka', 'Kamizelka elegancka', 70, 86.1, 130, 159.9, 23),
		(4, 'Garnitur', 'Garnitur męski', 300, 369, 550, 676.5, 23),
		(4, 'Top', 'Top damski', 18, 22.14, 35, 43.05, 23),
		(3, 'Bluzka', 'Bluzka damska', 40, 49.2, 75, 92.25, 23),
		(2, 'Legginsy', 'Legginsy sportowe', 30, 36.9, 60, 73.8, 23),
		(1, 'Pasek', 'Skórzany pasek', 25, 30.75, 50, 61.5, 23);

SELECT * FROM Produkty;

INSERT INTO Klienci (imie, nazwisko, adres) 
	VALUES
		('Halina', 'Matczak', 'ul. Konwaliowa 1, 40-288 Warszawa'),
		('Piotr', 'Krasiński', 'ul. Barska 6, 30-254 Kraków'),
		('Adam', 'Walczak', 'ul. Botaniczna 7, 80-200 Gdańsk'),
		('Milena', 'Waligórska', 'ul. Szkolna 10, 16-400 Suwałki'),
		('Krystyna', 'Walewska', 'ul. Żytnia 3, 60-245 Poznań'),
		('Stefan', 'Markiewicz', 'ul. Krzywa 76, 34-329 Łódź'),
		('Kinga', 'Rybarczyk', 'ul. Ogrodowa 38, 57-234 Lublin'),
		('Maciej', 'Czyński', 'ul. Brzozowa 6, 45-567 Szczecin'),
		('Paweł', 'Krzeszowski', 'ul. Lipowa 8, 22-323 Białystok'),
		('Natalia', 'Balcerzak', 'ul. Parkowa 11, 10-230 Rzeszów');

SELECT * FROM Klienci;

INSERT INTO Zamowienia (id_klienta, id_produktu, data_zamowienia)
	VALUES
		(1, 16, '2024-12-01'),  -- klient 1, garnitur
		(1, 6,  '2025-03-02'),  -- klient 1, marynarka
		(1, 2,  '2024-12-03'),  -- klient 1, bluza
		(2, 16, '2025-03-10'),  -- klient 2, garnitur
		(2, 1,  '2025-04-10'),  -- klient 2, koszulka
		(3, 6,  '2024-12-20'),  -- klient 3, marynarka
		(3, 14, '2024-12-29'),  -- klient 3, sweter
		(4, 16, '2025-02-08'),  -- klient 4, garnitur
		(5, 6,  '2025-11-09'),  -- klient 5, marynarka
		(6, 2,  '2024-03-27');  -- klient 6, bluza
        
SELECT * FROM Zamowienia;

-- 8. Wyświetl wszystkie produkty z wszystkimi danymi od producenta który znajduje się na pozycji 1 w tabeli „Producenci” --

SELECT * 
FROM Produkty p
JOIN Producenci pr
 ON p.id_producenta = pr.id_producenta
WHERE pr.id_producenta = 1;

-- 9. Posortuj te produkty alfabetycznie po nazwie --

SELECT * 
FROM Produkty p
JOIN Producenci pr
 ON p.id_producenta = pr.id_producenta
WHERE pr.id_producenta = 1
ORDER BY p.nazwa_produktu ASC;

-- 10. Wylicz średnią cenę za produktu od producenta z pozycji 1 --

SELECT ROUND(AVG(p.cena_brutto_sprzedazy), 2) AS 'Średnia cena produktu'
FROM Produkty p
JOIN Producenci pr
 ON p.id_producenta = pr.id_producenta
WHERE pr.id_producenta = 1;

/* 11. Wyświetl dwie grupy produktów tego producenta:

Połowa najtańszych to grupa: „Tanie”
Pozostałe to grupa: „Drogie”*/

SELECT p.nazwa_produktu, p.cena_brutto_sprzedazy,
	CASE
		WHEN p.cena_brutto_sprzedazy <= (
			SELECT AVG(p2.cena_brutto_sprzedazy)
			FROM Produkty p2
			WHERE p2.id_producenta = 1)
		THEN 'Tanie'
		ELSE 'Drogie'
	END AS 'Drogie/Tanie'
FROM Produkty p
WHERE p.id_producenta = 1;

-- 12. Wyświetl produkty zamówione, wyświetlając tylko ich nazwę --

-- wersja z duplikatami
SELECT p.nazwa_produktu
FROM Produkty p
JOIN Zamowienia z
	ON p.id_produktu = z.id_produktu;
    
-- wersja bez duplikatow, nie wiem o ktora chodzi w zadaniu, wiec zalaczam obie

SELECT DISTINCT p.nazwa_produktu
FROM Produkty p
JOIN Zamowienia z
	ON p.id_produktu = z.id_produktu;


-- 13. Wyświetl wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji --

SELECT p.nazwa_produktu
FROM Produkty p
JOIN Zamowienia z
	ON p.id_produktu = z.id_produktu
ORDER BY z.id_zamowienia
LIMIT 5;

-- 14. Policz łączną wartość wszystkich zamówień --

SELECT SUM(p.cena_brutto_sprzedazy) AS 'Łączna wartość zamówień'
FROM Produkty p
JOIN Zamowienia z
	ON p.id_produktu = z.id_produktu;

-- 15. Wyświetl wszystkie zamówienia wraz z nazwą produktu sortując je wg daty od najstarszego do najnowszego --

SELECT z.id_zamowienia, p.nazwa_produktu
FROM Zamowienia z
JOIN Produkty p
 ON z.id_produktu = p.id_produktu
ORDER BY z.data_zamowienia ASC;

-- 16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych --

-- w przypadku mojej tabeli kazda kolumna ma ustawione "NOT NULL" wiec query nic nie zwroci, ponizej query pod zadanie

SELECT *
FROM Produkty
WHERE 
    id_producenta IS NULL
    OR nazwa_produktu IS NULL
    OR opis_produktu IS NULL
    OR cena_netto_zakupu IS NULL
    OR cena_brutto_zakupu IS NULL
    OR cena_netto_sprzedazy IS NULL
    OR cena_brutto_sprzedazy IS NULL
    OR procent_vat_sprzedazy IS NULL;


-- 17A Wyświetl produkt najczęściej sprzedawany wraz z jego ceną --

SELECT p.nazwa_produktu, p.cena_brutto_sprzedazy, COUNT(*) AS ilosc_sprzedazy
FROM Zamowienia z
JOIN Produkty p
	ON z.id_produktu = p.id_produktu
GROUP BY p.id_produktu, p.nazwa_produktu, p.cena_brutto_sprzedazy
ORDER BY ilosc_sprzedazy DESC
LIMIT 1; -- pomija sytuacje w ktorej kilka produktow bylo rownie czesto zamawianych

-- 18A Znajdź dzień w którym najwięcej zostało złożonych zamówień --

SELECT data_zamowienia, COUNT(*) AS liczba_zamowien
FROM Zamowienia
GROUP BY data_zamowienia
ORDER BY liczba_zamowien DESC
LIMIT 1; -- zakladajac ze jest tylko jedna data spelniajaca warunek

-- Dodaje dane do tabeli zamowienia, zeby niektore dni i zamowione produkty sie powtarzaly

INSERT INTO Zamowienia (id_klienta, id_produktu, data_zamowienia)
VALUES
    (7, 16, '2024-12-01'),
    (8, 14, '2024-12-01'),
    (9, 6,  '2024-12-20'),
    (10, 16, '2024-12-20'),
    (5, 14, '2024-12-01'),
    (7, 16, '2024-12-01'),
    (8, 16, '2024-12-20'),
    (9, 14, '2024-12-01'),
    (10, 14, '2024-12-20'),
    (5, 6,  '2024-12-01'),
    (6, 6,  '2024-12-20');

INSERT INTO Zamowienia (id_klienta, id_produktu, data_zamowienia)
VALUES
    (1, 16, '2024-12-01'),
    (2, 16, '2024-12-01'),
    (3, 14, '2024-12-01'),
    (4, 14, '2024-12-20'),
    (5, 16, '2024-12-20'),
    (6, 14, '2024-12-20');
    
INSERT INTO zamowienia (id_klienta, id_produktu, data_zamowienia)
VALUES
	(1, 14, '2024-12-20'),
	(2, 6,  '2024-12-20');

INSERT INTO zamowienia (id_klienta, id_produktu, data_zamowienia)
VALUES 
	(1, 14, '2024-12-29');




-- 17B Wyświetl produkt najczęściej sprzedawany wraz z jego ceną

SELECT p.nazwa_produktu, p.cena_brutto_sprzedazy, COUNT(*) AS ilosc_sprzedazy
FROM Zamowienia z
JOIN Produkty p
    ON z.id_produktu = p.id_produktu
GROUP BY p.id_produktu, p.nazwa_produktu, p.cena_brutto_sprzedazy
HAVING COUNT(*) = (
    SELECT MAX(ilosc)
    FROM (
        SELECT COUNT(*) AS ilosc
        FROM Zamowienia z2
        GROUP BY z2.id_produktu
    ) AS a
)
ORDER BY p.nazwa_produktu; -- zakladajac ze moze byc kilka produktow z takim samym wynikiem czestotliwosci sprzedazy

-- 18B Znajdź dzień, w którym najwięcej zamówień zostało złożonych (obsługa remisów)

SELECT data_zamowienia, COUNT(*) AS liczba_zamowien
FROM Zamowienia
GROUP BY data_zamowienia
HAVING COUNT(*) = (
    SELECT MAX(liczba)
    FROM (
        SELECT COUNT(*) AS liczba
        FROM Zamowienia
        GROUP BY data_zamowienia
    ) AS b
)
ORDER BY data_zamowienia; -- zakladajac ze moze byc kilka dat z rownie czesta sprzedaza 

SELECT *
FROM Zamowienia;

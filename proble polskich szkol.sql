--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski w nawiasie (+48)
UPDATE pracownicy
SET telefon= CONCAT('(+48)',telefon);
--b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg wzoru: ‘555-222-333
UPDATE pracownicy
SET telefon = SUBSTR(telefon, 1, 3) || '-' || 
SUBSTR(telefon, 4, 3) || '-' || SUBSTR(telefon, 7, 3);
--c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter
SELECT UPPER(nazwisko) AS "Surname"
FROM pracownicy
WHERE LENGTH(nazwisko) = (SELECT MAX(LENGTH(nazwisko)) FROM pracownicy);
--d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5
SELECT md5(imie || nazwisko || adres || telefon || id_pracownika) FROM pracownicy;
--f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.
SELECT p.id_pracownika ,ps.kwota AS pensja, pr.kwota AS premia 
FROM wynagrodzenie p
LEFT JOIN pensje ps ON p.id_pensji = ps.id_pensji
LEFT JOIN premie pr ON p.id_premii = pr.id_premii;
--g) wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, gdzie 
--wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 z
SELECT 
    CONCAT('Pracownik ', p.imie, ' ', p.nazwisko, ', w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę ', (pn.kwota + pr.kwota), ' zł, gdzie wynagrodzenie zasadnicze wynosiło: ', pn.kwota, ' zł, premia: ', pr.kwota, ' zł, nadgodziny: ',  '0 zł.') AS raport
FROM 
    wynagrodzenie w
JOIN
    pracownicy p ON w.id_pracownika = p.id_pracownika
JOIN
	pensje pn ON w.id_pensji = pn.id_pensji
JOIN
	premie pr ON w.id_premii = pr.id_premii
WHERE
    p.imie = 'Kamil' AND p.nazwisko = 'Pabis';


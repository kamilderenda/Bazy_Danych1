--Wyświetl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika, nazwisko
FROM pracownicy;
--b) Wyświetl id pracowników, których płaca jest większa niż 1000.
SELECT id_pracownika
FROM wynagrodzenie
INNER JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
WHERE kwota > 1000;
--c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000.
SELECT id_pracownika
FROM wynagrodzenie
INNER JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
INNER JOIN premie ON wynagrodzenie.id_premii = premie.id_premii
WHERE pensje.kwota > 2000 AND wynagrodzenie.id_premii IS NULL;
--d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’.
SELECT id_pracownika
FROM pracownicy
WHERE imie = '%J';
--e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.

--f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie.

--g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 PLN.
SELECT imie, nazwisko
FROM pracownicy
INNER JOIN wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
INNER JOIN pensje ON wynagrodzenie.id_pensji=pensje.id_pensji
WHERE kwota > 1500 AND kwota < 3000;
--h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT imie,nazwisko
FROM pracownicy
INNER JOIN wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
INNER JOIN godziny ON pracownicy.id_pracownika=godziny.id_pracownika
INNER JOIN premie ON wynagrodzenie.id_premii=premie.id_premii
WHERE godziny.liczba_godzin > 160 AND wynagrodzenie.id_premii IS NULL;
--i) Uszereguj pracowników według pensji.
SELECT id_pracownika
FROM wynagrodzenie
INNER JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
GROUP BY pensje.kwota,id_pracownika
ORDER BY pensje.kwota;
--j) Uszereguj pracowników według pensji i premii malejąco.
SELECT id_pracownika
FROM wynagrodzenie
INNER JOIN pensje ON wynagrodzenie.id_pensji=pensje.id_pensji
INNER JOIN premie ON wynagrodzenie.id_premii=premie.id_premii
ORDER BY pensje.kwota, premie.kwota DESC;
--k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.
SELECT stanowisko, COUNT(*) AS liczba_pracownikow
FROM pensje
GROUP BY pensje.stanowisko;
--Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
SELECT
AVG(kwota) AS srednia,
MIN(kwota) AS minimalna,
MAX(kwota) AS maksymalna
FROM pensje
WHERE stanowisko = 'Szef';

--Policz sumę wszystkich wynagrodzeń
SELECT SUM(kwota) AS wyplaty
FROM pensje;

--Policz sumę wynagrodzeń w ramach danego stanowiska.
SELECT stanowisko, SUM(kwota) AS suma_wynagrodzen
FROM pensje
GROUP BY stanowisko;

--Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska
SELECT stanowisko, COUNT(id_premii) AS liczba_premii
FROM pensje
INNER JOIN wynagrodzenie ON pensje.id_pensji=wynagrodzenie.id_pensji
GROUP BY stanowisko;
--Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł
DELETE FROM pracownicy
WHERE id_pracownika IN (
    SELECT pracownicy.id_pracownika
    FROM pracownicy
    INNER JOIN wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
    INNER JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
    WHERE kwota < 1200
);








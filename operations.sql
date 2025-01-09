-- 1. Выбор уникальных элементов столбца

SELECT DISTINCT amount
FROM book

--2.Выборка данных, групповые функции SUM и COUNT

SELECT author AS "Автор",COUNT(DISTINCT title) AS "Различных_книг",  SUM(amount) AS "Количество_экземпляров" 
FROM book
GROUP BY author


--3. Выборка данных, групповые функции MIN, MAX и AVG

SELECT author, MIN(price) AS Минимальная_цена, MAX(price) AS Максимальная_цена, AVG(price) AS Средняя_цена
FROM book
GROUP BY author

--4. Выборка данных c вычислением, групповые функции

SELECT author, SUM(price*amount) AS Стоимость, ROUND((SUM(price*amount)*(18/100))/(1+(18/100)),2) AS НДС, ROUND((SUM(price*amount))/(1+(18/100)),2) AS Стоимость_без_НДС 
FROM book
GROUP BY author

--5. Вычисления по таблице целиком

SELECT MIN(price) AS Минимальная_цена, MAX(price) AS Максимальная_цена, ROUND(AVG(price),2) AS Средняя_цена
FROM book

--6. Выборка данных по условию, групповые функции

SELECT  ROUND(AVG(price),2) AS Средняя_цена, ROUND(SUM(price*amount),2) AS Стоимость
FROM book
WHERE amount BETWEEN 5 AND 14


--7. Выборка данных по условию, групповые функции, WHERE и HAVING

SELECT author, SUM(price * amount) AS Стоимость 
FROM book
WHERE title <> "Идиот" AND title <> "Белая гвардия"
GROUP BY author
HAVING SUM(price * amount) > 5000
ORDER BY Стоимость DESC



--1. Вложенный запрос, возвращающий одно значение

SELECT author, title, price FROM book 
WHERE price <= (
    SELECT AVG(price) FROM book)
ORDER BY price DESC

--2.Использование вложенного запроса в выражении

SELECT author, title, price FROM book 
WHERE price - (SELECT MIN(PRICE) FROM book) <= 150
ORDER by price ASC

--3. Вложенный запрос, оператор IN

SELECT author, title, amount FROM book 
WHERE amount IN (
    SELECT amount FROM book 
    GROUP BY amount 
    HAVING COUNT(price) = 1)

--4. Вложенный запрос, операторы ANY и ALL

SELECT author, title, price FROM book 
WHERE price < ANY (
    SELECT (MIN(price))
    FROM book
    GROUP BY author)

--5. Вложенный запрос после SELECT

SELECT title, author, amount, 
(SELECT MAX(amount) FROM book) - amount AS Заказ 

FROM book 
WHERE (SELECT MAX(amount) FROM book) - amount > 0
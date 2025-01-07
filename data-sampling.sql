-- 1. Выборка всех данных из таблицы

SELECT * FROM book

-- 2. Выборка отдельных столбцов

SELECT author, title, price FROM book;

-- 3. Присвоение новых имен столбцам при формировании выборки

SELECT title AS Название, author AS Автор FROM book;

-- 4. Выборка данных с созданием вычисляемого столбца

SELECT title, amount, 1.65 * amount AS pack FROM book;

-- 5. Выборка данных, вычисляемые столбцы, математические функции

SELECT title, author, amount, ROUND(price - ((30 * price)/100), 2) AS new_price FROM book

-- 6. Выборка данных, вычисляемые столбцы, логические функции

SELECT author, title,
ROUND(
    IF (author = "Булгаков М.А.", price * 1.1, 
      IF(author = "Есенин С.А.", price * 1.05, price))
    ,2) 
      AS new_price 
FROM book


-- 7. Выборка данных по условию

SELECT author, title, price 
FROM book
WHERE amount < 10 


-- 8. Выборка данных, логические операции

SELECT title, author, price, amount 
FROM book
WHERE (price < 500 or price > 600) and (amount * price) >= 5000

-- 9. Выборка данных, операторы BETWEEN, IN

SELECT title, author 
FROM book
WHERE (price BETWEEN 540.50 AND 800) AND (amount IN (2,3,5,7))

-- 10. Выборка данных с сортировкой

SELECT author, title 
FROM book
WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title ASC

-- 11. Выборка данных, оператор LIKE

SELECT title, author
FROM book 
WHERE title LIKE "%_ %" AND author LIKE "%С.%" 
ORDER BY title ASC

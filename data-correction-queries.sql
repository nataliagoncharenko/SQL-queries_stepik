--1. Создание пустой таблицы

CREATE TABLE supply(
    supply_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    author VARCHAR(30),
    price DECIMAL(8, 2),
    amount INT);

--2. Добавление записей в таблицу

INSERT INTO supply (title, author, price, amount)
VALUES 
    ("Лирика", "Пастернак Б.Л.", 518.99, 2),
    ("Черный человек", "Есенин С.А.", 570.20, 6),
    ("Белая гвардия", "Булгаков М.А.", 540.50, 7),
    ("Идиот", "Достоевский Ф.М.", 360.80, 3)

--3. Добавление записей из другой таблицы

INSERT INTO book (title, author, price, amount)
SELECT title, author, price, amount 
FROM supply 
WHERE author NOT IN ("Достоевский Ф.М.", "Булгаков М.А.")

--4. Добавление записей, вложенные запросы

INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount
FROM supply 
WHERE author NOT IN (
    SELECT author 
    FROM book)

--5. Запросы на обновление

UPDATE book SET price = price * 0.9 
WHERE amount BETWEEN 5 AND 10


--6. Запросы на обновление нескольких столбцов

UPDATE book 

SET buy = IF(buy > amount, amount, buy),
    price = IF(buy = 0, price * 0.9, price);

SELECT * FROM book;


--7. Запросы на обновление нескольких таблиц 

UPDATE book, supply
SET book.amount = book.amount + supply.amount, book.price = (book.price + supply.price) / 2
WHERE book.author = supply.author AND book.title = supply.title;
SELECT * FROM book;

--8. Запросы на удаление

DELETE FROM supply 
WHERE author IN (
    SELECT author
    FROM book
    GROUP BY author
    HAVING SUM(amount) > 10);
    
SELECT * FROM supply;


--9. Запросы на создание таблицы

CREATE TABLE ordering AS
SELECT author, title, 
    (SELECT ROUND(AVG(amount)) 
     FROM book) AS amount   
 FROM book 
 WHERE amount < (SELECT AVG(amount) FROM book);

SELECT * FROM ordering;
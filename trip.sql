--1. Информация о командировках тех сотрудников, фамилия которых заканчивается на букву «а»

SELECT name, city, per_diem, date_first, date_last
FROM trip
WHERE name LIKE '%а %'-- Фамилия заканчивается на 'а'
ORDER BY date_last DESC;  -- Сортировка по убыванию даты последнего дня командировки

--2. Вывести в алфавитном порядке фамилии и инициалы тех сотрудников, которые были в командировке в Москве

SELECT DISTINCT name FROM trip
WHERE city = "Москва"
ORDER BY name ASC

--3. Для каждого города посчитать, сколько раз сотрудники в нем были. 

SELECT city, count(city) AS "Количество" FROM trip
GROUP BY city
ORDER BY city ASC


--4. Оператор LIMIT

SELECT city, COUNT(city) AS "Количество" FROM trip
GROUP BY city
ORDER BY Количество DESC
LIMIT 2

--5. Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга (фамилии и инициалы сотрудников, город ,  длительность командировки в днях, при этом первый и последний день относится к периоду командировки). 

SELECT name, city, DATEDIFF(date_last, date_first) + 1 AS "Длительность"
FROM trip
WHERE city NOT LIKE "Москва" AND city NOT LIKE "Санкт-Петербург"
ORDER BY Длительность DESC, city DESC

--6. Вывести информацию о командировках сотрудника(ов), которые были самыми короткими по времени. 

SELECT name, city, date_first, date_last 
FROM trip
WHERE DATEDIFF(date_last, date_first) = (SELECT MIN(DATEDIFF(date_last, date_first)) FROM trip)

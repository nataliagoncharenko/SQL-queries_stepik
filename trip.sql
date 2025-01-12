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

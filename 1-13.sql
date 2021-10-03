--- БД Компьютерная фирма

--- Задание 1
--- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол.
--- Вывести: model, speed и hd 
SELECT p.model, p.speed, p.hd 
FROM PC p 
WHERE price < 500

--- Задание 2
--- Найдите производителей принтеров. Вывести: maker 
SELECT DISTINCT p.maker
FROM Product p
WHERE p.type = 'Printer'

--- Задание 3
--- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT l.model, l.ram, l.screen
FROM Laptop l
WHERE l.price > 1000

--- Задание 4
--- Найдите все записи таблицы Printer для цветных принтеров.
SELECT * FROM Printer p WHERE p.color = 'y'

--- Задание 5
--- Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол. 
SELECT p.model, p.speed, p.hd
FROM PC p
WHERE p.cd = '12x' AND p.price < 600 OR p.cd = '24x' AND p.price < 600

--- Задание 6
--- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт,
--- найти скорости таких ПК-блокнотов. Вывод: производитель, скорость. 
SELECT DISTINCT p.maker, l.speed
FROM Product p
LEFT JOIN Laptop l ON l.model = p.model
WHERE l.hd >= 10 AND p.type = 'laptop'

--- Задание 7
--- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква). 
SELECT p.model, pc.price
FROM Product p
INNER JOIN PC pc ON pc.model = p.model
WHERE p.maker = 'B'
UNION
SELECT p.model, l.price
FROM Product p
INNER JOIN Laptop l ON l.model = p.model
WHERE p.maker = 'B'
UNION
SELECT p.model, pr.price
FROM Product p
INNER JOIN Printer pr ON pr.model = p.model
WHERE p.maker = 'B'

--- Задание 8
--- Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT p.maker FROM Product p WHERE p.type = 'PC'
EXCEPT
SELECT p.maker FROM Product p WHERE p.type = 'laptop'

--- Задание 9
--- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker 
SELECT DISTINCT p.maker AS 'Maker'
FROM PC pc
LEFT JOIN Product p ON p.model = pc.model
WHERE p.type = 'PC' AND pc.speed >= 450

--- Задание 10
--- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price 
SELECT model, price
FROM Printer 
WHERE price >= (SELECT MAX(price) FROM Printer)

--- Задание 11
--- Найдите среднюю скорость ПК. 
SELECT AVG(pc.speed) FROM PC pc

--- Задание 12
--- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол. 
SELECT AVG(l.speed) FROM Laptop l WHERE l.price > 1000

--- Задание 13
--- Найдите среднюю скорость ПК, выпущенных производителем A. 
SELECT AVG(pc.speed)
FROM PC pc
LEFT JOIN Product p ON p.model = pc.model
WHERE p.maker = 'A'

--- БД Корабли

--- Задание 14
--- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий. 



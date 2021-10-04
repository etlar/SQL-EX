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

--- Задание 14
--- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий. 
SELECT s.class, s.name, c.country 
FROM Ships s 
LEFT JOIN Classes c ON c.class = s.class
WHERE c.numGuns >= 10

--- Задание 15
--- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD 
SELECT DISTINCT pc.hd
FROM PC pc
GROUP BY pc.hd HAVING COUNT(pc.hd) >= 2

--- Задание 16
--- Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
--- В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
--- Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM. 
SELECT DISTINCT pc1.model, pc2.model, pc1.speed, pc1.ram
FROM PC AS pc1, PC AS pc2
WHERE pc1.model>pc2.model AND pc1.speed=pc2.speed AND pc1.ram=pc2.ram

--- Задание 17
--- Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed 
SELECT DISTINCT p.type, p.model, l.speed
FROM Laptop l
JOIN Product p ON l.model = p.model
WHERE l.speed <(SELECT MIN(speed)FROM pc)

-- Задание 18
-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price 
SELECT p.maker, MIN(pr.price)
FROM Printer pr
LEFT JOIN Product p ON p.model = pr.model
WHERE pr.color = 'y' AND pr.price <= 270
GROUP BY p.maker


-- Задание 19
-- Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
-- Вывести: maker, средний размер экрана. 
SELECT p.maker, AVG(l.screen)
FROM Laptop l
LEFT JOIN Product p ON p.model = l.model
GROUP BY p.maker

-- Задание 20
-- Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК. 
SELECT p.maker, COUNT(p.model)
FROM Product p
WHERE p.type = 'PC'
GROUP BY p.maker
HAVING COUNT(p.model) >= 3

-- Задание 21
-- Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
-- Вывести: maker, максимальная цена. 
SELECT p.maker, MAX(pc.price) 
FROM Product p
JOIN PC pc ON pc.model = p.model
GROUP BY p.maker

-- Задание 22
-- Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью.
-- Вывести: speed, средняя цена. 
SELECT pc.speed, AVG(pc.price)
FROM PC pc
WHERE pc.speed > 600
GROUP BY pc.speed

-- Задание 23
-- Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц,
-- так и ПК-блокноты со скоростью не менее 750 МГц.
-- Вывести: Maker
SELECT DISTINCT maker
FROM product t1 JOIN pc t2 ON t1.model=t2.model
WHERE speed>=750 AND maker IN
( SELECT maker
FROM product t1 JOIN laptop t2 ON t1.model=t2.model
WHERE speed>=750 )

-- Задание 24
-- Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
WITH allModels AS
(
	SELECT model, MAX(price) AS maxPrice
	FROM PC
        GROUP BY model
	UNION
        SELECT model, MAX(price) AS maxPrice
	FROM Laptop
        GROUP BY model
        UNION
        SELECT model, MAX(price) AS maxPrice
	FROM Printer
        GROUP BY model
        
)
SELECT model FROM allModels
WHERE maxPrice >= (SELECT MAX(price) FROM Printer) 
AND maxPrice >= (SELECT MAX(price) FROM PC)
AND maxPrice >= (SELECT MAX(price) FROM Laptop)

-- Задание 25
-- Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM
-- и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. 
-- Вывести: Maker 
SELECT DISTINCT maker
FROM product
WHERE model IN (
SELECT model
FROM pc
WHERE ram = (
  SELECT MIN(ram)
  FROM pc
  )
AND speed = (
  SELECT MAX(speed)
  FROM pc
  WHERE ram = (
   SELECT MIN(ram)
   FROM pc
   )
  )
)
AND
maker IN (
	SELECT maker
	FROM product
	WHERE type='printer'
)
-- Задание 26
-- Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква).
-- Вывести: одна общая средняя цена. 
SELECT AVG(price) AS AVG_price FROM (SELECT model, price FROM PC
UNION ALL
SELECT model, price FROM Laptop) AS price
INNER JOIN Product AS p
ON price.model = p.model
WHERE maker = 'A'

-- Задание 27
-- Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры.
-- Вывести: maker, средний размер HD. 
SELECT p.maker, AVG(pc.hd)
FROM Product p
JOIN PC pc ON pc.model = p.model
WHERE p.maker IN (SELECT maker FROM Product WHERE type = 'Printer') 
GROUP BY p.maker

-- Задание 28
-- Используя таблицу Product, определить количество производителей, выпускающих по одной модели. 
SELECT COUNT(p.maker)
FROM Product p
WHERE p.maker IN
(
	SELECT maker 
	FROM Product
	GROUP BY maker
	HAVING COUNT(model) = 1
)

-- Задание 29
-- В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день
-- [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход).
-- Использовать таблицы Income_o и Outcome_o. 


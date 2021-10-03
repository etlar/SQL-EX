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

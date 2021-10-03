--- Задание 14
--- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий. 
SELECT s.class, s.name, c.country 
FROM Ships s 
LEFT JOIN Classes c ON c.class = s.class
WHERE c.numGuns >= 10
--- Задание 15
--- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD 

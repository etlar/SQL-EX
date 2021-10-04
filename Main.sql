--- ������� 1
--- ������� ����� ������, �������� � ������ �������� ����� ��� ���� �� ���������� ����� 500 ���.
--- �������: model, speed � hd 
SELECT p.model, p.speed, p.hd 
FROM PC p 
WHERE price < 500

--- ������� 2
--- ������� �������������� ���������. �������: maker 
SELECT DISTINCT p.maker
FROM Product p
WHERE p.type = 'Printer'

--- ������� 3
--- ������� ����� ������, ����� ������ � ������� ������� ��-���������, ���� ������� ��������� 1000 ���.
SELECT l.model, l.ram, l.screen
FROM Laptop l
WHERE l.price > 1000

--- ������� 4
--- ������� ��� ������ ������� Printer ��� ������� ���������.
SELECT * FROM Printer p WHERE p.color = 'y'

--- ������� 5
--- ������� ����� ������, �������� � ������ �������� ����� ��, ������� 12x ��� 24x CD � ���� ����� 600 ���. 
SELECT p.model, p.speed, p.hd
FROM PC p
WHERE p.cd = '12x' AND p.price < 600 OR p.cd = '24x' AND p.price < 600

--- ������� 6
--- ��� ������� �������������, ������������ ��-�������� c ������� �������� ����� �� ����� 10 �����,
--- ����� �������� ����� ��-���������. �����: �������������, ��������. 
SELECT DISTINCT p.maker, l.speed
FROM Product p
LEFT JOIN Laptop l ON l.model = p.model
WHERE l.hd >= 10 AND p.type = 'laptop'

--- ������� 7
--- ������� ������ ������� � ���� ���� ��������� � ������� ��������� (������ ����) ������������� B (��������� �����). 
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

--- ������� 8
--- ������� �������������, ������������ ��, �� �� ��-��������.
SELECT p.maker FROM Product p WHERE p.type = 'PC'
EXCEPT
SELECT p.maker FROM Product p WHERE p.type = 'laptop'

--- ������� 9
--- ������� �������������� �� � ����������� �� ����� 450 ���. �������: Maker 
SELECT DISTINCT p.maker AS 'Maker'
FROM PC pc
LEFT JOIN Product p ON p.model = pc.model
WHERE p.type = 'PC' AND pc.speed >= 450

--- ������� 10
--- ������� ������ ���������, ������� ����� ������� ����. �������: model, price 
SELECT model, price
FROM Printer 
WHERE price >= (SELECT MAX(price) FROM Printer)

--- ������� 11
--- ������� ������� �������� ��. 
SELECT AVG(pc.speed) FROM PC pc

--- ������� 12
--- ������� ������� �������� ��-���������, ���� ������� ��������� 1000 ���. 
SELECT AVG(l.speed) FROM Laptop l WHERE l.price > 1000

--- ������� 13
--- ������� ������� �������� ��, ���������� �������������� A. 
SELECT AVG(pc.speed)
FROM PC pc
LEFT JOIN Product p ON p.model = pc.model
WHERE p.maker = 'A'

--- ������� 14
--- ������� �����, ��� � ������ ��� �������� �� ������� Ships, ������� �� ����� 10 ������. 
SELECT s.class, s.name, c.country 
FROM Ships s 
LEFT JOIN Classes c ON c.class = s.class
WHERE c.numGuns >= 10

--- ������� 15
--- ������� ������� ������� ������, ����������� � ���� � ����� PC. �������: HD 
SELECT DISTINCT pc.hd
FROM PC pc
GROUP BY pc.hd HAVING COUNT(pc.hd) >= 2

--- ������� 16
--- ������� ���� ������� PC, ������� ���������� �������� � RAM. 
--- � ���������� ������ ���� ����������� ������ ���� ���, �.�. (i,j), �� �� (j,i), 
--- ������� ������: ������ � ������� �������, ������ � ������� �������, �������� � RAM. 
SELECT DISTINCT pc1.model, pc2.model, pc1.speed, pc1.ram
FROM PC AS pc1, PC AS pc2
WHERE pc1.model>pc2.model AND pc1.speed=pc2.speed AND pc1.ram=pc2.ram

--- ������� 17
--- ������� ������ ��-���������, �������� ������� ������ �������� ������� �� ��. �������: type, model, speed 
SELECT DISTINCT p.type, p.model, l.speed
FROM Laptop l
JOIN Product p ON l.model = p.model
WHERE l.speed <(SELECT MIN(speed)FROM pc)

-- ������� 18
-- ������� �������������� ����� ������� ������� ���������. �������: maker, price 
SELECT p.maker, MIN(pr.price)
FROM Printer pr
LEFT JOIN Product p ON p.model = pr.model
WHERE pr.color = 'y' AND pr.price <= 270
GROUP BY p.maker


-- ������� 19
-- ��� ������� �������������, �������� ������ � ������� Laptop, ������� ������� ������ ������ ����������� �� ��-���������.
-- �������: maker, ������� ������ ������. 
SELECT p.maker, AVG(l.screen)
FROM Laptop l
LEFT JOIN Product p ON p.model = l.model
GROUP BY p.maker

-- ������� 20
-- ������� ��������������, ����������� �� ������� ���� ��� ��������� ������ ��. �������: Maker, ����� ������� ��. 
SELECT p.maker, COUNT(p.model)
FROM Product p
WHERE p.type = 'PC'
GROUP BY p.maker
HAVING COUNT(p.model) >= 3

-- ������� 21
-- ������� ������������ ���� ��, ����������� ������ ��������������, � �������� ���� ������ � ������� PC.
-- �������: maker, ������������ ����. 
SELECT p.maker, MAX(pc.price) 
FROM Product p
JOIN PC pc ON pc.model = p.model
GROUP BY p.maker

-- ������� 22
-- ��� ������� �������� �������� ��, ������������ 600 ���, ���������� ������� ���� �� � ����� �� ���������.
-- �������: speed, ������� ����. 
SELECT pc.speed, AVG(pc.price)
FROM PC pc
WHERE pc.speed > 600
GROUP BY pc.speed

-- ������� 23
-- ������� ��������������, ������� ����������� �� ��� �� �� ��������� �� ����� 750 ���,
-- ��� � ��-�������� �� ��������� �� ����� 750 ���.
-- �������: Maker
SELECT DISTINCT maker
FROM product t1 JOIN pc t2 ON t1.model=t2.model
WHERE speed>=750 AND maker IN
( SELECT maker
FROM product t1 JOIN laptop t2 ON t1.model=t2.model
WHERE speed>=750 )

-- ������� 24
-- ����������� ������ ������� ����� �����, ������� ����� ������� ���� �� ���� ��������� � ���� ������ ���������.
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

-- ������� 25
-- ������� �������������� ���������, ������� ���������� �� � ���������� ������� RAM
-- � � ����� ������� ����������� ����� ���� ��, ������� ���������� ����� RAM. 
-- �������: Maker 
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
-- ������� 26
-- ������� ������� ���� �� � ��-���������, ���������� �������������� A (��������� �����).
-- �������: ���� ����� ������� ����. 
SELECT AVG(price) AS AVG_price FROM (SELECT model, price FROM PC
UNION ALL
SELECT model, price FROM Laptop) AS price
INNER JOIN Product AS p
ON price.model = p.model
WHERE maker = 'A'

-- ������� 27
-- ������� ������� ������ ����� �� ������� �� ��� ��������������, ������� ��������� � ��������.
-- �������: maker, ������� ������ HD. 
SELECT p.maker, AVG(pc.hd)
FROM Product p
JOIN PC pc ON pc.model = p.model
WHERE p.maker IN (SELECT maker FROM Product WHERE type = 'Printer') 
GROUP BY p.maker

-- ������� 28
-- ��������� ������� Product, ���������� ���������� ��������������, ����������� �� ����� ������. 
SELECT COUNT(p.maker)
FROM Product p
WHERE p.maker IN
(
	SELECT maker 
	FROM Product
	GROUP BY maker
	HAVING COUNT(model) = 1
)

-- ������� 29
-- � �������������, ��� ������ � ������ ����� �� ������ ������ ������ ����������� �� ���� ������ ���� � ����
-- [�.�. ��������� ���� (�����, ����)], �������� ������ � ��������� ������� (�����, ����, ������, ������).
-- ������������ ������� Income_o � Outcome_o. 


--- �� ������������ �����

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

--- �� �������

--- ������� 14
--- ������� �����, ��� � ������ ��� �������� �� ������� Ships, ������� �� ����� 10 ������. 



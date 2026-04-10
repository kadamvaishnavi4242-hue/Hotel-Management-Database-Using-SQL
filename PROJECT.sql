CREATE DATABASE IF NOT EXISTS HotelDB;
USE HotelDB;
#Table Creation
#Consumer Table-
CREATE TABLE Consumers(
ConsumerID INT PRIMARY KEY,
ConsumerName VARCHAR(100),
Phone VARCHAR(10)
);
#Menu Table-
CREATE TABLE MENU(
ItemID INT  PRIMARY KEY,
ItemName VARCHAR(50),
Price  DECIMAl(10,2)
);
#Orders Table-
CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
ConsumerID INT , FOREIGN KEY (ConsumerID) REFERENCES Consumers (ConsumerID),
OrderDate DATE
);
#Orderdetails Table-
CREATE TABLE OrderDetails(
OrderDetailID INT PRIMARY KEY,
OrderID INT , FOREIGN KEY  (OrderID)  REFERENCES Orders (OrderID),
ItemID INT ,FOREIGN KEY (ItemID) REFERENCES MENU (ItemID)
);
#Data Inserion-
INSERT INTO Consumers(consumerID , ConsumerName , Phone)
VALUES
(1 , 'Rahul Sharma' , '2345678900'),
(2 , 'Anjali Mehta' , '1234567890'),
(3 , 'Amit Verma' , '5678903423'),
(4 , 'Nisha Roy' , '9090909090');
INSERT INTO Menu(ItemID , ItemName , Price)
VALUES
(101 ,  'Burger' , 120.00),
(102 , 'Pizza' , 100.00),
(103 , 'Pavbhaji' ,90),
(104 , 'Noosles' ,80);
INSERT INTO Orders(OrderID,ConsumerID,OrderDate)
VALUES
(201 , 1 , '2026-04-01'),
(202 , 2 , '2026-04-02'),
(203 , 3 , '2026-04-03'),
(204 ,4 ,  '2026-04-05');
INSERT INTO OrderDetails(OrderDetailID , OrderID , ItemID)
VALUES
(301 , 201 ,101),
(302 , 202 ,102),
(303 ,202 ,103),
(304 , 203 ,104);

SELECT * FROM Consumers;
SELECT * FROM Orders;
SELECT * FROM Menu;
SELECT * FROM OrderDetails;
#Inner join-
 SELECT Consumers.ConsumerID , Orders.OrderID
 FROM Consumers
 INNER JOIN Orders ON Consumers.ConsumerID = Orders.ConsumerID;
 #Right join-
 SELECT Consumers.ConsumerID , Orders.OrderID
 FROM Consumers
 RIGHT JOIN Orders ON Consumers.ConsumerID = Orders.ConsumerID;
 #Left join-
 SELECT Consumers.ConsumerID , Orders.OrderID
 FROM Consumers
 LEFT JOIN Orders ON Consumers.ConsumerID = Orders.ConsumerID;
 #Full Outer Join
 SELECT Consumers.ConsumerID , Orders.OrderID
 FROM Consumers
 RIGHT JOIN Orders ON Consumers.ConsumerID = Orders.ConsumerID
 
 UNION
 
 SELECT Consumers.ConsumerID , Orders.OrderID
 FROM Consumers
 LEFT JOIN Orders ON Consumers.ConsumerID = Orders.ConsumerID;
 #Aggregate Functions-
 SELECT Count(*) FROM Menu;
 SELECT SUM(Price) FROM Menu;
 SELECT AVG(Price) FROM Menu;
 SELECT MAX(Price) FROM Menu;
 SELECT MIN(Price) FROM Menu;

#GroupBy-
SELECT ItemName , SUM(Price)FROM Menu
GROUP BY ItemName;
#Subquery-
SELECT ItemName , Price
FROM Menu
WHERE Price > (SELECT AVG(Price) FROM Menu);
#CTES
WITH ItemNameTotalsale AS(
SELECT ItemName , SUM(Price) AS TOTALSALES
FROM Menu
GROUP BY ItemName
)
SELECT ItemName , TOTALSALES
FROM ItemNameTotalsale
WHERE TOTALSALES >100;
#View
CREATE VIEW ItemNameTotalsale AS
SELECT ItemName , SUM(Price) AS TOTALSALES
FROM Menu
GROUP BY ItemName;
SELECT * FROM ItemNameTotalsale WHERE TOTALSALES >100;
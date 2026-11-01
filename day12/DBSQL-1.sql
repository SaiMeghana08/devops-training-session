CREATE DATABASE CustomerDB;
USE CustomerDB;

CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(50),
    Age VARCHAR(30),
    Gender VARCHAR(20),
    City VARCHAR(50),
    Salary VARCHAR(20)
);

INSERT INTO Customers
(CustomerID, Name, Age, Gender, City, Salary)
VALUES
(101, 'Meghana', '25', 'Female', 'Chennai', '50000'),
(102, 'Ravi', NULL, ' male ', ' chennai ', '60000'),
(103, 'Priya', 'twenty-five', 'F', 'Bengaluru', '70000'),
(104, 'Arun', '-5', 'Other', 'HYDERABAD', '-5000'),
(105, 'Kiran', '40', 'MALE', 'Hyderabad', '85,000'),
(106, 'Sita', '30', NULL, NULL, NULL),
(102, 'Ravi', NULL, ' male ', ' chennai ', '60000');

SELECT *
FROM Customers
WHERE CAST(REPLACE(Salary, ',', '') AS DECIMAL(10,2)) > 60000;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1, 101, 'Laptop', 55000),
(2, 102, 'Mobile', 20000),
(3, 103, 'Headphones', 3000),
(4, 107, 'Tablet', 15000);


SELECT
    c.CustomerID,
    c.Name,
    o.OrderID,
    o.Product,
    o.Amount
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    
    
SELECT
    c.CustomerID,
    c.Name,
    SUM(o.Amount) AS TotalAmount
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;


SELECT
    c.CustomerID,
    c.Name,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(o.OrderID) > 1;

SELECT Gender, COUNT(*) AS Total
FROM Customers
GROUP BY Gender;
      
SELECT City, COUNT(*) AS Total
FROM Customers
GROUP BY City;
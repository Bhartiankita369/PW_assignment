USE Customer

SELECT * FROM Customers
SELECT * FROM Orders 
SELECT * FROM Payments
SELECT * FROM Employees
-- 1. Retrieve all customers who have placed at least one order.
SELECT c.CustomerId, c.CustomerName, c.City
FROM Customers c 
JOIN Orders o on c.customerId = o.CustomerId
 
-- 2. Retrieve all customers and their orders, including customers who have not placed any orders.
SELECT Distinct(c.CustomerId), c.CustomerName, c.City, o.OrderID, o.OrderDate,o.Amount
FROM Customers c 
LEFT JOIN Orders o on c.customerId = o.CustomerId

-- 3. Retrieve all orders and their corresponding customers, including orders placed by unknowncustomers.
SELECT Distinct(c.CustomerId), c.CustomerName, c.City, o.OrderID, o.OrderDate,o.Amount
FROM Customers c 
RIGHT JOIN Orders o on c.customerId = o.CustomerId

-- 4. Display all customers and orders, whether matched or not.
SELECT Distinct(c.CustomerId), c.CustomerName, c.City, o.OrderID, o.OrderDate,o.Amount
FROM Customers c 
LEFT JOIN Orders o on c.customerId = o.CustomerId
UNION
SELECT Distinct(c.CustomerId), c.CustomerName, c.City, o.OrderID, o.OrderDate,o.Amount
FROM Customers c 
RIGHT JOIN Orders o on c.customerId = o.CustomerId

-- 5. Find customers who have not placed any orders.
SELECT c.CustomerId, c.CustomerName, c.City, o.OrderID, o.OrderDate,o.Amount
FROM Customers c 
Left JOIN Orders o on c.customerId = o.CustomerId
WHERE OrderID is null

-- 6. Retrieve customers who made payments but did not place any orders.
SELECT  *
FROM Payments p
LEFT JOIN Orders o ON p.CustomerID = o.CustomerID
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL;

-- 7. Generate a list of all possible combinations between Customers and Orders.
SELECT c.CustomerId, c.CustomerName, c.City, o.OrderID, o.OrderDate,o.Amount
FROM Customers c 
CROSS JOIN Orders o 

-- 8. Show all customers along with order and payment amounts in one table.
SELECT c.CustomerId, c.CustomerName, c.City, o.OrderID, o.Amount , p.paymentID, p.Amount
FROM Customers c 
LEFT JOIN orders o ON o.CustomerID = c.CustomerID
LEFT JOIN payments p ON p.CustomerID = o.CustomerID

-- 9. Retrieve all customers who have both placed orders and made payments.
SELECT c.CustomerId, c.CustomerName, c.City, o.OrderID, o.Amount , p.paymentID, p.Amount
FROM Customers c 
LEFT JOIN orders o ON o.CustomerID = c.CustomerID
LEFT JOIN payments p ON p.CustomerID = o.CustomerID
WHERE o.OrderID IS NOT NULL;



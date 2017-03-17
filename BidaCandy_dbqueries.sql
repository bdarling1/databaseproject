USE BidaCandy;
GO

/*1.*/
SELECT *
FROM Products;

SELECT *
FROM StoreProduct;

SELECT *
FROM Suppliers;

SELECT *
FROM SalesHeader;

SELECT *
FROM Sales;

SELECT *
FROM Customers;

SELECT *
FROM Stores;

SELECT *
FROM Employees;

/*2. How many Reward Members does Bida Candy Store have?*/
SELECT COUNT(RewardsMemberFlag) AS Number_of_Reward_Members
FROM Customers
WHERE RewardsMemberFlag = '1';

/*3. Who are the active employees for each Bida Candy Store?*/
SELECT 
	e.EmployeeID,
	e.FirstName, 
	e.LastName, 
	s.StoreName
FROM Stores AS s
	JOIN Employees AS e
ON s.StoreID = e.StoreID
WHERE ActiveFlag = '1';

/*4. Displays each product and its corresponding supplier. The outer join is necessary to display ALL products, whether or not they have a corresponding supplier listed in the database. An inner join would have omitted Giant Nerds, Nerds, and M&Ms from the result table.*/
SELECT P.Name, S.Name
FROM Products AS P
LEFT OUTER JOIN Suppliers AS S ON P.SupplierID = S.SupplierID;

/*5. Uses a subquery to display the name and price of products whose price is greater than the average price.*/
SELECT Name, Price
FROM Products
WHERE Price > (
	SELECT Avg(Price) AS AveragePrice
	FROM dbo.Products)
ORDER BY Price;


/*Team: Bida Candy Store
Members: Bradley Darling, Catherine Li, Brandon Tomlinson*/

/*Create database BidaCandy*/
CREATE DATABASE BidaCandy;
GO

USE BidaCandy;
GO

/*Create tables: Products, StoreProduct, Suppliers, SalesHeader, Sales, Customers, Stores, Employees*/

CREATE TABLE [Products] (
  [ProductID] Int,
  [Name] text,
  [Price] money,
  [MeasureUnit] text,
  [SupplierID] int,
  PRIMARY KEY ([ProductID])
);

CREATE TABLE [StoreProduct] (
  [StoreProductID] int,
  [ProductID] int,
  [StoreID] int,
  PRIMARY KEY ([StoreProductID])
);

CREATE TABLE [Suppliers] (
  [SupplierID] int,
  [Name] text,
  [Address] text,
  [PhoneNumber] text,
  PRIMARY KEY ([SupplierID])
);

CREATE TABLE [SalesHeader] (
  [SalesHeaderID] int,
  [Quantity] int,
  [ProductID] int,
  [SalesID] int,
  PRIMARY KEY ([SalesHeaderID])
);

CREATE TABLE [Sales] (
  [SalesID] int,
  [Date] datetime,
  [TaxAmount] money,
  [OrderTotal] int,
  [StoreID] int,
  [CustomerID] int,
  PRIMARY KEY ([SalesID])
);

CREATE TABLE [Customers] (
  [CustomerID] int,
  [FirstName] text,
  [LastName] text,
  [Email] text,
  [Address] text,
  [RewardsMemberFlag] bit,
  PRIMARY KEY ([CustomerID])
);

CREATE TABLE [Stores] (
  [StoreID] int,
  [Store Name] text,
  [Address Line 1] text,
  [Address Line 2] text,
  [City] text,
  [State] text,
  [Zip Code] text,
  PRIMARY KEY ([StoreID])
);

CREATE TABLE [Employees] (
  [EmployeeID] int,
  [FirstName] text,
  [LastName] text,
  [Address] text,
  [PayRate] money,
  [PhoneNumber] text,
  [Email] text,
  [HireDate] date,
  [ActiveFlag] bit,
  [StoreID] int,
  PRIMARY KEY ([EmployeeID])
);


/*Create foreign keys*/
ALTER TABLE SalesHeader ADD CONSTRAINT FK_Products_SalesHeader 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
GO

ALTER TABLE SalesHeader ADD CONSTRAINT FK_Sales_SalesHeader 
FOREIGN KEY (SalesID) REFERENCES Sales(SalesID);
GO

ALTER TABLE Products ADD CONSTRAINT FK_Suppliers_Products 
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);
GO

ALTER TABLE Employees ADD CONSTRAINT FK_Stores_Employees
FOREIGN KEY (StoreID) REFERENCES Stores(StoreID);
GO

ALTER TABLE Sales ADD CONSTRAINT FK_Stores_Sales 
FOREIGN KEY (StoreID) REFERENCES Stores(StoreID);
GO

ALTER TABLE Sales ADD CONSTRAINT FK_Customers_Sales 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
GO

ALTER TABLE StoreProduct ADD CONSTRAINT FK_Products_StoreProduct 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
GO

ALTER TABLE StoreProduct ADD CONSTRAINT FK_Stores_StoreProduct 
FOREIGN KEY (StoreID) REFERENCES Stores(StoreID);
GO

/*Insert data into tables in the following order: Customers, Stores, Employees, Suppliers, Products, StoreProduct, Sales, SalesHeader.
Data was inserted in Data View, and the script was generated automatically.*/

INSERT INTO [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Address], [RewardsMemberFlag]) VALUES
(1, N'Dylan', N'Reed', N'dreed@gmail.com', N'5 Blue Way San Francisco, CA 23490', 1),
(2, N'Catherine', N'Harris', N'charris@gmail.com', N'471 Young Dr. Elmont, NY 11003', 1),
(3, N'Crystal', N'Anderson', N'canderson@gmail.com', N'654 Rose Drive Elmhurst, NY 11373', 0),
(4, N'Amy', N'Walker', N'awalker@gmail.com', N'89 Prospect Dr. Oxnard, CA 93035', 1),
(5, N'Carla', N'Wilson', N'cwilson@gmail.com', N'23 S. Johnson Dr. Quakertown, PA 18951', 1),
(6, N'Justin', N'Li', N'jli@gmail.com', N'3 Purple Way New York, NY 73842', 0),
(7, N'Melissa', N'Jackson', N'mjackson@gmail.com', N'9 Whitemarsh Rd. Mcallen, TX 78501', 1),
(8, N'Anthony', N'Williams', N'awilliams@gmail.com', N'7995 Bear Hill St. Salisbury, MD 21801', 1),
(9, N'Joseph', N'Clark', N'jclark@me.com', N'9619 Buttonwood Rd. Elmhurst, NY 11373', 0),
(10, N'Theodore', N'Martinez', N'tmartinez@yahoo.com', N'576 Greystone Ave. Woonsocket, RI 02895', 1),
(11, N'Andrew', N'Thomas', N'athomas@gmail.com', N'9002 Princess St. Cranford, NJ 07016', 1),
(12, N'Cynthia', N'Porter', N'cporter@gmail.com', N'46 Hill Field Avenue Redford, MI 48239', 1),
(13, N'Olivia', N'Miller', N'omiller@gmail.com', N'272 South Lawrence St. Michigan City, IN 46360', 1),
(14, N'Megan', N'Lewis', N'mlewis@me.com', N'81 Circle Drive Portage, IN 46368', 0),
(15, N'Freddie', N'Robinson', N'frobinson@aol.com', N'640 Garfield Rd. Champlin, MN 55316', 0),
(16, N'Daniel', N'Martin', N'dmartin@yahoo.com', N'17 Galvin St. Worcester, MA 01604', 1),
(17, N'Teresa', N'Taylor', N'ttaylor@gmail.com', N'429 Cherry Ave. Somerset, NJ 08873', 0),
(18, N'John', N'Thompson', N'jthompson@aol.com', N'9397 Mayfair Drive Goshen, IN 46526', 0),
(19, N'George', N'Lucas', N'glucas@gmail.com', N'6 Peach St. Atlanta, GA 38749', 0),
(20, N'Nicole', N'Moore', N'nmoore@gmail.com', N'299 Boston Rd. Deerfield, IL 60015', 0),
(21, N'Jenna', N'Young', N'jyoung@aol.com', N'489 Cemetery Street San Lorenzo, CA 94580', 1),
(22, N'Rachel', N'Lee', N'rlee@gmail.com', N'4 Yellow Dr New York, NY 98375', 0),
(23, N'Elizabeth', N'Bommer', N'ebommer@gmail.com', N'1 Red St. Boston, MA 23489', 1),
(24, N'Lily', N'Brown', N'lbrown@gmail.com', N'10 Point Way Seattle, WA 38745', 0),
(25, N'Christopher', N'Smith', N'csmith@gmail.com', N'922 E. Shore Drive Watertown, MA 02472', 1),
(26, N'David', N'King', N'dking@yahoo.com', N'39 El Dorado Street Flint, MI 48504', 1),
(27, N'Jeffery', N'Johnson', N'jjohnson@gmail.com', N'601 Catherine Drive Winona, MN 55987', 1),
(28, N'Macy', N'Brown', N'mbrown@gmail.com', N'9 Melon St. Dallas, TX 39423', 1),
(29, N'Joseph', N'White', N'jwhite@gmail.com', N'560 W. Glenwood Dr. New Windsor, NY 12553', 1),
(30, N'Anna', N'Garcia', N'agarcia@yahoo.com', N'9758 Roosevelt St. Cambridge, MA 02138', 1),
(31, N'Natasha', N'Jones', N'njones@gmail.com', N'803 Studebaker Rd. Conway, SC 29526', 1),
(32, N'Matthew', N'	Davis', N'mdavis@gmail.com', N'9560 Santa Clara St. Melbourne, FL 32904', 0),
(33, N'Matthew', N'Allen', N'mallen@gmail.com', N'9117 Courtland Ave. Conyers, GA 30012', 1),
(34, N'Amy', N'Hall', N'ahall@gmail.com', N'8 Bear Hill St. Daphne, AL 36526', 0),
(35, N'Henry', N'James', N'hjames@gmail.com', N'7 Strawberry Road Houston, TX 23948', 0),
(36, N'Selena', N'Panta', N'spanta@gmail.com', N'2 Green St. Wellesley, MA 02457', 1),
(37, N'Christopher', N'Rodriguez', N'crodriguez@gmail.com', N'424 Carson Lane South Plainfield, NJ 07080', 1),
(38, N'Jack', N'Dillon', N'jma@gmail.com', N'8 Grape Road Los Angeles, CA 28375', 1);

INSERT INTO [dbo].[Stores] ([StoreID], [Store Name], [Address Line 1], [Address Line 2], [City], [State], [Zip Code]) VALUES
(1, N'Boston Store', N'215 Park St', NULL, N'Boston', N'MA', N'01841'),
(2, N'Wellesley Store', N'231 Forest St', NULL, N'Wellesley', N'MA', N'02457'),
(3, N'New York Store (Downtown),', N'24 9th Ave', NULL, N'New York', N'NY', N'11379'),
(4, N'New York Store (Midtown),', N'53 54th st', NULL, N'New York', N'NY', N'10024'),
(5, N'San Francisco Store', N'3042 Lake Way', NULL, N'San Francisco', N'CA', N'94016'),
(6, N'Atlanta Store', N'2394 Peach St', NULL, N'Atlanta', N'GA', N'75063'),
(7, N'Houston Store', N'1234 Cowboy Rd', NULL, N'Houston', N'TX', N'77015'),
(8, N'Los Angeles Store', N'23 Beach St', NULL, N'Los Angeles', N'CA', N'90011'),
(9, N'Dallas Store', N'453 Apple Drive', NULL, N'Dallas', N'TX', N'75104'),
(10, N'Seattle Store', N'12 5th St', NULL, N'Seattle', N'WA', N'98114');

INSERT INTO [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Address], [PayRate], [PhoneNumber], [Email], [HireDate], [ActiveFlag], [StoreID]) VALUES
(1, N'Jenny', N'Ho', N'1 Hunter St. Boston, MA 23489', CAST(10.0000 AS Money), N'3208434957', N'jho47@gmail.com', N'2016-01-17', 1, 1),
(2, N'Ji Hwan', N'Kim', N'2 Orange St. Wellesley, MA 02457', CAST(10.0000 AS Money), N'4359487435', N'jkim12@gmail.com', N'2015-01-01', 1, 2),
(3, N'Amy', N'Donnell', N'3 Water Way New York, NY 73842', CAST(10.0000 AS Money), N'4948523955', N'adonnell@gmail.com', N'2015-01-01', 1, 3),
(4, N'Kate', N'Green', N'4 Door Dr New York, NY 98375', CAST(10.0000 AS Money), N'5230982349', N'kgreen@gmail.com', N'2015-01-01', 1, 4),
(5, N'James', N'Myers', N'5 Fit Way San Francisco, CA 23490', CAST(10.0000 AS Money), N'2509235928', N'jmyers@gmail.com', N'2017-01-25', 1, 5),
(6, N'George', N'Lee', N'6 Penelope St. Atlanta, GA 38749', CAST(10.0000 AS Money), N'2349823042', N'glee@gmail.com', N'2016-10-08', 1, 6),
(7, N'Dennis', N'Logan', N'7 Mirror Road Houson, TX 23948', CAST(10.0000 AS Money), N'8765875324', N'dlogan@yahoo.com', N'2015-01-01', 1, 7),
(8, N'Eva', N'Pantua', N'8 White Road Los Angeles, CA 28375', CAST(10.0000 AS Money), N'3043924423', N'epantua24@aol.com', N'2016-02-17', 1, 8),
(9, N'Holly', N'Road', N'9 Poplar St. Dallas, TX 39421', CAST(10.0000 AS Money), N'2447983292', N'roadh8@gmail.com', N'2016-05-04', 1, 9),
(10, N'Lisa', N'Jerard', N'10 Mars Way Seattle, WA 38745', CAST(10.0000 AS Money), N'13493403240', N'ljerard0@yahoo.com', N'2016-08-23', 1, 10);

INSERT INTO [dbo].[Suppliers] ([SupplierID], [Name], [Address], [PhoneNumber]) VALUES
(00001, 'Hershys Inc', '231 Forest St. Wellesley, MA', 6172313215),
(00002, 'Mars Co', '123 Old Park Way Boston, MA', 7185439876),
(00003, 'Wholesale Chocolate', '342 104th St New York, NY', 9176347822),
(00004, 'Candy Manufacturers Ltd', '536 24th St New York, NY', 2126348750),
(00005, 'Fruity Sweets', '466 Lake Rd Hartford, CT', 7814357830),
(00006, 'Mom and Pop Candy', '453 Park Pl Atlanta, GA', 6173248470),
(00007, 'Costco Wholesale', '586 Pond St. Seattle, WA', 7812390823),
(00008,	'Specialty Confections', '1834 Green Pl Los Angeles, CA', 2122349830),
(00009,	'SugarStop', '4575 Red St. San Jose, CA', 8082938472),
(00010,	'CandyFactory', '23 Moon Dr Houston, TX', 2321248372);

INSERT INTO [dbo].[Products] ([ProductID], [Name], [Price], [MeasureUnit], [SupplierID]) VALUES 
(1109, N'Hershey Kisses', CAST(3.0000 AS Money), N'lb', 1),
(1329, N'Swedish Fish', CAST(1.5000 AS Money), N'unit', 1),
(1816, N'Almond Joy', CAST(1.0000 AS Money), N'unit', 2),
(2068, N'Snickers', CAST(2.0000 AS Money), N'unit', 6),
(2089, N'Kit Kat', CAST(1.5000 AS Money), N'unit', 3),
(2482, N'Candy Corn', CAST(5.0000 AS Money), N'lb', 8),
(2712, N'Junior Mints', CAST(1.0000 AS Money), N'unit', 1),
(2895, N'Pocky', CAST(1.7500 AS Money), N'unit', 2),
(3492, N'Twizzlers', CAST(3.0000 AS Money), N'unit', 2),
(3795, N'Sweet Tarts', CAST(0.5000 AS Money), N'unit', 10),
(3975, N'Giant Hershey Bar', CAST(15.0000 AS Money), N'unit', 1),
(4071, N'Giant Nerds', CAST(15.0000 AS Money), N'unit', 6),
(4738, N'Milk Duds', CAST(5.0000 AS Money), N'lb', 2),
(4828, N'Giant Gummy Bear', CAST(15.0000 AS Money), N'unit', 7),
(5267, N'Tootsie', CAST(0.2500 AS Money), N'unit', 8),
(6206, N'Nestle Crunch', CAST(1.5000 AS Money), N'unit', 3),
(6208, N'3 Musketeers', CAST(2.0000 AS Money), N'unit', 4),
(6571, N'Twix', CAST(1.7500 AS Money), N'unit', 6),
(6672, N'Jolly Racher', CAST(0.5000 AS Money), N'unit', 5),
(6967, N'Bottle Caps', CAST(5.0000 AS Money), N'lb', 1),
(7798, N'Reeses', CAST(1.5000 AS Money), N'unit', 3),
(7954, N'Sour Patch Kids', CAST(2.0000 AS Money), N'unit', 2),
(9148, N'Fun Dip', CAST(1.2500 AS Money), N'unit', 3),
(9371, N'Nerds', CAST(1.0000 AS Money), N'unit', 1),
(9544, N'Milky Way', CAST(2.0000 AS Money), N'unit', 1),
(9587, N'Laffy Taffy', CAST(0.5000 AS Money), N'unit', 6),
(9720, N'M&Ms', CAST(4.0000 AS Money), N'lb', 7),
(9787, N'Giant Lollipop', CAST(10.0000 AS Money), N'unit', 6),
(9959, N'Pop Rocks', CAST(0.5000 AS Money), N'unit', 6);

INSERT INTO [dbo].[StoreProduct] ([StoreProductID], [ProductID], [StoreID]) VALUES
(1, 1109, 1),
(2, 1109, 2),
(3, 1109, 3),
(4, 1329, 4),
(5, 1329, 5),
(6, 1329, 6),
(7, 1816, 7),
(8, 1816, 8),
(9, 1816, 9),
(10, 2068, 10),
(11, 2068, 1),
(12, 2089, 2),
(13, 2089, 3),
(14, 2482, 4),
(15, 2482, 5),
(16, 2482, 6),
(17, 2712, 7),
(18, 2712, 8),
(19, 2895, 9),
(20, 2895, 10),
(21, 2895, 1),
(22, 2895, 2),
(23, 3492, 3),
(24, 3492, 4),
(25, 3795, 5),
(26, 3795, 6),
(27, 3975, 7),
(28, 4071, 8),
(29, 4738, 9),
(30, 4828, 10),
(31, 5267, 1),
(32, 6206, 1),
(33, 5267, 2),
(34, 6208, 2),
(35, 6208, 3),
(36, 6571, 3),
(37, 6672, 4),
(38, 6967, 5),
(39, 7798, 6),
(40, 7954, 8),
(41, 9148, 5),
(42, 9371, 10),
(43, 9544, 3),
(44, 9587, 8),
(45, 9720, 7),
(46, 9959, 9),
(47, 9959, 1),
(48, NULL, 1),
(49, 9959, 2),
(50, 9959, 3);

INSERT INTO [dbo].[Sales] ([SalesID], [Date], [TaxAmount], [StoreID], [CustomerID]) VALUES
(1, N'2016-01-23 00:00:00', CAST(0.0750 AS Money), 1, 1),
(2, N'2016-03-11 00:00:00', CAST(0.0750 AS Money), 3, 2),
(3, N'2015-03-30 00:00:00', CAST(0.0750 AS Money), 5, 3),
(4, N'2015-10-08 00:00:00', CAST(0.0750 AS Money), 5, 4),
(5, N'2015-12-17 00:00:00', CAST(0.0750 AS Money), 6, 5),
(6, N'2017-01-03 00:00:00', CAST(0.0750 AS Money), 10, 6),
(7, N'2016-05-07 00:00:00', CAST(0.0750 AS Money), 2, 7),
(8, N'2015-09-21 00:00:00', CAST(0.0750 AS Money), 1, 7),
(9, N'2016-07-26 00:00:00', CAST(0.0750 AS Money), 4, 8),
(10, N'2016-10-07 00:00:00', CAST(0.0750 AS Money), 7, 9),
(11, N'2016-04-20 00:00:00', CAST(0.0750 AS Money), 5, 10),
(12, N'2016-12-31 00:00:00', CAST(0.0750 AS Money), 3, 11),
(13, N'2016-04-05 00:00:00', CAST(0.0750 AS Money), 9, 12),
(14, N'2015-03-01 00:00:00', CAST(0.0750 AS Money), 2, 13),
(15, N'2016-04-16 00:00:00', CAST(0.0750 AS Money), 8, 14),
(16, N'2016-01-05 00:00:00', CAST(0.0750 AS Money), 5, 15),
(17, N'2015-08-15 00:00:00', CAST(0.0750 AS Money), 9, 16),
(18, N'2017-01-03 00:00:00', CAST(0.0750 AS Money), 3, 17),
(19, N'2015-02-09 00:00:00', CAST(0.0750 AS Money), 5, 18),
(20, N'2015-10-24 00:00:00', CAST(0.0750 AS Money), 10, 19),
(21, N'2015-11-06 00:00:00', CAST(0.0750 AS Money), 1, 19),
(22, N'2015-03-27 00:00:00', CAST(0.0750 AS Money), 3, 20),
(23, N'2015-06-07 00:00:00', CAST(0.0750 AS Money), 3, 21),
(24, N'2015-07-05 00:00:00', CAST(0.0750 AS Money), 2, 21),
(25, N'2015-03-09 00:00:00', CAST(0.0750 AS Money), 4, 22),
(26, N'2016-12-18 00:00:00', CAST(0.0750 AS Money), 3, 23),
(27, N'2015-12-27 00:00:00', CAST(0.0750 AS Money), 4, 24),
(28, N'2017-02-17 00:00:00', CAST(0.0750 AS Money), 1, 25),
(29, N'2016-09-23 00:00:00', CAST(0.0750 AS Money), 8, 26),
(30, N'2016-03-31 00:00:00', CAST(0.0750 AS Money), 1, 27),
(31, N'2016-03-06 00:00:00', CAST(0.0750 AS Money), 2, 28),
(32, N'2016-12-05 00:00:00', CAST(0.0750 AS Money), 8, 28),
(33, N'2016-02-22 00:00:00', CAST(0.0750 AS Money), 1, 29),
(34, N'2016-05-14 00:00:00', CAST(0.0750 AS Money), 7, 30),
(35, N'2015-04-27 00:00:00', CAST(0.0750 AS Money), 2, 31),
(36, N'2015-04-23 00:00:00', CAST(0.0750 AS Money), 7, 32),
(37, N'2017-03-12 00:00:00', CAST(0.0750 AS Money), 1, 33),
(38, N'2016-07-26 00:00:00', CAST(0.0750 AS Money), 2, 34),
(39, N'2016-10-07 00:00:00', CAST(0.0750 AS Money), 1, 35),
(40, N'2017-03-12 00:00:00', CAST(0.0750 AS Money), 1, 36),
(41, N'2015-08-15 00:00:00', CAST(0.0750 AS Money), 8, 37),
(42, N'2016-07-26 00:00:00', CAST(0.0750 AS Money), 2, 38),
(43, N'2016-02-22 00:00:00', CAST(0.0750 AS Money), 6, 38),
(44, N'2017-02-17 00:00:00', CAST(0.0750 AS Money), 2, 2);

INSERT INTO [dbo].[SalesHeader] ([SalesHeaderID], [Quantity], [ProductID], [SalesID]) VALUES
(1, 4, 1109, 1),
(2, 7, 3795, 1),
(3, 22, 6672, 2),
(4, 12, 3975, 3),
(5, 1, 2482, 4),
(6, 10, 6967, 5),
(7, 10, 2712, 6),
(8, 1, 2895, 7),
(9, 11, 1109, 7),
(10, 21, 5267, 8),
(11, 19, 3492, 9),
(12, 16, 2895, 10),
(13, 6, 5267, 10),
(14, 9, 2068, 11),
(15, 2, 2895, 12),
(16, 12, 2089, 13),
(17, 24, 6206, 14),
(18, 19, 2482, 14),
(19, 4, 3975, 15),
(20, 14, 4071, 16),
(21, 4, 4828, 17),
(22, 11, 4738, 18),
(23, 20, 4738, 19),
(24, 16, 2068, 20),
(25, 25, 2482, 21),
(26, 9, 1329, 21),
(27, 20, 5267, 22),
(28, 20, 1816, 22),
(29, 12, 6571, 23),
(30, 13, 1329, 23),
(31, 3, 6208, 23),
(32, 8, 1816, 24),
(33, 1, 6672, 25),
(34, 2, 1109, 26),
(35, 8, 7954, 27),
(36, 3, 7798, 28),
(37, 9, 1329, 29),
(39, 19, 9544, 30),
(40, 13, 9544, 31),
(41, 2, 7798, 32),
(42, 7, 9720, 34),
(43, 9, 9544, 35),
(44, 2, 9720, 35),
(45, 5, 6967, 36),
(46, 1, 9544, 37),
(47, 1, 9787, 38),
(48, 18, 9959, 39),
(49, 3, 7798, 39),
(50, 25, 9959, 5),
(51, 6, 9148, 8);

/*Test query: Order Revenue*/
SELECT SUM((SH.Quantity*P.Price)) AS OrderRevenue
FROM SalesHeader AS SH
JOIN Products AS P ON SH.ProductID = P.ProductID
GROUP BY SalesHeaderID;
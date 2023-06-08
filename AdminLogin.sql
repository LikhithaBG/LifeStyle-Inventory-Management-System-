create database lifestyle;


CREATE TABLE AdminLogin (
  AdminID INT IDENTITY(1,1) PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Password VARCHAR(50) NOT NULL,

  CONSTRAINT CHK_AdminLogin_Email CHECK (Email LIKE '%@gmail.com'),
  CONSTRAINT CHK_AdminLogin_Password CHECK (LEN(Password) >= 6 AND Password LIKE '%[0-9]%' AND Password LIKE '%[a-zA-Z]%')
);


INSERT INTO AdminLogin (FirstName, LastName, Email, Password) VALUES 
('Divyashree', 'C', 'Divyashreec@gmail.com','Admin@123'),
('Syed', 'Ayan', 'ayan@gmail.com','Admin@123'), 
('Likhitha', 'B G', 'likhitha@gmail.com','Admin@123');


select * from AdminLogin;

CREATE TABLE Categories (
  category_id INT IDENTITY(1,1) PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL,
  UNIQUE(category_name)
);


INSERT INTO Categories ( category_name) VALUES ('Kitchen-items');
INSERT INTO Categories ( category_name) VALUES ('Furniture-items');
INSERT INTO Categories ( category_name) VALUES ('Laundry-items');
INSERT INTO Categories ( category_name) VALUES ('Cooling Appliances');
INSERT INTO Categories ( category_name) VALUES ('Entertainment Appliances');

select * from Categories;



CREATE TABLE Inventories (
  inventory_id INT IDENTITY(1,1) PRIMARY KEY,
  category_id INT,
  inventory_name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  quantity INT NOT NULL,
  seller VARCHAR(255) NOT NULL,
  description TEXT,
  sold_items INT,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);


INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (1, 'Refrigerators', 30000, 10, 'No1 Electronics showroom', 'A wide range of refrigerators for your kitchen',5);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (1, 'Stoves', 15000, 5, 'Best Appliances showroom', 'Gas and electric stoves for cooking purposes',6);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (1, 'Ovens', 5000, 10, 'Home Appliances Inc.', 'Built-in and countertop ovens for baking',5);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (1, 'Microwaves', 7000, 15, 'Appliance World', 'Compact and versatile microwaves for quick heating',3);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (1, 'Blenders', 3500, 10, 'Kitchen Essentials', 'High-performance blenders for smoothies and food processing',6);

select * from Inventories;


INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (2, 'Sofas', 28500, 3, 'Furniture World', 'Comfortable and stylish sofas for your living room',1);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (2, 'Couches', 12000, 5, 'Home Decor Inc.', 'Variety of couches in different styles and colors',3);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (2, 'Coffee tables', 15000, 8, 'Furniture Land', 'Functional and modern coffee tables for your space',4);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (2, 'Chairs', 25000, 10, 'Comfort Furniture', 'Wide range of chairs for different purposes',3);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (2, 'Wardrobes', 35000, 2, 'Home Essentials', 'Spacious and organized wardrobes for storage',0);

select * from Inventories;

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (3, 'Washing machines', 25000, 5, 'Appliance World', 'High-quality washing machines for efficient laundry',2);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (3, 'Dryers', 15000, 3, 'Home Appliance Inc.', 'Various dryers with advanced drying technologies',1);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (3, 'Irons', 1500, 10, 'Iron Works', 'Steam irons for wrinkle-free clothes',2);


select * from Inventories;

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (4, 'Fans', 1500, 8, 'Cool Breeze Appliances', 'Variety of fans for cooling during hot days'6);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (4, 'Air conditioners', 8000, 3, 'Climate Control Systems', 'Energy-efficient air conditioners for cooling your space',1);

select * from Inventories;

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (5, 'Televisions', 25000, 10, 'ElectroTech Inc.', 'High-definition smart televisions with various screen sizes',4);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (5, 'Sound systems', 10000, 5, 'AudioTech Solutions', 'Immersive sound systems for an enhanced audio experience',3);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (5, 'DVD/Blu-ray players', 7000, 8, 'Entertainment Zone', 'Multifunctional DVD/Blu-ray players with built-in streaming capabilities',1);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description,sold_items)
VALUES (5, 'Gaming consoles', 5000, 3, 'GameTech Store', 'Popular gaming consoles for an exceptional gaming experience',1);



select * from Inventories;




CREATE TABLE Reports (
  report_id INT PRIMARY KEY,
  category_id INT,
  category_name VARCHAR(255),
  total_items INT NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

select * from Reports;



CREATE TABLE Users (
  user_id INT NOT NULL,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  category_name VARCHAR(255) NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (category_name) REFERENCES Categories(category_name)
);

select * from Users;



-- Create the stored procedure for reporting categories 
CREATE PROCEDURE Generate_Categories_Report
AS
BEGIN
  SELECT c.category_id, c.category_name, COUNT(*) AS total_inventories, SUM(i.quantity) AS total_quantity, SUM(i.price) AS total_price,
    SUM(i.quantity - ISNULL(i.sold_items, 0)) AS remaining_quantity
  FROM Categories c
  LEFT JOIN Inventories i ON c.category_id = i.category_id
  GROUP BY c.category_id, c.category_name;
END;

EXEC Generate_Categories_Report;


--this below store procedure is used to calculate the remaining no-product of product after it is sold in sold_items

CREATE PROCEDURE InsertInventoryWithSoldItems
    @category_id INT,
    @inventory_name VARCHAR(255),
    @price DECIMAL(10, 2),
    @quantity INT,
    @seller VARCHAR(255),
    @description TEXT,
    @sold_items INT
AS
BEGIN
    -- Insert the new inventory record
    INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items)
    VALUES (@category_id, @inventory_name, @price, @quantity, @seller, @description, @sold_items);

    -- Calculate the remaining quantity after sale
    DECLARE @remaining_quantity INT;
    SET @remaining_quantity = @quantity - @sold_items;

    -- Show the remaining quantity
    SELECT @remaining_quantity AS remaining_quantity;
END;

EXEC InsertInventoryWithSoldItems
    @category_id = 1,
    @inventory_name = 'Refrigerators',
    @price = 30000,
    @quantity = 10,
    @seller = 'No1 Electronics showroom',
    @description = 'A wide range of refrigerators for your kitchen',
    @sold_items = 5;


CREATE PROCEDURE Calculate_Remaining_Quantity
AS
BEGIN
    -- Calculate the remaining quantity for all items
    SELECT inventory_id, inventory_name, quantity - sold_items AS remaining_quantity
    FROM Inventories;
END;

EXEC Calculate_Remaining_Quantity;


--to calculate total sum of the remaining product in a table

CREATE PROCEDURE Sum_RemainingQuantity
AS
BEGIN
  SELECT SUM(i.quantity - ISNULL(i.sold_items, 0)) AS total_remaining_quantity
  FROM Inventories i;
END;


EXEC Sum_RemainingQuantity;

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
  sold_date DATE,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);


-- Inserting data into the Inventories table
INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (1, 'Refrigerators', 30000, 10, 'No1 Electronics showroom', 'A wide range of refrigerators for your kitchen', 5, CAST('2023-06-01' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (1, 'Stoves', 15000, 5, 'Best Appliances showroom', 'Gas and electric stoves for cooking purposes', 6, CAST('2023-06-02' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (1, 'Ovens', 5000, 10, 'Home Appliances Inc.', 'Built-in and countertop ovens for baking', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (1, 'Microwaves', 7000, 15, 'Appliance World', 'Compact and versatile microwaves for quick heating', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (1, 'Blenders', 3500, 10, 'Kitchen Essentials', 'High-performance blenders for smoothies and food processing', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (2, 'Sofas', 28500, 3, 'Furniture World', 'Comfortable and stylish sofas for your living room', 1, CAST('2023-06-03' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (2, 'Couches', 12000, 5, 'Home Decor Inc.', 'Variety of couches in different styles and colors', 3, CAST('2023-06-04' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (2, 'Coffee tables', 15000, 8, 'Furniture Land', 'Functional and modern coffee tables for your space', 4, CAST('2023-06-05' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (2, 'Chairs', 25000, 10, 'Comfort Furniture', 'Wide range of chairs for different purposes', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (2, 'Wardrobes', 35000, 2, 'Home Essentials', 'Spacious and organized wardrobes for storage', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (3, 'Washing machines', 25000, 5, 'Appliance World', 'High-quality washing machines for efficient laundry', 2, CAST('2023-06-06' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (3, 'Dryers', 15000, 3, 'Home Appliance Inc.', 'Various dryers with advanced drying technologies', 1, CAST('2023-06-07' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (3, 'Irons', 1500, 10, 'Iron Works', 'Steam irons for wrinkle-free clothes', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (4, 'Fans', 1500, 8, 'Cool Breeze Appliances', 'Variety of fans for cooling during hot days', 2, CAST('2023-06-08' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (4, 'Air conditioners', 8000, 3, 'Climate Control Systems', 'Energy-efficient air conditioners for cooling your space', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (5, 'Televisions', 25000, 10, 'ElectroTech Inc.', 'High-definition smart televisions with various screen sizes', 3, CAST('2023-06-09' AS DATE));

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (5, 'Sound systems', 10000, 5, 'AudioTech Solutions', 'Immersive sound systems for an enhanced audio experience', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (5, 'DVD/Blu-ray players', 7000, 8, 'Entertainment Zone', 'Multifunctional DVD/Blu-ray players with built-in streaming capabilities', NULL, NULL);

INSERT INTO Inventories (category_id, inventory_name, price, quantity, seller, description, sold_items, sold_date)
VALUES (5, 'Gaming consoles', 5000, 3, 'GameTech Store', 'Popular gaming consoles for an exceptional gaming experience', NULL, NULL);

-- Query the Inventories table to verify the inserted data
SELECT * FROM Inventories;


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
  user_id INT IDENTITY(1,1) NOT NULL,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  category_name VARCHAR(255) NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (category_name) REFERENCES Categories(category_name)
);


select * from Users;




Drop Table Users;



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


------------------------------------------------------

-- Create the stored procedure
CREATE PROCEDURE GetMonthlySoldItemsReport
    @Year INT,
    @Month INT
AS
BEGIN
    -- Generate the monthly sold_items report
    SELECT category_id,
           inventory_name,
           SUM(sold_items) AS total_sold_items
    FROM Inventories
    WHERE YEAR(sold_date) = @Year AND MONTH(sold_date) = @Month
    GROUP BY category_id, inventory_name
    ORDER BY category_id, inventory_name;
END;

EXEC GetMonthlySoldItemsReport @Year = 2023, @Month = 6;

----------------------------------------------------

-- Create the stored procedure
CREATE PROCEDURE GetAllMonthlySoldItemsReports
AS
BEGIN
    -- Generate the monthly sold_items report for all months
    DECLARE @Year INT = YEAR(GETDATE());
    DECLARE @Month INT = 1;
    
    WHILE (@Year <= YEAR(GETDATE()))
    BEGIN
        WHILE (@Month <= 12)
        BEGIN
            -- Generate the monthly sold_items report for the current month and year
            EXEC GetMonthlySoldItemsReport @Year, @Month;
            
            -- Increment the month
            SET @Month = @Month + 1;
        END
        
        -- Reset the month and increment the year
        SET @Month = 1;
        SET @Year = @Year + 1;
    END
END;


EXEC GetAllMonthlySoldItemsReports;
---------------------------------------------------------------

-- Create the stored procedure
CREATE PROCEDURE GenerateCompleteMonthlyReportDetail
AS
BEGIN
    -- Create a temporary table to store the aggregated monthly sold_items report
    CREATE TABLE #MonthlySoldItemsReport (
        month_year VARCHAR(7),
        category_id INT,
        inventory_name VARCHAR(255),
        total_sold_items INT
    );

    -- Get the current year and month
    DECLARE @CurrentYear INT = YEAR(GETDATE());
    DECLARE @CurrentMonth INT = MONTH(GETDATE());

    -- Loop through all months and years
    DECLARE @Year INT = @CurrentYear;
    DECLARE @Month INT = 1;

    WHILE (@Year <= @CurrentYear)
    BEGIN
        WHILE (@Month <= 12)
        BEGIN
            -- Generate the monthly sold_items report for the current month and year
            INSERT INTO #MonthlySoldItemsReport
            SELECT CONVERT(VARCHAR(7), DATEFROMPARTS(@Year, @Month, 1), 120) AS month_year,
                   category_id,
                   inventory_name,
                   SUM(sold_items) AS total_sold_items
            FROM Inventories
            WHERE YEAR(sold_date) = @Year AND MONTH(sold_date) = @Month
            GROUP BY category_id, inventory_name;

            -- Increment the month
            SET @Month = @Month + 1;
        END

        -- Reset the month and increment the year
        SET @Month = 1;
        SET @Year = @Year + 1;
    END

    -- Select the aggregated monthly sold_items report
    SELECT month_year, category_id, inventory_name, total_sold_items
    FROM #MonthlySoldItemsReport
    WHERE total_sold_items = (SELECT MAX(total_sold_items) FROM #MonthlySoldItemsReport)
    ORDER BY month_year, category_id, inventory_name;

    -- Drop the temporary table
    DROP TABLE #MonthlySoldItemsReport;
END;



EXEC GenerateCompleteMonthlyReportDetail;


----------------------------------------------------------
--------------------------------------------------

-- Create the stored procedure
CREATE PROCEDURE GenerateCompleteMonthlyDetailReport
AS
BEGIN
    -- Create a temporary table to store the aggregated monthly sold_items report
    CREATE TABLE #MonthlySoldItemsReport (
        month_year VARCHAR(7),
        category_id INT,
        category_name VARCHAR(255),
        inventory_id INT,
        inventory_name VARCHAR(255),
        price DECIMAL(10, 2),
        quantity INT,
        seller VARCHAR(255),
        description TEXT,
        sold_items INT
    );

    -- Get the current year and month
    DECLARE @CurrentYear INT = YEAR(GETDATE());
    DECLARE @CurrentMonth INT = MONTH(GETDATE());

    -- Loop through all months and years
    DECLARE @Year INT = @CurrentYear;
    DECLARE @Month INT = 1;

    WHILE (@Year <= @CurrentYear)
    BEGIN
        WHILE (@Month <= 12)
        BEGIN
            -- Generate the monthly sold_items report for the current month and year
            INSERT INTO #MonthlySoldItemsReport
            SELECT CONVERT(VARCHAR(7), DATEFROMPARTS(@Year, @Month, 1), 120) AS month_year,
                   I.category_id,
                   C.category_name,
                   I.inventory_id,
                   I.inventory_name,
                   I.price,
                   I.quantity,
                   I.seller,
                   I.description,
                   I.sold_items
            FROM Inventories AS I
            INNER JOIN Categories AS C ON I.category_id = C.category_id
            WHERE YEAR(I.sold_date) = @Year AND MONTH(I.sold_date) = @Month;

            -- Increment the month
            SET @Month = @Month + 1;
        END

        -- Reset the month and increment the year
        SET @Month = 1;
        SET @Year = @Year + 1;
    END

    -- Select the aggregated monthly sold_items report
    SELECT month_year, category_id, category_name, inventory_id, inventory_name, price, quantity, seller, description, sold_items
    FROM #MonthlySoldItemsReport
    WHERE sold_items = (SELECT MAX(sold_items) FROM #MonthlySoldItemsReport)
    ORDER BY month_year, category_id, inventory_id;

    -- Drop the temporary table
    DROP TABLE #MonthlySoldItemsReport;
END;

EXEC GenerateCompleteMonthlyDetailReport;


----------------------------------
-------------------------------
--------------------------------

-- Create the stored procedure
CREATE PROCEDURE Generate_Complete_Monthly_Report
AS
BEGIN
    -- Create a temporary table to store the monthly sold_items report
    CREATE TABLE #MonthlySoldItemsReport (
        month_year VARCHAR(7),
        category_id INT,
        category_name VARCHAR(255),
        inventory_id INT,
        inventory_name VARCHAR(255),
        price DECIMAL(10, 2),
        quantity INT,
        seller VARCHAR(255),
        description TEXT,
        sold_items INT
    );

    -- Get the current year and month
    DECLARE @CurrentYear INT = YEAR(GETDATE());
    DECLARE @CurrentMonth INT = MONTH(GETDATE());

    -- Loop through all months and years
    DECLARE @Year INT = @CurrentYear;
    DECLARE @Month INT = 1;

    WHILE (@Year <= @CurrentYear)
    BEGIN
        WHILE (@Month <= 12)
        BEGIN
            -- Generate the monthly sold_items report for the current month and year
            INSERT INTO #MonthlySoldItemsReport
            SELECT CONVERT(VARCHAR(7), DATEFROMPARTS(@Year, @Month, 1), 120) AS month_year,
                   I.category_id,
                   C.category_name,
                   I.inventory_id,
                   I.inventory_name,
                   I.price,
                   I.quantity,
                   I.seller,
                   I.description,
                   I.sold_items
            FROM Inventories AS I
            INNER JOIN Categories AS C ON I.category_id = C.category_id
            WHERE YEAR(I.sold_date) = @Year AND MONTH(I.sold_date) = @Month;

            -- Increment the month
            SET @Month = @Month + 1;
        END

        -- Reset the month and increment the year
        SET @Month = 1;
        SET @Year = @Year + 1;
    END

    -- Select the aggregated monthly sold_items report
    SELECT month_year, category_id, category_name, inventory_id, inventory_name, price, quantity, seller, description, sold_items
    FROM #MonthlySoldItemsReport
    ORDER BY month_year, category_id, inventory_id;

    -- Drop the temporary table
    DROP TABLE #MonthlySoldItemsReport;
END;

EXEC Generate_Complete_Monthly_Report;



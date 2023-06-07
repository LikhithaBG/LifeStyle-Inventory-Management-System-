create database lifestyle;


CREATE TABLE Admin_login ( 
AdminID INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL,
Password VARCHAR(50) NOT NULL,
CONSTRAINT CHK_Admin_Email CHECK (Email LIKE '%@gmail.com') );


INSERT INTO Admin_login(FirstName, LastName, Email, Password) VALUES 
('Divyashree', 'C', 'Divyashreec@gmail.com','123'),
('Syed', 'Ayan', 'ayan@gmail.com','123'), 
('Likhitha', 'B G', 'likhitha@gmail.com','123');

select * from Admin_login;

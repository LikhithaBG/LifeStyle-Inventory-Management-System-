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





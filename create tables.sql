CREATE TABLE Admin ( id INT IDENTITY(1, 1) PRIMARY KEY, 
                     username VARCHAR(50) NOT NULL UNIQUE,
                     password VARCHAR(50) NOT NULL, 
                     email VARCHAR(100) NOT NULL);

CREATE TABLE Users ( id INT IDENTITY(1,1) PRIMARY KEY, 
                     name VARCHAR(100) NOT NULL,
                     username VARCHAR(50) NOT NULL UNIQUE,
                     email VARCHAR(100) NOT NULL,
                     password VARCHAR(100) NOT NULL);

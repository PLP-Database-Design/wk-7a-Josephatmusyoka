/* PLP Database Module - Week 7 Assignment: Database Design and Normalization */

/* Question 1 🛠️
   Achieving 1NF - Transforming ProductDetail table to eliminate multi-valued attributes */

-- Step 1: Create the normalized ProductDetail1NF table
CREATE TABLE ProductDetail1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Step 2: Insert normalized records
INSERT INTO ProductDetail1NF (OrderID, CustomerName, Product) VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


/* Question 2 🧩
   Achieving 2NF - Eliminating partial dependencies from OrderDetails table */

-- Step 1: Create the Customers table (CustomerName depends on OrderID)
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create the OrderItems table (Product and Quantity depend on OrderID)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Step 3: Insert data into Customers table
INSERT INTO Customers (OrderID, CustomerName) VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES 
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- I am creating a database Northwind to enable me import the Northwind dataset that i will use for my EDA
Drop database if exists northwind_d;
CREATE DATABASE northwind_d;
use northwind_d;

-- The below code will be used to check which database we are currently using and the tables in it.
select database();
show tables;

/* Data Cleaning in SQL: 
o Clean the database of any identified issues such as bad data, duplicates, NULL 
values, split full names to first name and last name etc. 
*/

-- I will use step by step, i will start by examining customers table to see the tables that have null values
SELECT * FROM northwind_d.customers; -- this query help to bring the customer table close to help see the columns that are contained inside the table
SELECT
  SUM(CustomerID IS NULL) AS CustomerID_nulls,
  SUM(CustomerName IS NULL) AS CustomerName_nulls,
  SUM(ContactName IS NULL) AS ContactName_nulls
  FROM Customers;
  
  -- ContactName has a null value, we can specifivcally look at the exact location that has a null value
  SELECT *
FROM customers
WHERE ContactName IS NULL;

-- Since it will  not be logical to drop the column, we can update the table to rename the null value as unknown
UPDATE customers
SET ContactName = 'Unknown'
WHERE CustomerID = 58 AND ContactName IS NULL;

--- I will confirm to ensure there is no other null values
SELECT SUM(ContactName IS NULL) AS ContactName_nulls
FROM customers;

--- Using `Trim` we can use the excess space spotted in address column, this will be usefull when i will be joining the tables
UPDATE customers
SET Address = TRIM(Address);


select * from northwind_d.categories;
--- Using `Trim` we can use the excess space spotted in CategoryName column, this will be usefull when i will be joining the tables

UPDATE categories
SET CategoryName = TRIM(CategoryName);

-- I am goping to coheck if the categories table has a null values
SELECT
  SUM(CategoryID IS NULL) AS CategoryID_nulls,
  SUM(CategoryName IS NULL) AS CategoryName_nulls,
  SUM(Description IS NULL) AS Description_nulls
  FROM categories;

-- For consistency in naming, i am going to rewrite the `BeVeRaGeS` as `Beverages`
update categories
set Categoryname = 'Beverages'
where Categoryname = 'BeVeRaGeS';

-- Using `Trim` we can remove the excess space spotted in Firstname column
SELECT * FROM northwind_d.employees;
UPDATE employees
SET Firstname = TRIM(Firstname);

update employees
set lastname = 'Smith'
where lastname = 'sMiTh';

-- Since lastname in employeeid 6 is null and notes in employee id 3 is null, i will replace the null vaklue with unknown. 
UPDATE employees
SET lastname = 'Unknown'
Where EmployeeID = 6;
UPDATE employees
set Notes = 'Unknown'
where employeeid= 3; 

SELECT * FROM northwind_d.orderdetails;
SELECT
  SUM(OrderdetailID IS NULL) AS OrderdetailID_nulls,
  SUM(OrderID IS NULL) AS OrderID_nulls,
  SUM(ProductID IS NULL) AS ProductID_nulls,
  SUM(Quantity IS NULL) AS Quantity_nulls
  FROM orderdetails;

-- we have one null value in quantity
select * 
from orderdetails where quantity is null;
-- the null value is at `orderdetailID` 196, I will replace this value with 0.
update orderdetails
Set quantity = 0
where OrderDetailID = 196 and Quantity is null;

SELECT * FROM northwind_d.orders;
SELECT
  SUM(OrderID IS NULL) AS OrderID_nulls,
  SUM(CustomerID IS NULL) AS CustomerID_nulls,
  SUM(EmployeeID IS NULL) AS EmployeeID_nulls,
  SUM(Orderdate IS NULL) AS Orderdate_nulls,
  SUM(ShipperID IS NULL) AS Shipperid_nulls
  FROM orders;
  
  -- There is one null value at Orderdate
  SELECT * 
  from orders where orderdate is null;
-- Since there is a null orderdate, i will replace it using the current date 
update orders
set orderdate = current_date()
where OrderID = 10258;

SELECT * FROM northwind_d.products;
SELECT
  SUM(ProductID IS NULL) AS ProductID_nulls,
  SUM(ProductName IS NULL) AS ProductName_nulls,
  SUM(SupplierID IS NULL) AS SupplierID_nulls,
  SUM(CategoryID IS NULL) AS CategoryID_nulls,
  SUM(Unit IS NULL) AS Unit_nulls,
  SUM(Price IS NULL) AS Price_nulls
  FROM products;

-- there is one null value at unit, i will look at the specific place where the null value is and replace it with unknown. 
select *
from products where unit is null;

update products
set unit = 'unknown'
where productID = 70;

-- Also there is a white space at productID 17, I will also remove this white space
update products
set productname = trim(productname);

-- There is a white space in shipperName that i will remove
SELECT * FROM northwind_d.shippers;
update shippers
set shippername = trim(shippername);

-- due to the incosnistency in Phone formatting, i will concantinate to ensure they are uniform
UPDATE shippers
SET Phone = CONCAT('(', SUBSTRING(Phone,1,3), ') ', SUBSTRING(Phone,4,3), '-', SUBSTRING(Phone,7,4))
WHERE Phone REGEXP '^[0-9]{10}$';

SELECT * FROM northwind_d.suppliers;
SELECT
  SUM(SupplierID IS NULL) AS SupplierID_nulls,
  SUM(SupplierName IS NULL) AS SupplierName_nulls,
  SUM(ContactName IS NULL) AS ContactName_nulls,
  SUM(Address IS NULL) AS Address_nulls,
  SUM(City IS NULL) AS City_nulls,
  SUM(PostalCode IS NULL) AS PostalCode_nulls,
  SUM(Country is Null) as Country_nulls,
  SUM(Phone is null) as phone_nulls
  FROM suppliers;
  
  --- There is one null value at contactName, will get the exact position to be able to replace it with a unknown
  select * from suppliers 
  where ContactName is null;
  
  update suppliers
  set ContactName = 'Unknown'
  where SupplierID = 21;
  
  UPDATE suppliers
  set Address = trim(address);

/*3. EDA in SQL:  
o Perform the following 20 specific exploratory queries at a minimum: 
*/

/*1. Write a query to find the 3rd highest price from the products table. 
*/
SELECT *
from products
order by price desc
limit 1 offset 2;

/*2. Write a query to identify customers with the most orders  
*/























--Data Definition Questions: (using SQL NOT GUI)
--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table Employees
(
ID int primary key identity,
Name varchar(255), 
Salary decimal

)




--Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table Employees
add Department varchar(50)
--Remove the "Salary" column from the "Employees" table.
alter table Employees
drop column Salary
--Rename the "Department" column in the "Employees" table to "DeptName".
exec sp_rename 'Employees.Department','DeptName','column'
--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table Projects
(
ProjectID int primary key identity,
ProjectName varchar(255), 

)


--Add a unique constraint to the "Name" column in the "Employees" table.
alter table Employees
add CONSTRAINT Employees_Name unique (Name);
--Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE Customers
(
    CustomerID int primary key identity,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    Status varchar(20)
);

--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table Customers
add constraint UQ_Customers_FirstName_LastName UNIQUE (FirstName, LastName);
--Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE Orders
(
    OrderID int primary key identity,
    CustomerID int,
    OrderDate datetime,
    TotalAmount decimal
);

--Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
alter table Orders 
add constraint checker check (totalAmount>0);
--Create a schema named "Sales" and move the "Orders" table into this schema.
go
create schema Sales
go
alter schema Sales
transfer dbo.Orders;
--Rename the "Orders" table to "SalesOrders."
exec sp_rename 'Sales.Orders','SalesOrders'

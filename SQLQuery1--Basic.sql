--First table - Employeee Demographics table
--CREATE TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--Second table - Employee salary table

--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int)

--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martins', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley','Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--INSERT INTO EmployeeSalary Values
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesmant', 47000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

-- ----------------------------------------------
-- Select Statement
/*
*, Top, Distinct, Count, As Mas, Min, Avg
*/

--SELECT Distinct(Gender)
--FROM "SQL Tutorial".dbo.EmployeeDemographics


/* Where Statement 
it helps to limit the set of data and specify which 
particular data you want.
=, =, <> , <, >, And, Or, Like, Null, Not Null, In
*/

--Select * from EmployeeDemographics
--where Age <> 30

--select * from EmployeeDemographics
--where LastName LIKE '%S'

--select *
--from EmployeeDemographics
--where LastName is not null

--select *
--from EmployeeDemographics
--where FirstName in ('Jim', 'Michael')

/*select *
from "SQL Tutorial".dbo.EmployeeDemographics
*/

--Insert into EmployeeDemographics values
--(1010, 'Promise', 'Ibediogwu', 29, 'Male'),
--(1011, 'Favour', 'Ibediogwu', 25, 'Male')

--create table FamilyTable
--(FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50))


--insert into FamilyTable values
--('Promise', 'Ekele', 27, 'Male'),
--('Favour', 'Ikechukwu', 25, 'Male'),
--('Amarachi', 'Favour', 24, 'Female'),
--('Vivian', 'Oyinyechi', 23, 'Female'),
--('Joy', 'Chinonyerem', 22, 'Female'),
--('Grace', 'Ugochi', 20, 'Female')


--select count(firstname) as guys from familytable
--where Gender <> 'Male'


/*
Group By, Order By
*/

select Gender, Age, Count(Age)
from EmployeeDemographics
group by Gender, Age

select Gender, count(Gender) as "Count Gender"
from EmployeeDemographics
where age > 31
group by Gender
order by "Count Gender" DESC











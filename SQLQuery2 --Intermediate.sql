-- Intermediate SQL 

/*
Inner Joins, Full/Left?Right Outer Joins
*/

/* A join is a way of combining multiple tables 
into a single output

inner Join is done base on the similary columns of both tables
Full out join is done combining all the items in the table 
Left outer join or Right outer join combines both tables but displays only the items on the left or right join
*/

--select * 
--from "SQL Tutorial".dbo.EmployeeDemographics 
--inner join "SQL Tutorial".dbo.EmployeeSalary
--On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


--select *
--from "SQL Tutorial".dbo.EmployeeDemographics
--full outer join "SQL Tutorial".dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--select *
--from "SQL Tutorial".dbo.EmployeeDemographics
--Right outer join "SQL Tutorial".dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
--from "SQL Tutorial".dbo.EmployeeDemographics
--inner join "SQL Tutorial".dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


--select *
--from EmployeeSalary

--select *
--from EmployeeDemographics


-- USE CASE (1) Employer wanting to know the heighest paid employee apart from him 
--Select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--from "SQL Tutorial".dbo.EmployeeDemographics
--inner join "SQL Tutorial".dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--where FirstName <> 'Michael'
--Order by Salary Desc

---- USE CASE (2) Angela want to know the average salary of her salesmen
--select JobTitle, AVG(Salary) as "Average Salary"
--from "SQL Tutorial".dbo.EmployeeDemographics
--inner join "SQL Tutorial".dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--where JobTitle = 'Salesman'
--Group by Jobtitle



/* Today's topic Union, Union All
The union combines both tables to form a single table
The difference between the join and the union is that the join combine the table based on their similarities
while the union just combines the tables

UNION remove the duplicates while UNION ALL shows duplicates inclusive
*/

--Create Table WareHouseEmployeeDemographics
--(EmployeeID int, FirstName varchar(50),
--LastName varchar(50), Age int, Gender Varchar(50))

--insert into WareHouseEmployeeDemographics values
--(1013, 'Darryl', 'Philbin', NULL,'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--insert into EmployeeDemographics values
--(1013, 'Darryl', 'Philbin', NULL,'Male')


--select * 
--from "SQL Tutorial".dbo.EmployeeDemographics
--UNION ALL
--select *
--from "SQL Tutorial".dbo.WareHouseEmployeeDemographics
--Order by EmployeeID


/* Today's Topic: Case Statement
its helps you to specify condition
and also to choose wat you want when the output is being displayed
*/

--select FirstName, LastName, Age, 
--CASE
--	When Age > 30 Then 'old'
--	when Age between 27 and 30 then 'Young'
--	Else 'Baby'
--End AS Category
--from [SQL Tutorial].dbo.EmployeeDemographics
--where age is not null
--order by age


---- USE CASE (1). the company want to give the employees of
---- salesmen a raise of 10%, Accountants a raise of 5%
---- HR a raise of 0.00001%
---- while other is 3%
---- from the employeedemographics and employeesalary tables.
---- using the case statement.

--select FirstName, LastName, JobTitle, Salary, 
--case
--	WHEN Jobtitle = 'Salesman' Then Salary + (Salary * 0.1)
--	when Jobtitle = 'Accountant' then Salary + (Salary * 0.05)
--	when JobTitle = 'HR' then Salary + (Salary *0.000001)
--	else salary + (Salary * 0.03)
--end as "Salary After Raise"
--from "SQL Tutorial".dbo.EmployeeDemographics
--join "SQL Tutorial".dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/* Today's Topic: Having Clause
An aggregate statement cannot be used in a WHERE statement
except in a  HAVING CLAUSE, and also the having clause is dependent on the groupby statement
therefore it should go after the groupby
*/

--eg

--select Jobtitle, COUNT(Jobtitle) as Jobcount
--from "SQL Tutorial".dbo.EmployeeDemographics
--join "SQL Tutorial".dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--group by JobTitle
--having COUNT(JobTitle) > 1

--Select Jobtitle, aVG(Salary) as Salary
--from "SQL Tutorial".dbo.EmployeeDemographics
--join "SQL Tutorial".dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--group by JobTitle
--having avg(salary) > 45000
--order by salary


/*
Today's Topic: Updating/Deleting Data
Updating alters the data in a table, and Deleting specifies
the row u want to remove
using the SET CLAUSE
*/

--select *
--from "SQL Tutorial".dbo.EmployeeDemographics

--Update "SQL Tutorial".dbo.EmployeeDemographics
--set Age = 30, Gender = 'Female'
--where EmployeeID = 1013 and FirstName = 'Darryl' and LastName = 'Philbin'

--delete from "SQL Tutorial".dbo.EmployeeDemographics
--where EmployeeID = 1005
-- using the above will make you delete the whole table from the database
-- so we do the below
-- you first of all select what you want to delete so as to be sure of what you want to delete

--select *
--from "SQL Tutorial".dbo.EmployeeDemographics
--where EmployeeID = 1004



/*
Today's Topic: Aliasing 
Aliasing is temporal changing of your column name or the table name
it is mostly useful for the readability of your script
*/
 
--select FirstName + ' ' + LastName AS Fullname
--from "SQL Tutorial".dbo.EmployeeDemographics

--select Demo.EmployeeID as Staff, Sal.Salary
--from "SQL Tutorial".dbo.EmployeeDemographics as Demo
--join "SQL Tutorial".dbo.EmployeeSalary as Sal
--on Demo.EmployeeID = Sal.EmployeeID


/*
Today's Topic: Partition By
The partition by divide the results into partitions
it doesnt summarise the whole table and remove the other records
just like the groupby does
*/

select dem.FirstName, dem.LastName, sal.Salary, dem.Gender, 
Count(dem.Gender) over (Partition by Gender) as TotalGender
from "SQL Tutorial".dbo.EmployeeDemographics dem
join "SQL Tutorial".dbo.EmployeeSalary sal
on dem.EmployeeID = sal.EmployeeID





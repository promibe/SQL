/*
Today's Topic: CTEs
CTE, common table Expression, it is a name temperal result set
which is use to manipulate the complex subquery result set
*/

WITH CTE_Employee as
(SELECT FirstName, Lastname, Gender, Salary,
COUNT(Gender) over (Partition by Gender) as TotalGender,
Avg(Salary) over (partition by Gender) as AvgSalary
from [SQL Tutorial].dbo.EmployeeDemographics as Demo
join [SQL Tutorial].dbo.EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeID
--Where Salary > '40000'
)

select * from 
CTE_Employee



/*
Today's Topic: Temp Tables
Temporary Tables is similar with the CTE but 
it can be used more than ones unlike the CTE
*/

CREATE TABLE #temp_Employee(
EmployeeID int,
JobTitle varchar(100),
Salary int)

select * from #temp_Employee

insert into #temp_Employee values
(1001, 'HR', 45000)

insert into #temp_Employee
select *
from [SQL Tutorial]..EmployeeSalary

DROP TABLE IF EXISTS #temp_Employee2
create table #Temp_Employee2(
Jobtitle varchar(50),
EmployeesPerJob Int,
AvgAge int,
AvgSalary int)

insert into #Temp_Employee2
select Jobtitle, Count(Jobtitle), Avg(Age), Avg(Salary)
from [SQL Tutorial]..EmployeeDemographics as Emp
join [SQL Tutorial]..EmployeeSalary as Sal
on Emp.EmployeeID = Sal.EmployeeID
group by JobTitle

select * from #Temp_Employee2


/*
Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


Create table EmployeeErrors(
EmployeeID Varchar(50),
FirstName Varchar(50),
LAstName Varchar(50)
)

Insert into EmployeeErrors Values
('1001  ', 'Jimbo','Halbert'),
('  1002', 'Pamela', 'Beasely'),
('1005','TOby','Flenderson - Fired')

Select * from EmployeeErrors

-- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(EmployeeID) as IDTRIM
from [SQL Tutorial]..EmployeeErrors

Select EmployeeID, LTRIM(EmployeeID) as IDLTRIM
from [SQL Tutorial]..EmployeeErrors

Select EmployeeID, RTRIM(EmployeeID) as IDRTRIM
from [SQL Tutorial]..EmployeeErrors


-- Using Replace
Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
from [SQL Tutorial]..EmployeeErrors

-- Using Substring
insert into EmployeeDemographics values
(1001, 'Toby', 'Halpert', 30,	'Male')

Update [SQL Tutorial].dbo.EmployeeDemographics
set EmployeeID = 1014
where FirstName = 'Toby'

select *
from EmployeeDemographics

Select err.FirstName, SUBSTRING(err.FirstName, 1,3), dem.FirstName, SUBSTRING(dem.FirstName, 1,3)
from EmployeeErrors err
JOIN EmployeeDemographics dem
	on SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)



-- Using UPPER and LOWER
select FirstName, LOWER(FirstName)
from EmployeeErrors

select FirstName, UPPER(FirstName)
from EmployeeErrors



/*
Today's Topic: Stored Procedures
this is a groups of SQL statements that has been created and
stored in the database.
*/


CREATE PROCEDURE TEST 
AS
Select *
from EmployeeDemographics

EXEC TEST

drop Table #Temp_Employee




CREATE PROCEDURE Temp_Employee
AS 
Create table #temp_employee(
Jobtitle varchar(100),
EmployeesPerJob Int,
AvgAge int,
AvgSalary int)

insert into #temp_employee
select Jobtitle, Count(Jobtitle), Avg(Age), Avg(Salary)
from [SQL Tutorial]..EmployeeDemographics as Emp
join [SQL Tutorial]..EmployeeSalary as Sal
on Emp.EmployeeID = Sal.EmployeeID
group by JobTitle

select * from #temp_Employee

Exec Temp_Employee



----- Altering procedure

Alter PROCEDURE [dbo].[Temp_Employee]
@jobTitle nvarchar(100)
AS 
Create table #temp_employee(
Jobtitle varchar(100),
EmployeesPerJob Int,
AvgAge int,
AvgSalary int)

insert into #temp_employee
select Jobtitle, Count(Jobtitle), Avg(Age), Avg(Salary)
from [SQL Tutorial]..EmployeeDemographics as Emp
join [SQL Tutorial]..EmployeeSalary as Sal
on Emp.EmployeeID = Sal.EmployeeID
where Jobtitle = @jobTitle
group by JobTitle

select * from #temp_Employee

exec Temp_Employee @jobtitle = 'Accountant'


/*
Today's Topic: Subqueries (in the Select, From, and Where Statement)
A subquery is a query within a query, it use to return data that will be use
in the main query.
*/


select *
from [SQL Tutorial]..EmployeeSalary
--- Subquery in Select

select EmployeeID, Salary, (select Avg(Salary) from [SQL Tutorial]..EmployeeSalary) as AllAvgSalary 
from [SQL Tutorial]..EmployeeSalary


--- How to do it with Partition By
select EmployeeID, Salary, Avg(Salary) over() AllAvgSalary
from [SQL Tutorial]..EmployeeSalary

--- Why Group by doesn't work
select EmployeeID, Salary, Avg(Salary) as AllAvgSalary
from [SQL Tutorial]..EmployeeSalary
Group by EmployeeID, Salary
order by 1,2

--- subquery in From
select a.EmployeeID, AllAvgSalary
from (select EmployeeID, Salary, Avg(Salary) over() AllAvgSalary
	  from [SQL Tutorial]..EmployeeSalary) a


--- Subquery in Where
select EmployeeID, Jobtitle, Salary
from [SQL Tutorial]..EmployeeSalary
where EmployeeID in (
		Select dem.EmployeeID from [SQL Tutorial]..EmployeeDemographics dem
		where age >30)
		 


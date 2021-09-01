--1
SELECT * FROM Employees WHERE EXISTS (SELECT * FROM Incentives)
--2
SELECT * FROM Employees WHERE Salary > (SELECT Salary FROM Employees where FirstName='Roy'); 
SELECT * FROM Employees WHERE Salary < (SELECT Salary FROM Employees where FirstName='Pat'); 
--3
SELECT EmployeeID,JobId, enddate-startdate Days from Job_History INNER JOIN Jobs WHERE Department_Id= 90;


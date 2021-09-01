(1).SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bull');

(2).SELECT FirstName, LastName FROM Employees 
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName='IT');
 
(3).SELECT FirstName, LastName FROM Employees 
WHERE ManagerID in (select EmployeeID  FROM Employees WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE LocationID  IN (select LocationID  from Locations where CountryID='US')));


(4).SELECT FirstName, LastName FROM Employees 
WHERE (EmployeeID  IN (SELECT ManagerID  FROM Employees));

(5).SELECT FirstName, LastName, Salary  FROM Employees 
WHERE Salary  > (SELECT AVG(Salary ) FROM Employees);

(6).SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE Employees.Salary = (SELECT min_salary
FROM Jobs
WHERE Employees.JobId = Jobs.JobId);

(7).SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE DepartmentID IN 
(SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%') 
AND Salary > (SELECT avg(Salary) FROM Employees);

(8).SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE Salary > 
(SELECT Salary FROM Employees WHERE LastName = 'Bell') ORDER BY FirstName;

(9).SELECT * FROM Employees 
WHERE Salary = (SELECT MIN(Salary) FROM Employees);

(10).SELECT * FROM Employees 
WHERE Salary > 
ALL(SELECT avg(Salary)FROM Employees GROUP BY DepartmentID);

(11).SELECT FirstName,LastName, JobId, Salary 
FROM Employees 
WHERE Salary > 
ALL (SELECT Salary FROM Employees WHERE JobId = 'SH_CLERK') ORDER BY Salary;

(12).SELECT b.FirstName,b.LastName 
FROM Employees b 
WHERE NOT EXISTS (SELECT 'X' FROM Employees a WHERE a.ManagerID = b.EmployeeID);

(13).SELECT EmployeeID, FirstName, LastName, 
(SELECT DepartmentName FROM Departments d
 WHERE e.DepartmentID = d.DepartmentID) Department
 FROM Employees e ORDER BY Departments;

(14).SELECT EmployeeID, FirstName 
FROM Employees AS A 
WHERE Salary > 
(SELECT AVG(Salary) FROM Employees WHERE DepartmentID = A.DepartmentID);

(15).SET @i = 0; 
SELECT i, EmployeeID 
FROM (SELECT @i := @i + 1 AS i, EmployeeID FROM Employees)
a WHERE MOD(a.i, 2) = 0;

(16).SELECT DISTINCT Salary 
FROM Employees e1 
WHERE 5 = (SELECT COUNT(DISTINCT Salary) 
FROM Employees  e2 
WHERE e2.Salary >= e1.Salary);

(17).SELECT DISTINCT Salary 
FROM Employees e1 
WHERE 4 = (SELECT COUNT(DISTINCT Salary) 
FROM Employees  e2 
WHERE e2.Salary <= e1.Salary);

(18).SELECT * FROM (
SELECT * FROM Employees ORDER BY EmployeeID DESC LIMIT 10) sub 
ORDER BY EmployeeID ASC;

(19).SELECT * FROM Departments 
WHERE DepartmentID 
NOT IN (select DepartmentID FROM Employees);

(20).SELECT DISTINCT Salary 
FROM Employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT Salary) 
FROM Employees b 
WHERE b.Salary >= a.Salary) 
ORDER BY a.Salary DESC;

(21).SELECT DISTINCT Salary 
FROM Employees a 
WHERE  3 >= (SELECT COUNT(DISTINCT Salary) 
FROM Employees b 
WHERE b.Salary <= a.Salary) 
ORDER BY a.Salary DESC;

(22).SELECT *
FROM Employees emp1
WHERE (1) = (
SELECT COUNT(DISTINCT(emp2.Salary))
FROM Employees emp2
WHERE emp2.Salary > emp1.Salary);
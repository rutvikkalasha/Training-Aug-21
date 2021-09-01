
CREATE VIEW View1 AS
    SELECT FirstName,E.LastName,E.Salary,E.HireDate,I.Incentive_Date,I.Incentive_Amount
    FROM Employees AS E 
    JOIN Incentives AS I
    ON E.EmployeeID = I.EMPLOYEE_REF_ID;


CREATE view View2 AS
    SELECT FirstName,Incentive_Amount 
    FROM Employees AS E 
    JOIN Incentives AS I
    ON E.EmployeeID = I.EMPLOYEE_REF_ID 
    AND I.INCENTIVE_AMOUNT > 3000

CREATE view View3
    AS SELECT DISTINCT(d.DepartmentName),count(e.EmployeeID) AS Employees
    FROM Departments AS d 
    JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
    GROUP BY DepartmentName

CREATE VIEW View4
    AS SELECT DISTINCT(DepartmentName),count(EmployeeID) AS TOTALEMP
    FROM Departments AS d 
    JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
    GROUP BY DepartmentName

CREATE View view5
    AS SELECT DepartmentName, concat(FirstName,LastName) AS NAME ,City
    FROM Departments AS d
    JOIN Employees AS e
    ON d.ManagerID = e.EmployeeID
    JOIN Locations AS l
    ON d.LocationID = l.LocationID

CREATE VIEW view6
    AS SELECT DepartmentName,concat(FirstName,' ',LastName) AS NAME,HireDate ,Salary,DATEDIFF(year,HireDate,getdate()) AS experience
    FROM Employees AS e
    join Departments AS d
    on d.ManagerID = e.EmployeeID AND DATEDIFF(year,e.HireDate,getdate()) > 15
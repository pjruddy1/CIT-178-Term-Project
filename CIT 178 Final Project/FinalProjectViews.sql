/*Final Project Views
USE CrystalMountainEmployees;
GO
CREATE VIEW VI_Limited_EmployeesInfo
AS
SELECT EmployeeNumber, FirstName, LastName, [Address], Birthdate
FROM Employees
WITH CHECK OPTION;
GO

SELECT * FROM VI_Limited_EmployeesInfo;*/

--CREATE VIEW VI_EmployeeNameAttendance
--AS
--SELECT   FirstName, LastName,EmployeeAttendance, EmployeeAttitude
--FROM Employees
--JOIN EmployeeReview ON Employees.ReviewNumber = EmployeeReview.ReviewNumber;
--GO
--SELECT * FROM VI_EmployeeNameAttendance;

--UPDATE VI_EmployeeNameAttendance
--SET EmployeeAttendance = 10
--WHERE LastName = 'Evans';
--GO
--SELECT * FROM VI_EmployeeNameAttendance;

--UPDATE VI_EmployeeNameAttendance
--SET EmployeeAttitude = 10
--WHERE LastName = 'Elliot';
--GO
--SELECT * FROM VI_EmployeeNameAttendance;

--CREATE VIEW VI_EmployeeTaxes
--AS
--SELECT   EmployeeNumber[Employee], FirstName, LastName,YTDIncome, Deductions,Taxes
--FROM Employees
--JOIN EmployeeSalaryInfo ON Employees.PayrollNumber = EmployeeSalaryInfo.PayrollNumber;
--GO
--SELECT * FROM VI_EmployeeTaxes;

--SELECT * FROM sys.views;

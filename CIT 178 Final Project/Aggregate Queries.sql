/*
USE CrystalMountainEmployees;
SELECT AVG(PayRate), MIN(PayRate), MAX(PayRate)
FROM EmployeeSalaryInfo;

USE CrystalMountainEmployees;
SELECT COUNT(Deductions), SUM(Deductions)
FROM EmployeeSalaryInfo
WHERE Deductions > 1;

USE CrystalMountainEmployees;
SELECT SUM(PayRate) AS 'Total Rate Paid Per Hour', COUNT(PayRate) AS 'Number Of Employees',
AVG(PayRate) AS 'Average Total Hourly Rate'
FROM EmployeeSalaryInfo;

USE CrystalMountainEmployees;
SELECT COUNT(PayRate) AS [NumberOfHourlyEmployees], MIN(PayRate) AS 'Lowest Paid Hourly Employee', MAX(PayRate) AS 'Highest Paid Hourly Employee'
FROM EmployeeSalaryInfo
WHERE PayRate <100;*/
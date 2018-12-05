/* Final Project Procedures 

USE CrystalMountainEmployees;
GO
CREATE PROC sp_UpperManagementSearch
AS
SELECT LEFT(FirstName,1) + ', ' + LastName AS [Name],EmployeeNumber, PayRate
FROM Employees JOIN EmployeeSalaryInfo
ON EmployeeSalaryInfo.PayrollNumber = Employees.PayrollNumber 
WHERE PayRate > 15.00
ORDER BY LastName;

EXEC sp_UpperManagementSearch;

CREATE PROC spEmployeeReviewAvg
	@LastName varchar(40) = '%'
AS
BEGIN
	SELECT LastName, FirstName, ((EmployeeAttendance+EmployeeAttitude+KnowledgeofPostion+EmployeeAppearance+GuestRelationships)/5) AS [Avg Review Score]
	FROM EmployeeReview JOIN Employees
	ON Employees.ReviewNumber = EmployeeReview.ReviewNumber
	WHERE LastName LIKE @LastName;
END
GO
EXEC spEmployeeReviewAvg 'Ell%';

USE CrystalMountainEmployees;
CREATE PROC spPayRateTotal
		@DateVar smalldatetime,
		@PayRateTotal money OUTPUT
AS
SELECT @PayRateTotal = SUM(PayRate)
FROM EmployeeSalaryInfo JOIN Employees
ON EmployeeSalaryInfo.PayrollNumber = Employees.PayrollNumber
WHERE HireDate <= @DateVar;
DECLARE @MyTotalRate money
EXEC spPayRateTotal @DateVar = '2016-01-01', @PayRateTotal = @MyTotalRate OUTPUT;
SELECT @MyTotalRate AS [Total Pay]

CREATE PROC spCrystalEmployees 
    @DateVar smalldatetime = NULL,
    @EmployeeVar varchar(40) = '%', 
    @EmployeeName varchar(40) OUTPUT 
AS
IF @DateVar IS NULL 
    SELECT @DateVar = HireDate FROM Employees;

DECLARE @EmployeeCount int;
SELECT @EmployeeCount = COUNT(EmployeeNumber) ,@EmployeeName=LastName 
FROM Employees 
WHERE (HireDate <= @DateVar) AND (LastName LIKE @EmployeeVar)
GROUP BY LastName
RETURN @EmployeeCount;
GO 

DECLARE @LastName varchar(40);
DECLARE @EmployeeCount int;
EXEC @EmployeeCount=spCrystalEmployees '','g%', @LastName OUTPUT
SELECT @LastName AS 'Last Name', @EmployeeCount AS 'Number of Employees'*/


/* Final Project User Defined Functions 

CREATE FUNCTION fnEmployeeNumber
    (@EmployeeLastName varchar(50))
    RETURNS int
BEGIN
    RETURN (SELECT EmployeeNumber FROM Employees WHERE LastName = @EmployeeLastName);
END;
SELECT * FROM Employees
WHERE EmployeeNumber = dbo.fnEmployeeNumber ('Baggins');

USE CrystalMountainEmployees;
CREATE FUNCTION fnTopEmployeeGuestReviews
    (@CutOff int = 0) 
    RETURNS table
    RETURN (SELECT LastName, SUM(GuestRelationships) AS 'Guest Service'  
                FROM EmployeeReview JOIN Employees ON Employees.ReviewNumber = EmployeeReview.ReviewNumber
                WHERE GuestRelationships > 0
                GROUP BY LastName 
                HAVING SUM(GuestRelationships) >= @CutOff);
SELECT * FROM dbo.fnTopEmployeeGuestReviews(9);


CREATE FUNCTION fnTopEmployeeReviews
    (@ReviewCutOff int = 0) 
    RETURNS table
    RETURN (SELECT LastName, SUM(GuestRelationships+EmployeeAppearance+EmployeeAttendance+EmployeeAttitude+KnowledgeOfPostion) AS 'Total Review'  
                FROM EmployeeReview JOIN Employees ON Employees.ReviewNumber = EmployeeReview.ReviewNumber
                WHERE (GuestRelationships+EmployeeAppearance+EmployeeAttendance+EmployeeAttitude+KnowledgeOfPostion) > 0
                GROUP BY LastName 
                HAVING SUM(GuestRelationships+EmployeeAppearance+EmployeeAttendance+EmployeeAttitude+KnowledgeOfPostion) >= @ReviewCutOff);
SELECT * FROM dbo.fnTopEmployeeReviews(35);*/


/* Final Project Triggers 

USE CrystalMountainEmployees;
SELECT EmployeeNumber,LastName,FirstName,HireDate INTO TestEmployees
FROM Employees;

CREATE TABLE EmployeeLogs(
    EmployeeNumber nchar(5),
    status varchar(30)
);

CREATE TRIGGER TestEmployees_INSERT ON TestEmployees
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeNumber nchar(5)
    SELECT @EmployeeNumber =INSERTED.EmployeeNumber
    FROM INSERTED

    INSERT INTO EmployeeLogs
    VALUES(@EmployeeNumber, 'Inserted')
END

INSERT INTO TestEmployees(EmployeeNumber,LastName,FirstName,HireDate) VALUES ('1010','Roger','McKinly',GETDATE());
INSERT INTO TestEmployees(EmployeeNumber,LastName,FirstName,HireDate) VALUES ('2020','Jimmy','Spade',GETDATE());

SELECT * FROM EmployeeLogs;

CREATE TRIGGER TestEmployees_DELETE ON TestEmployees
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeNumber nchar(5)
    SELECT @EmployeeNumber =DELETED.EmployeeNumber
    FROM DELETED

    INSERT INTO EmployeeLogs
    VALUES(@EmployeeNumber, 'Deleted')
END
DELETE FROM TestEmployees WHERE EmployeeNumber='2020';
DELETE FROM TestEmployees WHERE EmployeeNumber='1010';

SELECT * FROM EmployeeLogs;

CREATE TRIGGER TestEmployees_UPDATE ON TestEmployees
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeNumber nchar(5)
		DECLARE @Action varchar(50)
    SELECT @EmployeeNumber = INSERTED.EmployeeNumber
    FROM INSERTED
	 IF UPDATE(EmployeeNumber)
        SET @Action = 'Updated Number'    
    IF UPDATE(LastName)
        SET @Action = 'Updated Last Name'
    IF UPDATE(FirstName)
        SET @Action = 'Updated First Name'
	IF UPDATE(HireDate)
		SET @Action = 'Updated Hire Date'   
    INSERT INTO EmployeeLogs
    VALUES(@EmployeeNumber, @Action)
END
UPDATE TestEmployees SET EmployeeNumber='1010' WHERE EmployeeNumber = '1111';
UPDATE TestEmployees SET LastName='Ruddy' WHERE LastName = 'Elliot';
UPDATE TestEmployees SET HireDate = GETDATE() WHERE EmployeeNumber ='2222';*/

SELECT * FROM EmployeeLogs;
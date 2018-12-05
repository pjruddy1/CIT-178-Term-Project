/*
CREATE DATABASE CrystalMountainEmployees;
GO

USE [CrystalMountainEmployees]
GO

CREATE TABLE [dbo].[Departments](
	[DeptNumber] [nchar](5) NOT NULL PRIMARY KEY,
	[DeptName] [varchar](50) NOT NULL,
);
GO

CREATE TABLE [dbo].[DeptEmployees](
	[EmployeeNumber] [nchar](10) NOT NULL,
	[DeptNumber] [nchar](5) NOT NULL,
	PRIMARY KEY(EmployeeNumber, DeptNumber)
);
GO

CREATE TABLE [dbo].[EmployeePosition](
	[PositionID] [int] Identity PRIMARY KEY,
	[Title/Position] [varchar](50) NOT NULL,
	[DepartmentNumber] [nchar](5) NOT NULL,
);
GO

CREATE TABLE [dbo].[EmployeeReview](
	[ReviewNumber][int] Identity PRIMARY KEY,
	[EmployeeNumber] [nchar](5) NOT NULL,
	[EmployeeAttendance] [int] NULL,
	[EmployeeAttitude] [int] NULL,
	[KnowledgeOfPostion] [int] NULL,
	[EmployeeAppearance] [int] NULL,
	[GuestRelationships] [int] NULL
);

GO
CREATE TABLE [dbo].[Employees](
	[EmployeeNumber] [nchar](10) NOT NULL PRIMARY KEY,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[HireDate] [nvarchar](20) NULL,
	[BirthDate] [nvarchar](20) NULL,
	[SSNumber] [nvarchar](15) NULL,
	[PositionID] [int],
	[PayrollNumber][int],
	[ReviewNumber][int]
);
GO
CREATE TABLE [dbo].[EmployeeSalaryInfo](
	[PayrollNumber] int Identity PRIMARY KEY,
	[PayRate] [money] NOT NULL,
	[PayFrequency] [varchar](25) NOT NULL,
	[Deductions] [money] NOT NULL,
	[Taxes] [nchar](10) NOT NULL,
	[YTDIncome] [nchar](10) NOT NULL
);

USE CrystalMountainEmployees;
GO
ALTER TABLE DeptEmployees
ADD CONSTRAINT FK_DeptNum FOREIGN KEY (DeptNumber) REFERENCES Departments(DeptNumber);

USE CrystalMountainEmployees;
GO
ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_DeptNumber FOREIGN KEY (DepartmentNumber) REFERENCES Departments(DeptNumber);

USE CrystalMountainEmployees;
GO
ALTER TABLE Employees
ADD CONSTRAINT FK_PositionID FOREIGN KEY (PositionID) REFERENCES EmployeePosition(PositionID);

USE CrystalMountainEmployees;
GO
ALTER TABLE Employees
ADD CONSTRAINT FK_PayrollNumber FOREIGN KEY (PayrollNumber) REFERENCES EmployeeSalaryInfo(PayrollNumber);

USE CrystalMountainEmployees;
GO
ALTER TABLE Employees
ADD CONSTRAINT FK_ReviewNumber FOREIGN KEY (ReviewNumber) REFERENCES EmployeeReview(ReviewNumber);*/
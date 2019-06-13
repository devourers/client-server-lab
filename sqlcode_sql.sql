CREATE DATABASE Lab_Db;

USE Lab_Db;

CREATE TABLE [dbo].[equipment]
(
	Id INT NOT NULL PRIMARY KEY,
	eName varchar NOT NULL
)

CREATE TABLE [dbo].[commissions]
(
	Id INT NOT NULL PRIMARY KEY,
	CommissionName varchar(50)

)

CREATE TABLE [dbo].[reagents]
(
	Id INT NOT NULL PRIMARY KEY,
	ReagName varchar(50) NOT NULL,
)

CREATE TABLE [dbo].[personel]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	FirstName varchar(50) NOT NULL,
	SecondName varchar(50) NOT NULL,
	WorkTime varchar(50) NOT NULL
)


CREATE TABLE [dbo].[eq-per-id]
(
	WorkerId INT NOT NULL,
	EquipmentId INT NOT NULL,
	FOREIGN KEY (WorkerId) REFERENCES personel(Id),
	FOREIGN KEY (EquipmentId) REFERENCES equipment(Id)
)


CREATE TABLE [dbo].[tests]
(
	Id INT NOT NULL PRIMARY KEY,
	TestName varchar NOT NULL,
)

CREATE TABLE [dbo].[comm-pers]
(
	CommisionId INT NOT NULL,
	WorkerId INT NOT NULL,
	FOREIGN KEY (CommisionId) REFERENCES commissions(Id),
	FOREIGN KEY (WorkerId) REFERENCES personel(Id)

)

CREATE TABLE [dbo].[orders]
(
	Id INT NOT NULL PRIMARY KEY,
	CompanyName varchar NOT NULL,
	TestId INT NOT NULL,
	FOREIGN KEY (TestId) REFERENCES tests(Id)
)

CREATE TABLE [dbo].[equipment-schedule]
(
	EquipmentId INT NOT NULL,
	IsOccupied varchar NOT NULL,
	WorkerId INT,
	FOREIGN KEY (EquipmentId) REFERENCES equipment(Id),
	FOREIGN KEY (WorkerId) REFERENCES personel(Id),
)

CREATE TABLE [dbo].[Storage]
(
	PlaceId INT NOT NULL PRIMARY KEY,
	ReagentId INT NOT NULL,
	Quantity INT NOT NULL,
	FOREIGN KEY (ReagentId) REFERENCES reagents(Id)
)

CREATE TABLE [dbo].[MAIN]
(
	[Id] INT NOT NULL PRIMARY KEY,
	OrderId INT NOT NULL,
	TestId INT NOT NULL,
	CommissionId INT NOT NULL,
	TestResult varchar(50) NOT NULL,
	FOREIGN KEY (OrderId) REFERENCES orders(Id),
	FOREIGN KEY (CommissionId) REFERENCES commissions(Id),
	FOREIGN KEY (TestId) REFERENCES tests(Id),
)

CREATE TABLE [dbo].[Summary]
(
	[Id] INT NOT NULL PRIMARY KEY,
	OrderId INT NOT NULL,
	IsOrderFullfield varchar(50) NOT NULL,
	DateFullfield date NOT NULL,
	FOREIGN KEY (OrderId) references orders(Id)
)

CREATE TABLE [dbo].[testnorms]
(
	TestId INT NOT NULL,
	TestNorms varchar(50) NOT NULL,
	FOREIGN KEY (TestId) REFERENCES tests(Id)
)

CREATE TABLE [dbo].[reag-tests]
(
 	testId INT NOT NULL,
	reagId INT NOT NULL,
	FOREIGN KEY (testId) REFERENCES tests(Id),
	FOREIGN KEY (reagId) REFERENCES reagents(Id)
)


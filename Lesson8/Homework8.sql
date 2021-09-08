			--Lesson 8

CREATE DATABASE SwimmingCompetition;

USE SwimmingCompetition

CREATE TABLE Location								
(
	LocationID INT IDENTITY NOT NULL,
	LocationName NVARCHAR(50) NOT NULL,
	CityName NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Location_LocationID PRIMARY KEY (LocationID)
);


CREATE TABLE Trainer
(
	TrainerID INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL,			
	Rank NVARCHAR(10),
	CONSTRAINT PK_Trainer_TrainerID PRIMARY KEY (TrainerID),
	CONSTRAINT UQ_Trainer_PassportNumber UNIQUE (PassportNumber)			
);


CREATE TABLE Swimmer
(
	SwimmerID INT IDENTITY NOT NULL,
	TrainerID INT NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL,			
	Birthday DATE,
	Gender NVARCHAR(1) NOT NULL,
	Rank NVARCHAR(10),
	CONSTRAINT PK_Swimmer_SwimmerID PRIMARY KEY (SwimmerID),
	CONSTRAINT FK_Swimmer_TrainerID FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),			
	CONSTRAINT UQ_Swimmer_PassportNumber UNIQUE (PassportNumber)				
);


CREATE TABLE Team
(
	TeamID INT IDENTITY NOT NULL,
	TeamName NVARCHAR(30) NOT NULL,
	Captain NVARCHAR(50) NOT NULL,
	MembersNumber INT NOT NULL,
	Country NVARCHAR(30),
	TeamDate DATE,
	CONSTRAINT PK_Team_TeamID PRIMARY KEY (TeamID)
);


CREATE TABLE Bridge_Swimmer_Team						-- BRIDGE
(
	SwimmerID INT NOT NULL,
	TeamID INT NOT NULL,
	CONSTRAINT FK_Bridge_Swimmer_Team_SwimmerID FOREIGN KEY (SwimmerID) REFERENCES Swimmer(SwimmerID),
	CONSTRAINT FK_Bridge_Swimmer_Team_TeamID FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);


CREATE TABLE Judge							
(
	JudgeID INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL,			
	SwimStile NVARCHAR(30),
	Rank NVARCHAR(20),
	TypesOfOfficial NVARCHAR(30),
	CONSTRAINT PK_Judge_JudgeID PRIMARY KEY (JudgeID),
	CONSTRAINT UQ_Judge_PassportNumber UNIQUE (PassportNumber)			
);


CREATE TABLE Competition 
(
	CompetitionID INT IDENTITY NOT NULL,
	SwimmerID INT NOT NULL,
	LocationID INT NOT NULL,
	Date DATETIME NOT NULL,
	ResultTime TIME NOT NULL,
	CONSTRAINT PK_Competition_CompetitionID PRIMARY KEY (CompetitionID),
	CONSTRAINT FK_Competition_SwimmerID FOREIGN KEY (SwimmerID) REFERENCES Swimmer(SwimmerID),			
	CONSTRAINT FK_Competition_LocationID FOREIGN KEY (LocationID) REFERENCES Location(LocationID)			
);


CREATE TABLE Bridge_Judge_Competition					-- BRIDGE
(
	JudgeID INT NOT NULL,
	CompetitionID INT NOT NULL,
	CONSTRAINT FK_Bridge_Judge_Competition_JudgeID FOREIGN KEY (JudgeID) REFERENCES Judge(JudgeID),
	CONSTRAINT FK_Bridge_Judge_Competition_CompetitionID FOREIGN KEY (CompetitionID) REFERENCES Competition(CompetitionID)
);
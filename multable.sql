CREATE DATABASE Academy
USE Academy

GO
CREATE TABLE Curators
(
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    [Name] NVARCHAR(MAX) NOT NULL CHECK(LEN([Name]) > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK(LEN([Surname]) > 0)
)
GO
CREATE TABLE Subjects
(
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    [Name] NVARCHAR(100) NOT NULL CHECK(LEN([Name]) > 0) UNIQUE ([Name])
)
GO
CREATE TABLE Teachers
(
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    [Name] NVARCHAR(MAX) NOT NULL CHECK(LEN([Name]) > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK(LEN([Surname]) > 0),
    Salary MONEY NOT NULL CHECK(Salary > 0 and Salary != 0)
)
GO
CREATE TABLE Faculties
(
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Financing MONEY NOT NULL DEFAULT(0) CHECK(Financing >= 0),
    [Name] NVARCHAR(100) NOT NULL CHECK(LEN([Name]) > 0) UNIQUE ([Name]),
)
GO
CREATE TABLE Departments
(
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Financing MONEY NOT NULL DEFAULT(0) CHECK(Financing >= 0),
    [Name] NVARCHAR(100) NOT NULL CHECK(LEN([Name]) > 0) UNIQUE ([Name]),
    FacultyId INT NOT NULL FOREIGN KEY REFERENCES Faculties(Id)
)
GO
CREATE TABLE Groups
(
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    [Name] NVARCHAR(10) NOT NULL CHECK(LEN([Name]) > 0) UNIQUE ([Name]),
    [Year] INT NOT NULL CHECK([Year] >= 1 AND [Year] <= 5),
    DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Departments(Id)
)
GO
CREATE TABLE GroupsCurators
(
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    CuratorId INT NOT NULL FOREIGN KEY REFERENCES Curators(Id),
    GroupId INT NOT NULL FOREIGN KEY REFERENCES Groups(Id)
)
GO
CREATE TABLE Lectures
(
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    LectureRoom NVARCHAR(MAX) NOT NULL CHECK(LEN(LectureRoom) > 0),
    SubjectId INT NOT NULL FOREIGN KEY REFERENCES Subjects(Id),
    TeacherId INT NOT NULL FOREIGN KEY REFERENCES Teachers(Id)
)
GO
CREATE TABLE GroupsLectures
(    
    Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    GroupId INT NOT NULL FOREIGN KEY REFERENCES Groups(Id),
    LectureId INT NOT NULL FOREIGN KEY REFERENCES Lectures(Id)
)


-- CURATORS
INSERT INTO Curators ([Name], Surname) VALUES ('Red', 'Younge');
INSERT INTO Curators ([Name], Surname) VALUES ('Aharon', 'Stopher');
INSERT INTO Curators ([Name], Surname) VALUES ('Tripp', 'Fordy');
INSERT INTO Curators ([Name], Surname) VALUES ('Ario', 'Guiden');
INSERT INTO Curators ([Name], Surname) VALUES ('Berny', 'Syer');
INSERT INTO Curators ([Name], Surname) VALUES ('Fair', 'Suarez');
INSERT INTO Curators ([Name], Surname) VALUES ('Adeline', 'Coverly');
INSERT INTO Curators ([Name], Surname) VALUES ('Heidi', 'Scotcher');
INSERT INTO Curators ([Name], Surname) VALUES ('Bendick', 'Mabe');
INSERT INTO Curators ([Name], Surname) VALUES ('Stella', 'Gaines');

-- SUBJECTS
INSERT INTO Subjects ([Name]) VALUES ('Programming');
INSERT INTO Subjects ([Name]) VALUES ('Algorithm');
INSERT INTO Subjects ([Name]) VALUES ('Cybernetics');
INSERT INTO Subjects ([Name]) VALUES ('Physics');
INSERT INTO Subjects ([Name]) VALUES ('Chemistry');
INSERT INTO Subjects ([Name]) VALUES ('Database Theory');
INSERT INTO Subjects ([Name]) VALUES ('Mechanical Engineering');
INSERT INTO Subjects ([Name]) VALUES ('Architecture');

-- TEACHERS
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Arv', 'Hillburn', 2426);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Ive', 'Baseley', 2075);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Rafaello', 'Brownjohn', 1775);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Ashia', 'Tevlin', 812);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Esmaria', 'Harte', 1390);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Karney', 'Ollis', 1630);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Angelia', 'Rudloff', 1605);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Agna', 'Radeliffe', 1222);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Bethina', 'Jehan', 1737);
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Chance', 'Laxtonne', 1159);


-- LECTURES
INSERT INTO Lectures(LectureRoom, SubjectId, TeacherId) VALUES ('L1111',1,1);
INSERT INTO Lectures(LectureRoom, SubjectId, TeacherId) VALUES ('L2222',1,2);
INSERT INTO Lectures(LectureRoom, SubjectId, TeacherId) VALUES ('L3333',2,3);
INSERT INTO Lectures(LectureRoom, SubjectId, TeacherId) VALUES ('L4444',2,4);
INSERT INTO Lectures(LectureRoom, SubjectId, TeacherId) VALUES ('L5555',3,5);
INSERT INTO Lectures(LectureRoom, SubjectId, TeacherId) VALUES ('L6666',3,6);
INSERT INTO Lectures(LectureRoom, SubjectId, TeacherId) VALUES ('L7777',4,7);
INSERT INTO Lectures(LectureRoom, SubjectId, TeacherId) VALUES ('L8888',4,7);
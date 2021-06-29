--CREATE DATABASE s103581210
--USE s103581210
--Student(StudentID,Surname,GivenName,Gender) PRIMARY KEY(StudentID)
--Teacher(StaffID, Surname, GivenName) PRIMARY KEY(StudentID)
--Subject(SubjCode, Description) PRIMARY KEY (SubjCode)
--SubjectOffering(Year,Semester,Fee,SubjCode,StaffID) COMPOSITE KEY (Year, Semester,SubjCode,StaffID)
--Enrollment(DateEnrolled, Grade,StudentID, Year,Semester,SubjCode,StaffID) COMPOSITE KEY (StudentID, Year,Semester,SubjCode,StaffID)
IF OBJECT_ID('Enrollment') IS NOT NULL
DROP TABLE Enrollment;

IF OBJECT_ID('SubjectOffering') IS NOT NULL
DROP TABLE SubjectOffering; 

IF OBJECT_ID('SUBJ') IS NOT NULL
DROP TABLE SUBJ; 

IF OBJECT_ID('STUDENT') IS NOT NULL
DROP TABLE STUDENT; 

IF OBJECT_ID('TEACHER') IS NOT NULL
DROP TABLE TEACHER; 





CREATE TABLE SUBJ
(
SubjCode NVARCHAR(100) PRIMARY KEY,
Description NVARCHAR(500)
)

CREATE TABLE STUDENT
(
    StudentID NVARCHAR(10) PRIMARY KEY,
    Surname NVARCHAR(100) NOT NULL,
    GivenName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(1) CHECK (Gender IN ('M','F','I',NULL)) 
)
CREATE TABLE TEACHER(
    StaffID INT PRIMARY KEY CHECK (LEN(StaffID) >= 8),
    Surname NVARCHAR(100) NOT NULL,
    GivenName NVARCHAR(100) NOT NULL
)
CREATE TABLE SubjectOffering
(
Year INT CHECK (Len(Year) >= 4), 
Semester INT Check(Semester = ('1''2')),
Fee MONEY CHECK (Fee > 0) NOT NULL,
SubjCode NVARCHAR(100),
StaffID INT,
CONSTRAINT CK_SubjectOffering_ PRIMARY KEY (Year, Semester, SubjCode),
CONSTRAINT FK_SubjCode_ FOREIGN KEY(SubjCode) REFERENCES SUBJ(SubjCode),
CONSTRAINT FK_StaffID_ FOREIGN KEY(StaffID) REFERENCES TEACHER(StaffID)

)

CREATE TABLE Enrollment
(   StudentID NVARCHAR(10),
    Year INT CHECK (Len(Year) >= 4),
    Semester INT Check(Semester = ('1''2')),
    SubjCode NVARCHAR(100),
    Grade NVARCHAR(2) CHECK (Grade IN ('N','P','C','D','HD')),
    DateEnrolled DATE,
    CONSTRAINT PK_Enrollment_ PRIMARY KEY (StudentID, Year, Semester,SubjCode, Grade, DateEnrolled),
    CONSTRAINT FK_StudentID_ FOREIGN KEY(StudentID) REFERENCES STUDENT(StudentID),
    CONSTRAINT FK_SubjectOffering_ FOREIGN KEY(Year,Semester,SubjCode) REFERENCES SubjectOffering(Year,Semester,SubjCode)
)

INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s12233445',2019,1,'ICTPRG418','D',2/25/2019)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s23344556',2019,1,'ICTPRG418','P',2/15/2019)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s12233445',2020,1,'ICTPRG418','C',1/30/2020)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s23344556',2020,1,'ICTPRG418','HD',2/26/2020)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s34455667',2020,1,'ICTPRG418','P',1/28/2020)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s12233445',2020,1,'ICTBSB430','C',2/8/2020)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s23344556',2020,2,'ICTBSB430',NULL,6/30/2020)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s34455667',2020,2,'ICTBSB430',NULL,7/3/2020)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s23344556',2019,2,'ICTDBS205','P',7/1/2019)
INSERT INTO Enrollment(StudentID,Year,Semester,SubjCode,Grade,DateEnrolled) VALUES('s34455667',2019,2,'ICTDBS205','N',7/13/2019)

INSERT INTO Student(StudentID,Surname,GivenName,Gender) VALUES('s12233445','Baird','Tim','M')
INSERT INTO Student(StudentID,Surname,GivenName,Gender) VALUES('s23344556','Nguyen','Anh','M')
INSERT INTO Student(StudentID,Surname,GivenName,Gender) VALUES('s34455667','Hallinan','James','M')

INSERT INTO Teacher(StaffID,Surname,GivenName) VALUES('98776655','Young','Angus')
INSERT INTO Teacher(StaffID,Surname,GivenName) VALUES('87665544','Scott','Bon')
INSERT INTO Teacher(StaffID,Surname,GivenName) VALUES('76554433','Slade','Chris')

INSERT INTO SUBJ(SubjCode,Description) VALUES('ICTPRG418','Apply SQL to extract & manipulate data')
INSERT INTO SUBJ(SubjCode,Description) VALUES('ICTBSB430','Create Basic Databases')
Insert INTO SUBJ(SubjCode,Description) VALUES('ICTDBS205','Design a Database')

Insert INTO SubjectOffering(SubjCode,Year,Semester,Fee,StaffID) VALUES('ICTPRG418',2019,1,200,98776655)
Insert INTO SubjectOffering(SubjCode,Year,Semester,Fee,StaffID) VALUES('ICTPRG418',2020,1,225,98776655)
Insert INTO SubjectOffering(SubjCode,Year,Semester,Fee,StaffID) VALUES('ICTBSB430',2020,1,200,87665544)
Insert INTO SubjectOffering(SubjCode,Year,Semester,Fee,StaffID) VALUES('ICTBSB430',2020,2,200,76554433)
Insert INTO SubjectOffering(SubjCode,Year,Semester,Fee,StaffID) VALUES('ICTDBS205',2019,2,225,87665544)

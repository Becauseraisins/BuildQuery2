--CREATE DATABASE s103581210
--Student(StudentID,Surname,GivenName,Gender) PRIMARY KEY(StudentID)
--Teacher(StaffID, Surname, GivenName) PRIMARY KEY(StudentID)
--Subject(SubjCode, Description) PRIMARY KEY (SubjCode)
--SubjectOffering(Year,Semester,Fee,SubjCode,StaffID) COMPOSITE KEY (Year, Semester,SubjCode,StaffID)
--Enrollment(DateEnrolled, Grade,StudentID, Year,Semester,SubjCode,StaffID) COMPOSITE KEY (StudentID, Year,Semester,SubjCode,StaffID)


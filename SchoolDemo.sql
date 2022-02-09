USE School;

CREATE TABLE Classes (
	Class_ID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Class_Name VARCHAR(60) NOT NULL
);

CREATE TABLE Instructors (
	Instructor_ID INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Instructor_Name VARCHAR(50) NOT NULL,
	);


CREATE TABLE Students (
	Student_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Student_Name VARCHAR(50) NOT NULL,
	Class_ID INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES Classes(Class_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Instructor_ID INT NOT NULL CONSTRAINT fk_instructor_id FOREIGN KEY REFERENCES Instructors(Instructor_ID) ON UPDATE CASCADE ON DELETE CASCADE
	);


INSERT INTO Classes 
(Class_Name)
VALUES ('Software Developer Boot Camp'), ('C# Boot Camp')
;

INSERT INTO Students 
(Student_Name, Class_ID, Instructor_ID)
VALUES ('Kelly', 100, 1000), ('Tom', 101, 1001), ('Ben', 100, 1000), ('Taylor', 101, 1001), ('Hannah', 100, 1000);

INSERT INTO Instructors 
(Instructor_Name)
VALUES ('Mr. Hayes'), ('Ms. Palmer');

SELECT * FROM Instructors;
SELECT * FROM Students ORDER BY ASC;

SELECT ins.Instructor_Name, cls.Class_Name, Students.Class_ID, Students.Instructor_ID, Students.Student_name 
FROM 
Students, Classes, Instructors

INNER JOIN Classes AS cls ON cls.Class_ID = Students.Class_ID
INNER JOIN Instructors AS ins ON ins.Instructor_ID = Students.Instructor_ID

;
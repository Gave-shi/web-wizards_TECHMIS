CREATE TABLE Lecture(
LecId VARCHAR(4) NOT NULL,
LecName VARCHAR(100),
LecEmail VARCHAR(50),
LecContact VARCHAR(15) ,
LecPosition VARCHAR(60),
PRIMARY KEY (LecId)
);


CREATE TABLE Course(
CouId VARCHAR (10) NOT NULL,
CouName VARCHAR (50),
CouCredit INT,
Course_time INT,
CourType VARCHAR (30),
PRIMARY KEY(CouId));
/*--CrediT INT,--*/


INSERT INTO Lecture
VALUES
('L001','Prof. P.K.S.C Jayasinghe','subash@ictec.ruh.ac.lk','0711234567','Senior Lecturer'),
('LOO2','Mr. P.H.P.N Laksiri','phpnlaksiri@ictec.ruh.ac.lk','0711234567','Lecturer'),
('L003','Ms. Rumeshika W. arachi','rumeshika@ictec.ruh.ac.lk','0711234567','Lecturer(Probationary)'),
('L004','Ms. Malsha Prabuddhi','malsha@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L005','Ms. Chanduni Gamage','chanduni@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L006','Ms. E.H.M.P.M. Wijerathna','piyumi@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L007','Ms. R.D.N. Shakya','shakya@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L008','Ms. Akila Brahmana','akila@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L009','Mr. A.W.A.T. Dilhan','dilhan@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L010','Mr. Shashitha Lakal','shashithal@ictec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L011','Dr. Thissa Karunarathna','thissa@btec.ruh.ac.lk','0711234567','Senior Lecturer'),
('L012','Professor E.P.S. Chandana','epschandana@btec.ruh.ac.lk','0775909665','Deputy Vice Chancellor,University of Ruhuna'),
('L013','Dr. K.M.W Rajawaththa','wathsala@btec.ruh.ac.lk','0711234567','Senior Lecturer'),
('L014','Dr. Niranjan Kannangara','niranjan@btec.ruh.ac.lk','0711234567','Lecturer (Unconfirmed)'),
('L015','Dr. K.G.S.Harshadewa Gunawardana','harshadewa@etec.ruh.ac.lk','0711234567','Senior Lecturer'),
('L016','Ms.B.H.C. Sanjeewani Thilakarathna','sanjeewani@fot.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L017','Eng. Ms. J.W. Achini','achini@etec.ruh.ac.lk','0711234567','Lecturer (Probationary)'),
('L018','Eng Mr. H.V.H.H.Senavirathna','Eng Mr. H.V.H.H.Senavirathna','0711234567','Lecturer (Probationary)');


INSERT INTO Course
VALUES
('ICT1212','Database Management Systems',2,15,'Theory'),
('ICT1222','Database Management Systems Practicum',2,15,'Practical'),
('ICT1233','Server-Side Web Development',3,30,'Both'),
('ICT1242','Computer Architecture',2,15,'Theory'),
('ICT1253','Computer Networks',3,30,'Both'),
('TMS1223','Discrete Mathematics',3,15,'Theory'),
('ENG1222','English II',2,15,'Theory'),
('TCS1212','Fundamentals of Management',2,15,'Theory');




CREATE TABLE Student_Eligibility (
    student_id VARCHAR(10) NOT NULL,
    course_id CHAR(7) NOT NULL,
    ca_marks DECIMAL(5, 2) NOT NULL, 
    attendance_percentage DECIMAL(5, 2) NOT NULL,
    eligibility_status VARCHAR(20)
    
);


CREATE TABLE Student_Eligibility (
    student_id VARCHAR(10) NOT NULL,
    course_id CHAR(7) NOT NULL,
    ca_marks DECIMAL(5, 2) NOT NULL, 
    attendance_percentage DECIMAL(5, 2) NOT NULL, 
    eligibility_status VARCHAR(10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (course_id) REFERENCES COURSE(CouId)
);




--Eligibility TO English_ICT1222_marks EM-------
INSERT INTO Student_Eligibility (student_id, course_id, ca_marks, attendance_percentage, eligibility_status)
SELECT 
    EM.student_id,
    'ENG1222' AS course_id, 
    (EM.Finl_CA_marks * 100) / 40 AS ca_marks, 
    SA.Percentage AS attendance_percentage,
    CASE 
        WHEN SA.Percentage >= 80 AND (EM.Finl_CA_marks * 100) / 40 >= 50 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status 
FROM 
    English_ENG1222_marks AS EM
JOIN 
    Student_Attandance SA ON EM.student_id = SA.Stu_reg_num
ON DUPLICATE KEY UPDATE
    ca_marks = VALUES(ca_marks),
    attendance_percentage = VALUES(attendance_percentage),
    eligibility_status = VALUES(eligibility_status);
-- Ensure this matches the correct field in the Attendance Table





--Eligibility TO Management_ICT1212_marks MM---------------------
INSERT INTO Student_Eligibility (student_id, course_id, ca_marks, attendance_percentage, eligibility_status)
SELECT 
    MM.student_id,
    'TCS1212' AS course_id,
    (MM.Final_CA_marks * 100) / 40 AS ca_marks,
    SA.Percentage AS attendance_percentage,
    CASE 
        WHEN SA.Percentage >= 80 AND (MM.Final_CA_marks * 100) / 40 >= 50 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status 
FROM 
    Management_TCS1212_marks AS MM
JOIN 
    Student_Attandance SA ON MM.student_id = SA.Stu_reg_num
ON DUPLICATE KEY UPDATE
    ca_marks = VALUES(ca_marks),
    attendance_percentage = VALUES(attendance_percentage),
    eligibility_status = VALUES(eligibility_status);






    
-- Eligibility TO  DBMS_Theory_ICT1212_marks-------------------
INSERT INTO Student_Eligibility (student_id, course_id, ca_marks, attendance_percentage, eligibility_status)
SELECT 
    DBT.student_id,
    'ICT1212' AS course_id,
    (DBT.Finl_CA_marks * 100) / 30 AS ca_marks,  -- Use Finl_CA_marks here
    SA.Percentage AS attendance_percentage,
    CASE 
        WHEN SA.Percentage >= 80 AND (DBT.Finl_CA_marks * 100) / 30 >= 50 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status 
FROM 
    DBMS_Theory_ICT1212_marks AS DBT
JOIN 
    Student_Attendance SA ON DBT.student_id = SA.Stu_reg_num
ON DUPLICATE KEY UPDATE
    ca_marks = VALUES(ca_marks),
    attendance_percentage = VALUES(attendance_percentage),
    eligibility_status = VALUES(eligibility_status);






-- Eligibility TO  DBMS_Practical_ICT1222_marks----------------
INSERT INTO Student_Eligibility (student_id, course_id, ca_marks, attendance_percentage, eligibility_status)
SELECT 
    DBP.student_id,
    'ICT1222' AS course_id,
    (DBP.Finl_CA_marks * 100) / 30 AS ca_marks,
    SA.Percentage AS attendance_percentage,
    CASE 
        WHEN SA.Percentage >= 80 AND (DBP.Finl_CA_marks * 100) / 30 >= 50 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status 
FROM 
    DBMS_Practical_ICT1222_marks AS DBP
JOIN 
    Student_Attandance SA ON DBP.student_id = SA.Stu_reg_num
ON DUPLICATE KEY UPDATE
    ca_marks = VALUES(ca_marks),
    attendance_percentage = VALUES(attendance_percentage),
    eligibility_status = VALUES(eligibility_status);







-- Eligibility TO  Serverside_ICT1233_marks----
INSERT INTO Student_Eligibility (student_id, course_id, ca_marks, attendance_percentage, eligibility_status)
SELECT
    SS.student_id,
    'ICT1233' AS course_id,
    (SS.Finl_CA_marks * 100) / 40 AS ca_marks,  
    SA.Percentage AS attendance_percentage,
    CASE
        WHEN SA.Percentage >= 80 AND (SS.Finl_CA_marks * 100) / 40 >= 50 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status
FROM
    Serverside_ICT1233_marks AS SS
JOIN
    Student_Attandance SA ON SS.student_id = SA.Stu_reg_num
ON DUPLICATE KEY UPDATE
    ca_marks = VALUES(ca_marks),
    attendance_percentage = VALUES(attendance_percentage),
    eligibility_status = VALUES(eligibility_status);








-- Eligibility TO  computer_Archi_ICT1242_marks-----------
INSERT INTO Student_Eligibility (student_id, course_id, ca_marks, attendance_percentage, eligibility_status)
SELECT 
    CAM.student_id,
    'ICT1242' AS course_id,
    (CAM.Finl_CA_marks * 100) / 40 AS ca_marks,
    SA.Percentage AS attendance_percentage,
    CASE 
        WHEN SA.Percentage >= 80 AND (CAM.Finl_CA_marks * 100) / 40 >= 50 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status 
FROM 
    computer_Archi_ICT1242_marks AS CAM
JOIN 
    Student_Attandance SA ON CAM.student_id = SA.Stu_reg_num
ON DUPLICATE KEY UPDATE
    ca_marks = VALUES(ca_marks),
    attendance_percentage = VALUES(attendance_percentage),
    eligibility_status = VALUES(eligibility_status);







-- Eligibility TO  CompNetwork_ICT1233_marks----
INSERT INTO Student_Eligibility (student_id, course_id, ca_marks, attendance_percentage, eligibility_status)
SELECT 
    CNM.student_id,
    'ICT1253' AS course_id,
    (CNM.Finl_CA_marks * 100) / 30 AS ca_marks,
    SA.Percentage AS attendance_percentage,
    CASE 
        WHEN SA.Percentage >= 80 AND (CNM.Finl_CA_marks * 100) / 30 >= 50 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status 
FROM 
    CompNetwork_ICT1253_marks AS CNM
JOIN 
    Student_Attandance SA ON CNM.student_id = SA.Stu_reg_num
ON DUPLICATE KEY UPDATE
    ca_marks = VALUES(ca_marks),
    attendance_percentage = VALUES(attendance_percentage),
    eligibility_status = VALUES(eligibility_status);





-- Eligibility TO  Discrete_maths_ICT1233_marks----------
INSERT INTO Student_Eligibility (student_id, course_id, ca_marks, attendance_percentage, eligibility_status)
SELECT 
    DM.student_id,
    'TMS1223' AS course_id,
    (DM.Finl_CA_marks * 100) / 40 AS ca_marks,
    SA.Percentage AS attendance_percentage,
    CASE 
        WHEN SA.Percentage >= 80 AND (DM.Finl_CA_marks * 100) / 40 >= 50 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status 
FROM 
    Discrete_maths_TMS1223_marks AS DM
JOIN 
    Student_Attandance AS SA ON DM.student_id = SA.Stu_reg_num
ON DUPLICATE KEY UPDATE
    ca_marks = VALUES(ca_marks),
    attendance_percentage = VALUES(attendance_percentage),
    eligibility_status = VALUES(eligibility_status);









------------------------ check eligibility  as individuals ----------------------------------
SELECT 
    student_id,
    course_id,
    eligibility_status
FROM 
    Student_Eligibility
WHERE 
    student_id='TG/2022/1310';

------------------------- check eligibility for the whole batch-------------------------------
SELECT 
    student_id,
    course_id,
    eligibility_status
FROM 
    Student_Eligibility
WHERE 
    SUBSTRING(student_id, 4, 4) = '2022';


 -- Filtering for batch 2022



-----------------------------------Student_Performance (GPA) TABLE -------------------------------------


CREATE TABLE Student_Performance (
    student_id VARCHAR(12) NOT NULL,
    semester_no INT,
    Full_SGPA DECIMAL(3,2),
    CGPA DECIMAL(3,2),
    GPA DECIMAL(3,2),
    PRIMARY KEY (student_id, semester_no)
);



---------------------------Data insert to  Student_Performance (GPA) TABLE -----------
/*

INSERT INTO Student_Performance (student_id, semester_no,Full_SGPA,CGPA,GPA)
SELECT 
    sg.student_id,
    1 AS semester_no,
    (SUM(c.CouCredit * CASE 
        WHEN sg.Final_marks >= 90 THEN 4.00
        WHEN sg.Final_marks >= 85 THEN 3.70
        WHEN sg.Final_marks >= 80 THEN 3.30
        WHEN sg.Final_marks >= 75 THEN 3.00
        WHEN sg.Final_marks >= 70 THEN 2.70
        WHEN sg.Final_marks >= 65 THEN 2.30
        WHEN sg.Final_marks >= 60 THEN 2.00
        WHEN sg.Final_marks >= 55 THEN 1.70
        WHEN sg.Final_marks >= 50 THEN 1.30
        WHEN sg.Final_marks >= 45 THEN 1.00
        ELSE 0.00
    END) / NULLIF(SUM(c.CouCredit), 0)) AS Full_SGPA,
    NULL AS CGPA,
    NULL AS GPA 
FROM 
    Student_grade sg
JOIN 
    Course c ON sg.Course_id = c.CouId
GROUP BY 
    sg.student_id;*/


INSERT INTO Student_Performance (student_id, semester_no, Full_SGPA, CGPA, GPA)
SELECT
    sg.student_id,
    1 AS semester_no,
    (SUM(c.CouCredit * CASE
        WHEN sg.Final_marks >= 90 THEN 4.00
        WHEN sg.Final_marks >= 85 THEN 3.70
        WHEN sg.Final_marks >= 80 THEN 3.30
        WHEN sg.Final_marks >= 75 THEN 3.00
        WHEN sg.Final_marks >= 70 THEN 2.70
        WHEN sg.Final_marks >= 65 THEN 2.30
        WHEN sg.Final_marks >= 60 THEN 2.00
        WHEN sg.Final_marks >= 55 THEN 1.70
        WHEN sg.Final_marks >= 50 THEN 1.30
        WHEN sg.Final_marks >= 45 THEN 1.00
        ELSE 0.00
    END) / NULLIF(SUM(c.CouCredit), 0)) AS Full_SGPA,
    NULL AS CGPA,
    NULL AS GPA
FROM
    Student_grade sg
JOIN
    Course c ON sg.Course_id = c.CouId
GROUP BY
    sg.student_id;

  

-----------CGPA for each student (current semester)----
/*UPDATE Student_Performance sp
SET CGPA = (
    SELECT 
        AVG(Full_SGPA)
    FROM 
        Student_Performance sp,Student_grade sg
    WHERE 
        sg.student_id = sp.student_id 
);
*/



-- Update CGPA for each student (current semester)
/*UPDATE Student_Performance sp
SET CGPA = (
    SELECT 
        AVG(sp2.Full_SGPA)  -- Use SGPA from the same table with alias sp2
    FROM 
        Student_Performance sp2  -- Alias for the same table
    WHERE 
        sp2.student_id = sp.student_id AND sp2.semester_no <= sp.semester_no
);
*/
====================CORRECT ================================
UPDATE Student_Performance sp
JOIN (
    SELECT
        student_id,
        AVG(Full_SGPA) AS Avg_CGPA
    FROM
        Student_Performance
    GROUP BY
        student_id
) AS avg_cgpa ON sp.student_id = avg_cgpa.student_id
SET sp.CGPA = avg_cgpa.Avg_CGPA;




-----------  GPA for each student------------------

/*
UPDATE Student_Performance sp
SET GPA = (
    SELECT 
        AVG(Full_SGPA)
    FROM 
        Student_Performance sg
    WHERE 
        sg.student_id = sp.student_id
);
*/

/*
-- Update GPA for each student
UPDATE Student_Performance sp
SET GPA = (
    SELECT 
        AVG(sp2.SGPA)  -- Use SGPA from the same table with alias sp2
    FROM 
        Student_Performance sp2  -- Alias for the same table
    WHERE 
        sp2.student_id = sp.student_id
);*/
====================CORRECT ================================
UPDATE Student_Performance sp
JOIN (
    SELECT 
        student_id,
        AVG(Full_SGPA) AS avg_full_sgpa
    FROM 
        Student_Performance
    GROUP BY 
        student_id
) AS avg_sp ON sp.student_id = avg_sp.student_id
SET sp.GPA = avg_sp.avg_full_sgpa;












----------------------------------Procedure to get performances for a Single Student------------------------

====================================================================
DELIMITER //

CREATE PROCEDURE GetStudentPerformance(IN studentID VARCHAR(12), OUT sgpa DECIMAL(5,2))
BEGIN
    SELECT
        sp.student_id,
        sg.Course_id,
        sp.semester_no,
        sp.Full_SGPA,
        sp.CGPA,
        sg.grade
    FROM 
        Student_grade sg
    JOIN
        Student_Performance sp ON sp.student_id = sg.student_id
    WHERE
        sp.student_id = studentID;

    
    SELECT Full_SGPA INTO sgpa FROM Student_Performance WHERE student_id = studentID;
END //

DELIMITER ;
=========================================================================

-- Optionally set the sgpa output variable if you want to return the SGPA for the student



-------------------------------------Procedure to performance of All Students in a Batch----------------
DELIMITER //
CREATE PROCEDURE GetBatchPerformance(IN batch_year INT)
BEGIN
    SELECT
        sp.student_id,
        sg.Course_id,
        sp.semester_no,
        sp.Full_SGPA,
        sp.CGPA,
        sg.grade
    FROM
         Student_grade sg,Student_Performance sp
    WHERE
        sp.student_id=sg.student_id;
       SUBSTRING(sp.student_id, 4, 4)=batch_year;
END//
DELIMITER;
---------------------------drop------------------------------
 DROP PROCEDURE IF EXISTS GetStudentPerformance;
-----------------------------------------------------------

DELIMITER //
CREATE PROCEDURE GetBatchPerformance(IN batch_year INT)
BEGIN
    SELECT
        sp.student_id,
        sg.Course_id,
        sp.semester_no,
        sp.Full_SGPA,
        sp.CGPA,
        sg.grade
    FROM
        Student_grade sg, Student_Performance sp
    WHERE
        sp.student_id = sg.student_id AND
        SUBSTRING(sp.student_id, 4, 4) = batch_year;
END//
DELIMITER ;


------------------------------------Calling the Procedures----------------------------------------
---------------------------------------------------------------------------------------------------


----------To get the performance for a specific student----------------

=============================================================
-- Declare a variable to hold the SGPA output
SET @sgpa_output = 0;

-- Call the procedure with the student ID and the output variable
CALL GetStudentPerformance('TG/2022/1410', @sgpa_output);

-- Optionally, to see the output SGPA value
SELECT @sgpa_output AS SGPA;
=================================================================

CALL GetStudentPerformance('TG/2022/1410');

--To get the performance for all students --------------------

CALL GetBatchPerformance(2022);




CREATE TABLE Student_Attandance(Course_Id CHAR(7) NOT NULL,
    Stu_reg_num VARCHAR(12) NOT NULL,
    Week_01 VARCHAR(20) NOT NULL,
    Week_02 VARCHAR(20) NOT NULL,
    Week_03 VARCHAR(20) NOT NULL,
    Week_04 VARCHAR(20) NOT NULL,
    Week_05 VARCHAR(20) NOT NULL,
    Week_06 VARCHAR(20) NOT NULL,
    Week_07 VARCHAR(20) NOT NULL,
    Week_08 VARCHAR(20) NOT NULL,
    Week_09 VARCHAR(20) NOT NULL,
    Week_10 VARCHAR(20)NOT NULL,
    Week_11 VARCHAR(20)NOT NULL,
    Week_12 VARCHAR(20)NOT NULL,
    Week_13 VARCHAR(20)NOT NULL,
    Week_14 VARCHAR(20)NOT NULL,
    Week_15 VARCHAR(20)NOT NULL,
    Percentage DECIMAL(5,2) GENERATED ALWAYS AS (
        (
            (CASE WHEN Week_01 = 'AB' THEN 0 WHEN Week_01= 'MC' THEN 1 ELSE CAST(Week_01 AS SIGNED) END +
            CASE WHEN Week_02 = 'AB' THEN 0 WHEN Week_02 = 'MC' THEN 1 ELSE CAST(Week_02 AS SIGNED) END +
            CASE WHEN Week_03 = 'AB' THEN 0 WHEN Week_03 = 'MC' THEN 1 ELSE CAST(Week_03 AS SIGNED) END +
            CASE WHEN Week_04 = 'AB' THEN 0 WHEN Week_04 = 'MC' THEN 1 ELSE CAST(Week_04 AS SIGNED) END +
            CASE WHEN Week_05 = 'AB' THEN 0 WHEN Week_05 = 'MC' THEN 1 ELSE CAST(Week_05 AS SIGNED) END +
            CASE WHEN Week_06 = 'AB' THEN 0 WHEN Week_06 = 'MC' THEN 1 ELSE CAST(Week_06 AS SIGNED) END +
            CASE WHEN Week_07 = 'AB' THEN 0 WHEN Week_07 = 'MC' THEN 1 ELSE CAST(Week_07 AS SIGNED) END +
            CASE WHEN Week_08 = 'AB' THEN 0 WHEN Week_08 = 'MC' THEN 1 ELSE CAST(Week_08 AS SIGNED) END +
            CASE WHEN Week_09 = 'AB' THEN 0 WHEN Week_09 = 'MC' THEN 1 ELSE CAST(Week_09 AS SIGNED) END +
            CASE WHEN Week_10 = 'AB' THEN 0 WHEN Week_10 = 'MC' THEN 1 ELSE CAST(Week_10 AS SIGNED) END +
            CASE WHEN Week_11 = 'AB' THEN 0 WHEN Week_11 = 'MC' THEN 1 ELSE CAST(Week_11 AS SIGNED) END +
            CASE WHEN Week_12 = 'AB' THEN 0 WHEN Week_12 = 'MC' THEN 1 ELSE CAST(Week_12 AS SIGNED) END +
            CASE WHEN Week_13 = 'AB' THEN 0 WHEN Week_13 = 'MC' THEN 1 ELSE CAST(Week_13 AS SIGNED) END +
            CASE WHEN Week_14 = 'AB' THEN 0 WHEN Week_14 = 'MC' THEN 1 ELSE CAST(Week_14 AS SIGNED) END +
            CASE WHEN Week_15 = 'AB' THEN 0 WHEN Week_15 = 'MC' THEN 1 ELSE CAST(Week_15 AS SIGNED) END
            ) / 15 * 100
        )
    ) STORED);







INSERT INTO student_attandance
VALUES
('TG/2021/1025', 'ICT1233', '1', '1', '0', '1', '0', '1', '1', '0', '1', '1', '1', '0', '1', '1', '1'),
('TG/2022/1583', 'TCS1212', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

('TG/2022/1310', 'TCS1212', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG/2022/1310', 'ENG1222', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', 'MC', '1', 'AB', '1', '1', '1'),
('TG/2022/1310', 'ICT1212', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),

('TG/2022/1310', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');



('TG1310', 'TCS1212', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1310', 'ENG1222', '1', '1', '1', 'AB', '1', '1', '1', '1', '1', 'MC', '1', 'AB', '1', '1', '1'),
('TG1310', 'ICT1212', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('TG1310', 'ICT1222', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),



CREATE TABLE Student_grade (
    student_id VARCHAR(12) NOT NULL,
    Course_id CHAR(7) NOT NULL,
    Final_marks DECIMAL(5,2) NOT NULL,
    grade VARCHAR(5),
    SGPA DECIMAL(3,2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (Course_id) REFERENCES Course(CouId),
    PRIMARY KEY (student_id, Course_id)
);




--Questão 1.
SELECT instructors.ID, 
       instructors.name, 
       COUNT(sections.section_ID) AS number_of_sections
FROM instructors
LEFT OUTER JOIN sections 
ON instructors.ID = sections.instructor_ID
GROUP BY instructors.ID, instructors.name;
-- Questão 2. 
SELECT instructors.ID, 
       instructors.name, 
       (SELECT COUNT(*) 
        FROM sections 
        WHERE sections.instructor_ID = instructors.ID) AS number_of_sections
FROM instructors;
--Questão 3
SELECT sections.section_ID, 
       sections.course_name, 
       sections.semester, 
       CASE 
           WHEN instructors.name IS NULL THEN '-' 
           ELSE instructors.name 
       END AS instructor_name
FROM sections
LEFT OUTER JOIN instructors 
ON sections.section_ID = instructors.section_ID
WHERE sections.semester = 'Spring' AND sections.year = 2010;
--Questão 4
SELECT students.id, 
       courses.title, 
       courses.dept_name, 
       students.name, 
       courses.credits, 
       takes.student_ID, 
       (courses.credits * grade_points.points) AS total_points
FROM takes
JOIN sections 
ON takes.section_ID = sections.section_ID
JOIN courses 
ON sections.course_ID = courses.course_ID
JOIN grade_points 
ON takes.grade = grade_points.grade
JOIN students
ON takes.student_ID = students.id;

-- Questão 5
CREATE VIEW coeficiente_rendimento AS
SELECT students.id, 
       courses.title, 
       courses.dept_name, 
       students.name, 
       courses.credits, 
       takes.student_ID, 
       (courses.credits * grade_points.points) AS total_points
FROM takes
JOIN sections 
ON takes.section_ID = sections.section_ID
JOIN courses 
ON sections.course_ID = courses.course_ID
JOIN grade_points 
ON takes.grade = grade_points.grade
JOIN students
ON takes.student_ID = students.id;


-- TASK 4
use StudentManagement;
-- querry 1. Average Grade by Gender
-- compare male vs female average grade across all courses.

select Gender,
round(avg((MathScore + ScienceScore + EnglishScore) / 3), 2) as AverageGrade
from Students
group by Gender;

-- querry-2 Pass rate per course

select c.name as course,
sum(case when e.grade >= 40 then 1 else 0 end) * 100.0 / COUNT(*) as pass_rate
from enrollments e
join courses c
on e.course_id = c.id
group by c.name;

-- querry 3. Top Three Students Overall

select s.name , round(avg(e.grade),2) as avg_grade
from enrollments e
join students s on e.student_id = s.StudentID
group by s.StudentID,s.name
order by avg_grade desc
limit 3;

-- querry 4. Students in Multiple Courses

select s.name,count(e.course_id) as course_enrolled
from enrollments e
join students s on e.student_id = s.StudentID
group by s.StudentID,s.name
having count(e.course_id)>2;
select students.student_id,
       students.student_name,
       subjects.subject_name,
       count(examinations.subject_name) as attended_exams
from students
         join
     subjects
         left join
     examinations
     on
         examinations.student_id = students.student_id
             and
         examinations.subject_name = subjects.subject_name
group by students.student_id,
         subjects.subject_name
order by students.student_id,
         subjects.subject_name;
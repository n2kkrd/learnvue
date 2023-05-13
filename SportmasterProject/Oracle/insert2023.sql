-- Студенты
-- truncate table ks_students;
insert into ks_students(last_name, first_name, second_name)
values('Анастасиади', 'Алексей', 'Иванович');
insert into ks_students(last_name, first_name, second_name)
values('Бандуровский', 'Павел', 'Леонидович');
insert into ks_students(last_name, first_name, second_name)
values('Веприкова', 'Екатерина', 'Павловна');
insert into ks_students(last_name, first_name, second_name)
values('Геворгян', 'Влад', 'Арманович');
insert into ks_students(last_name, first_name, second_name)
values('Дакукин', 'Иван', 'Евгениевич');
insert into ks_students(last_name, first_name, second_name)
values('Демьяненко', 'Никита', 'Павлович');
insert into ks_students(last_name, first_name, second_name)
values('Затонская', 'Мария', 'Анатольевна');
insert into ks_students(last_name, first_name, second_name)
values('Коваленко', 'Савва', 'Андреевич');
insert into ks_students(last_name, first_name, second_name)
values('Мазыев', 'Артём', 'Владимирович');
insert into ks_students(last_name, first_name, second_name)
values('Митяев', 'Илья', 'Алексеевич');
insert into ks_students(last_name, first_name, second_name)
values('Нестеренко', 'Олег', 'Александрович');
insert into ks_students(last_name, first_name, second_name)
values('Портнов', 'Дмитрий', 'Дмитриевич');
insert into ks_students(last_name, first_name, second_name)
values('Слесаренко', 'Анастасия', 'Максимовна');
insert into ks_students(last_name, first_name, second_name)
values('Тормина', 'Елена', 'Михайловна');
insert into ks_students(last_name, first_name, second_name)
values('Черная', 'Юлия', 'Олеговна');
insert into ks_students(last_name, first_name, second_name)
values('Анищенко', 'Екатерина', 'Сергеевна');
insert into ks_students(last_name, first_name, second_name)
values('Баева', 'Диана', 'Николаевна');
insert into ks_students(last_name, first_name, second_name)
values('Герасимова', 'Валерия', 'Андреевна');
insert into ks_students(last_name, first_name, second_name)
values('Горбань', 'Михаил', 'Андреевич');
insert into ks_students(last_name, first_name, second_name)
values('Косматов', 'Андрей', 'Александрович');
insert into ks_students(last_name, first_name, second_name)
values('Курбатский', 'Владимир', 'Александрович');
insert into ks_students(last_name, first_name, second_name)
values('Кусочкова', 'Елена', 'Борисовна');
insert into ks_students(last_name, first_name, second_name)
values('Лысенко', 'Максим', 'Андреевич');
insert into ks_students(last_name, first_name, second_name)
values('Назаров', 'Георгий', 'Григорьевич');
insert into ks_students(last_name, first_name, second_name)
values('Панков', 'Анатолий', 'Анатольевич');
insert into ks_students(last_name, first_name, second_name)
values('Постнов', 'Никита', 'Евгеньевич');
insert into ks_students(last_name, first_name, second_name)
values('Савчук', 'Тарас', '');
insert into ks_students(last_name, first_name, second_name)
values('Стасюк', 'Кристина', 'Вячеславовна');
insert into ks_students(last_name, first_name, second_name)
values('Чутчев', 'Сергей', 'Сергеевич');
insert into ks_students(last_name, first_name, second_name)
values('Щетков', 'Александр', 'Романович');
insert into ks_students(last_name, first_name, second_name)
values('Рупасов', 'Глеб', 'Александрович');


-- Курсы
-- truncate table ks_courses
insert into ks_courses(name, date_start, date_end)
values('Oracle + Vue', to_date('01.12.2022','DD.MM.YYYY'), to_date('01.06.2023','DD.MM.YYYY'));

-- Связь студентов и курса
-- truncate table ks_link_student_course;
insert into ks_link_student_course(student_code, course_code, date_start, date_end)
select 
    a1.code, 
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    null
from 
    ks_students a1,
    ks_courses a2;
    
-- Текущие оценки успеваемости
-- truncate table ks_grades_list;
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    9
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Анастасиади';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    6
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Бандуровский';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    7
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Веприкова';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    24
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Геворгян';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    22
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Дакукин';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    14
from    
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Демьяненко';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    14
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Затонская';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    22
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Коваленко';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    16
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Мазыев';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    18
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Митяев';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    9
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Нестеренко';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    19
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Портнов';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    21
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Слесаренко';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    7
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Тормина';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    22
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Черная';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    24
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Анищенко';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    24
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Баева';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
   15
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Герасимова';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    16
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Горбань';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    9
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Косматов';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    6
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Курбатский';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    15
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Кусочкова';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    18
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Лысенко';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    11
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Назаров';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    6
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Панков';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    24
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Постнов';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    23
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Савчук';
insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    24
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Стасюк';
    insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    3
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Чутчев';
    insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    22
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Щетков';
    insert into ks_grades_list(student_code, course_code, grade_date, grade)
select
    a1.code,
    a2.code,
    to_date('01.12.2022','DD.MM.YYYY'),
    24
from
    ks_students a1,
    ks_courses  a2
where
    a1.last_name = 'Рупасов';

-- create database education_db;
-- use education_db;
-- create table course(course_id int auto_increment primary key,
-- course_name varchar(25) not null unique,
-- duration int not null,fee int not null); 

-- create table student( student_id int auto_increment primary key,
-- 	student_name varchar(25) not null,
--     email varchar (25) unique,
--     age int,
--     courseid int,
--     foreign key (courseid) references course(course_id));
    

-- drop table student;

-- create table student( student_id int auto_increment primary key,
-- 	student_name varchar(25) not null,
--     email varchar (25) unique,
--     age int,
--     gender enum("male","female"),
--     mark int,
--     courseid int,
--     foreign key (courseid) references course(course_id));

-- insert into course (course_name, duration, fee)
-- values
-- ('Python Full Stack', 6, 45000),
-- ('Java Full Stack', 8, 55000),
-- ('Data Science', 6, 60000),
-- ('Web Development', 4, 35000),
-- ('Cyber Security', 6, 65000),
-- ('Cloud Computing', 5, 50000);

-- insert into  student
-- (student_name, email, age, gender, mark, courseid)
-- values
-- ('Arjun', 'arjun@gmail.com', 21, 'male', 85, 1),
-- ('Rahul', 'rahul@gmail.com', 23, 'male', 76, 1),

-- ('Anjali', 'anjali@gmail.com', 20, 'female', 95, 2),
-- ('Meera', 'meera@gmail.com', 22, 'female', 88, 2),
-- ('Akhil', 'akhil@gmail.com', 24, 'male', 72, 2),

-- ('Neha', 'neha@gmail.com', 19, 'female', 91, 3),
-- ('Vishnu', 'vishnu@gmail.com', 25, 'male', 68, 3),
-- ('Sneha', 'sneha@gmail.com', 21, 'female', 83, 3),

-- ('Adithya', 'adithya@gmail.com', 18, 'male', 79, 4),
-- ('Amal', 'amal@gmail.com', 26, 'male', 87, 4),
-- ('Devika', 'devika@gmail.com', 24, 'female', 95, 5);

-- 1. Write a query to display all students who scored more than *80 marks, ordered by mark in descending order.

-- select * from student where mark>80 order by mark desc;

-- # 2. Write a query to find the highest mark, lowest mark, and average mark of all students.

-- select max(mark)as highest_mark,min(mark) as lowest_mark,
-- avg(mark) as average_mark from student;

-- # 3. Write a query to display the top 5 students based on their marks.

-- select * from student order by mark desc limit 5;

-- # 4. Write a query to display the names and marks of students whose age is between 18 and 25, ordered by age.

-- select student_name,mark from student where age between 18 and 25 order by age;

-- # 5. Write a query to find the number of students in each course.

-- select course_name,count(student_id)as student_count from course left join student on course.course_id=student.courseid group by course.course_id,course.course_name;


-- # 6. Write a query to display the courses that have more than 2 students.

--  select c.course_name,count(s.student_id) as student_count from course c left join student s on c.course_id=s.courseid group by c.course_id,c.course_name having count(s.student_id)>2;
 
-- # 7. Write a query to display the student name, mark, and course name using an `INNER JOIN`.
-- select s.student_name,s.mark,c.course_name from student s inner join course c on s.courseid=c.course_id;

-- # 8. Write a query to display all courses and their students, including courses that have no students, using a `LEFT JOIN`.

-- select c.course_name,s.student_name from course c left join student s on c.course_id=s.courseid;

-- # 9. Write a query to display students whose marks are greater than the overall average mark using a subquery.

-- select * from student where mark >(select avg(mark)from student);


-- # 10. Write a query to find the second-highest mark and display the student name, mark, and course name using a subquery and `JOIN`.

-- select s.student_name,s.mark,c.course_name 
-- from student s left join course c on s.courseid=c.course_id 
-- where s.mark=(select max(mark) from student where mark<(
-- select max(mark) 
-- from student));
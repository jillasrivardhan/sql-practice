create database exam;

use exam;

-- Question - 1 

create table emp(
id int primary key,
emp_name varchar(100),
manager_id int,
dept_id int,
salary float,
hire_date date,
email varchar(100)
);

create table employeebonus(
bonus_id int primary key,
emp_id int ,
bonus_amount float default 0,
bonus_date date,
foreign key (emp_id) references emp(id)
);

-- Question-2

insert into emp
(id, emp_name, manager_id, dept_id, salary, hire_date, email)
values
(101, 'Ravi', NULL, 10, 90000, '2020-01-15', 'ravi@company.com'),
(102, 'Priya', 101, 10, 75000, '2021-03-10', 'priya@company.com'),
(103, 'Arun', 101, 10, 75000, '2022-06-20', 'arun@company.com'),
(104, 'Sneha', 102, 20, 60000, '2019-11-05', 'sneha@company.com'),
(105, 'Kiran', 102, 20, 45000, '2023-02-18', 'kiran@company.com'),
(106, 'Divya', 101, 30, 80000, '2018-07-12', 'divya@company.com'),
(107, 'Manoj', 106, 30, 55000, '2022-01-25', 'manoj@company.com'),
(108, 'Anu', 106, 40, 50000, '2024-04-01', 'anu@company.com'),
(109, 'Rahul', 108, 40, 50000, '2024-04-01', 'rahul@company.com'),
(110, 'Pooja', 102, 10, 95000, '2017-09-30', 'pooja@company.com');


CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO Departments (dept_id, dept_name, location)
VALUES
(10, 'IT', 'Hyderabad'),
(20, 'HR', 'Bengaluru'),
(30, 'Finance', 'Chennai'),
(40, 'Sales', 'Hyderabad'),
(50, 'Research', 'Pune');

select emp.salary * 1.15 as new_sal from emp
inner join departments as d
where emp.salary < 60000 and d.dept_name = 'hr' or 
d.dept_name = 'it';

-- Question - 3

CREATE TABLE EmployeeProjects (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    assigned_date DATE
);

INSERT INTO EmployeeProjects
    (emp_id, project_id, hours_worked, assigned_date)
VALUES
    (101, 201, 120, '2024-01-05'),
    (102, 201, 180, '2024-01-10'),
    (103, 201, 150, '2024-02-01'),
    (104, 202, 200, '2024-03-05'),
    (105, 202, 90,  '2024-03-10'),
    (106, 203, 160, '2023-07-10'),
    (107, 203, 140, '2023-08-01'),
    (108, 204, 210, '2024-02-05'),
    (109, 204, 210, '2024-02-05'),
    (110, 201, 100, '2024-04-01');
 
set sql_safe_upadates=0;

delete from emp
WHERE id not in (
    select emp_id
    from employeeprojects
);

-- question-4

select * from emp inner join departments
on emp.dept_id = departments.dept_id
where emp.salary > 50000 and emp.salary < 90000
and departments.location = 'hyderabad' or
departments.location = 'chennai' and 
emp.emp_name not like 'A%';

-- question -5 

alter table emp modify column email varchar(150);

desc emp;

-- question - 6

alter table emp
add constraint fk foreign key (dept_id) references
departments(dept_id);

select d.dept_name , count(e.id) , min(e.salary),
max(e.salary) , avg(e.salary) from emp as e
inner join departments as d on
e.dept_id = d.dept_id
group by d.dept_name;

-- question -7 

select d.dept_name , count(e.id) , avg(e.salary) from emp as e
inner join departments as d on
e.dept_id = d.dept_id
group by d.dept_name
having count(e.id) >= 2 and avg(e.salary) > 60000;

-- question -8
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    budget INT,
    start_date DATE,
    end_date DATE
);

INSERT INTO Projects
    (project_id, project_name, dept_id, budget, start_date, end_date)
VALUES
    (201, 'Banking App', 10, 500000, '2024-01-01', '2024-12-31'),
    (202, 'Payroll System', 20, 200000, '2024-03-01', '2024-09-30'),
    (203, 'Audit Platform', 30, 350000, '2023-07-01', '2024-06-30'),
    (204, 'CRM Portal', 40, 450000, '2024-02-01', '2025-01-31'),
    (205, 'Research AI', 50, 700000, '2024-05-01', '2025-05-31');

alter table employeeprojects
add constraint fk_1 foreign key (project_id) 
references projects(project_id);

SELECT
    d.dept_name,
    SUM(ep.hours_worked) AS total_hours
FROM Departments AS d
INNER JOIN Emp AS e
    ON d.dept_id = e.dept_id
INNER JOIN EmployeeProjects AS ep
    ON e.id = ep.emp_id
GROUP BY d.dept_id, d.dept_name
ORDER BY total_hours DESC
LIMIT 3;

-- question -9

with cte as(
select avg(e.salary),d.dept_name from emp as e
inner join departments as d
on e.dept_id = d.dept_id
group by d.dept_name
)
select * from cte;




/*Drop tables if already exists*/
Drop table employees;
Drop table department;
Drop table titles;
Drop table dept_emp;
Drop table salaries;
Drop table dept_manager;

-- Create titles table
create table titles (
	title_id VARCHAR(30) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);
select * from titles
-- Create employees table
drop table employees
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date varchar (30),
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(30),
	foreign key (emp_title_id) references titles (title_id)
);
select * from employees


-- Create Salaries table
CREATE TABLE Salaries (
    emp_no integer NOT NULL,
    salary  integer NOT NULL,
   PRIMARY KEY (emp_no),
   FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);
select * from Salaries

-- Create department table
CREATE TABLE department(
	dept_no varchar (30) NOT NULL,
	dept_name varchar (50) NOT NULL,
	PRIMARY KEY (dept_no)
);

select * from department

-- Create dept_manager table			 
CREATE TABLE dept_manager (
	dept_no varchar (30) NOT NULL,
	emp_no integer NOT NULL,

    PRIMARY KEY (emp_no),
    FOREIGN KEY(dept_no) REFERENCES department(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

select * from dept_manager
-- Create  dept_emp table
CREATE TABLE dept_emp(
	emp_no integer NOT NULL,
	dept_no varchar (30) NOT NULL,
	

    PRIMARY KEY (emp_no,dept_no),
    FOREIGN KEY(dept_no) REFERENCES department(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);
select * from dept_emp
/* 1.List the employee number, last name, first name, sex, and salary of each employee*/

select  e.emp_no as Employee_Number, 
		e.last_name as LastName,
		e.first_name as FirstName,
		e.sex as Sex,
		sal.salary as Salary
from employees as e
	inner join Salaries as sal
		on e.emp_no = sal.emp_no



/*2.List the first name, last name, and hire date for the employees who were hired in 1986*/
select *from 
(
 select e.first_name as FirstName,
		e.last_name as LastName,
		right(e.hire_date,4)  as H_DATE

 from Employees as e
)TEMPTABLE
where H_DATE ='1986'


/*3.List the manager of each department along with their department number, department name, employee number, last name, and first name.*/

select dm.dept_no as  Department_number,
	   d.dept_name as Department_name,
	   dm.emp_no as EmployeeNumber,
	   e.last_name as LastName,
	   e.first_name as FirstName	   
from dept_manager as dm
	inner join employees as e
		on e.emp_no = dm.emp_no
	inner join department as d	
		on d.dept_no = dm.dept_no
		
/*4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.*/
select 
	   de.dept_no as  Department_number,
	   de.emp_no as EmployeeNumber,
	   e.last_name as Lastname,
	   e.first_name as FirstName,
	   d.dept_name as DepartmentName
from employees as e
	inner join dept_emp as de
		on e.emp_no = de.emp_no
	inner join department as d	
		on d.dept_no = de.dept_no
		
/*5.List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.*/	
select  
        e.first_name as FirstName,
		e.last_name as LastName,
		e.sex as Sex
		
from employees as e
	where e.first_name = 'Hercules'
	and e.last_name like 'B%'

/*6.List each employee in the Sales department, including their employee number, last name, and first name*/	

select  e.emp_no as emp_number,
		e.last_name as LastName,
        e.first_name as FirstName,
		d.dept_name
from dept_emp as de
	inner join employees as e
		on e.emp_no = de.emp_no
	inner join department as d
		on de.dept_no = d.dept_no
		
	where d.dept_name = 'Sales'
	
/*7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.*/	
select  e.emp_no as emp_number,
		e.last_name as LastName,
        e.first_name as FirstName,
		d.dept_name
from dept_emp as de
	inner join employees as e
		on e.emp_no = de.emp_no
	inner join department as d
		on de.dept_no = d.dept_no
where  d.dept_name = 'Sales' or d.dept_name ='Development'

/*8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)*/

select  count(*) CNT,
		e.last_name as LastName
from employees as e

group by last_name
order by count(*)desc 

"Gischer"
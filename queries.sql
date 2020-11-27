-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select employee.emp_no as " Employee Number",
       employee.last_name as "Last Name",
       employee.first_name as "First Name",
       employee.sex as "Sex" ,
       salaries.salary as "Salary"
from employee, salaries
where employee.emp_no = salaries.emp_no
order by employee.last_name ASC;
	
-- List first name, last name, and hire date for employees who were hired in 1986.

select A.* , to_date(a.hire_date,'MM/DD/YYYY') from employee  A
where date_part('year',to_date(A.hire_date,'MM/DD/YYYY')) = 1986
order by to_date ASC;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select department.dept_no as " Department Number",
       department.dept_name as "Department Name",
       department_mgr.emp_no as "Manager's Employee Number",
       employee.last_name as "Last Name",
       employee.first_name as "First Name"  
from  department,department_mgr, employee
where department.dept_no = department_mgr.dept_no  and  department_mgr.emp_no = employee.emp_no
order by employee.last_name ASC;
	

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select department_emp.emp_no as "Employee Number",
       employee.last_name as "Last Name",
       employee.first_name as "First Name",
       department.dept_name as "Department Name"
from  department,department_emp, employee
where department.dept_no = department_emp.dept_no  and  department_emp.emp_no = employee.emp_no 
order by employee.last_name ASC;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name as "First Name",
	   last_name as "Last Name",   
	   sex as "Sex"    
from employee
where first_name = 'Hercules' and LEFT(last_name,1) = 'B';
		
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- To check department name	
-- select * from department;

select department_emp.emp_no as "Employee Number",
       employee.last_name as "Last Name",
       employee.first_name as "First Name",
       department.dept_name as "Department Name"
from  department,department_emp, employee
where department.dept_no = department_emp.dept_no  and  department_emp.emp_no = employee.emp_no and department.dept_name = 'Sales'	
order by employee.last_name ASC;
	

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- To check department name	
-- select * from department;
	
select department_emp.emp_no as "Employee Number",
       employee.last_name as "Last Name",
       employee.first_name as "First Name",
       department.dept_name as "Department Name"
from  department,department_emp, employee
where department.dept_no = department_emp.dept_no  and  department_emp.emp_no = employee.emp_no and department.dept_name IN ('Sales','Development')
order by employee.last_name ASC;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
	

SELECT last_name,
COUNT(last_name)
from employee
GROUP BY last_name
ORDER BY last_name DESC;

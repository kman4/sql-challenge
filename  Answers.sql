CREATE TABLE "department" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(100)   NOT NULL
);

CREATE TABLE "department_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL
);

CREATE TABLE "department_mgr" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "employee" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR(5)   NOT NULL,
    "birth_date" VARCHAR(50)   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "sex" VARCHAR(2)   NOT NULL,
    "hire_date" VARCHAR(50) NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(25)   NOT NULL
	
ALTER TABLE "department_emp" ADD CONSTRAINT "fk_department_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "department_mgr" ADD CONSTRAINT "fk_department_mgr_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "department_mgr" ADD CONSTRAINT "fk_department_mgr_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

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

select 
       department_emp.emp_no as "Employee Number",
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

select 
       department_emp.emp_no as "Employee Number",
	   employee.last_name as "Last Name",
       employee.first_name as "First Name",
	   department.dept_name as "Department Name"
from  department,department_emp, employee
where department.dept_no = department_emp.dept_no  and  department_emp.emp_no = employee.emp_no and department.dept_name = 'Sales'	

order by employee.last_name ASC;
	

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- To check department name	
-- select * from department;
	
select 
       department_emp.emp_no as "Employee Number",
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
ORDER BY last_name;

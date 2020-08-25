-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees emp JOIN salaries sal ON emp.emp_no = sal.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp.first_name, e.mplast_name, emp.hire_date
FROM employees emp
WHERE emp.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY emp.hire_date ASC;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_manager dm JOIN employees emp ON dm.emp_no = emp.emp_no
	JOIN departments d ON d.dept_no = dm.dept_no
ORDER BY dm.dept_no ASC;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, d.dept_name
FROM dept_emp de JOIN employees emp ON de.emp_no = emp.emp_no
	JOIN departments d ON d.dept_no = de.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees emp
WHERE emp.first_name = 'Hercules'
AND emp.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de JOIN employees e ON de.emp_no = e.emp_no
	JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, d.dept_name
FROM dept_emp de JOIN employees emp ON de.emp_no = emp.emp_no
	JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT emp.last_name, COUNT(emp.last_name)
FROM employees emp
GROUP BY emp.last_name;
--1 List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT E.emp_no, E.last_name, E.first_name, E.gender, S.salary
FROM employees AS E
INNER JOIN salaries  AS S ON 
E.emp_no = S.emp_no;


--2. List employees who were hired in 1986.

SELECT first_name, hire_date
FROM employees
WHERE CAST(hire_date AS VARCHAR) LIKE '1986%';


--3.List the manager of each department with the following information: department number,
--  department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT DM.dept_no, D.dept_name, DM.emp_no, E.last_name, E.First_name, DM.from_date, DM.to_date
FROM dept_manager AS DM
INNER JOIN departments AS D
ON DM.dept_no = D.dept_no
INNER JOIN employees AS E
ON DM.emp_no = E.emp_no;


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM employees AS E
INNER JOIN dept_emp AS DE
ON E.emp_no = DE.emp_no
INNER JOIN departments AS D
ON D.dept_no = DE.dept_no
ORDER BY E.emp_no;


--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'AND last_name LIKE 'B%';


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT E.emp_no, E.first_name, E.last_name, D.dept_name
FROM employees AS E
INNER JOIN dept_emp AS DE
ON E.emp_no = DE.emp_no
INNER JOIN departments AS D
ON D.dept_no = DE.dept_no
WHERE D.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT E.emp_no, E.first_name, E.last_name, D.dept_name
FROM employees AS E
INNER JOIN dept_emp AS DE
ON E.emp_no = DE.emp_no
INNER JOIN departments AS D
ON D.dept_no = DE.dept_no
WHERE D.dept_name = 'Sales' OR D.dept_name = 'Development'
ORDER BY E.emp_no;


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT count(last_name), last_name
FROM employees
GROUP BY last_name 
ORDER BY count DESC;
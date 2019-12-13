
--Create the tables to import the data from CVS files

--Departments Table

CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(30)
	
);


--Dept_emp Table

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);


--Dept_manager Table

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);


--Employees Table

CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	gender VARCHAR,
	hire_date DATE NOT NULL
	
);


--Salaries Table

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);


--Titles Table

CREATE TABLE titles(
	emp_no INTEGER NOT NULL,
	title VARCHAR(30)NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL	
);



--Create Primary Keys for the tables using "Alter table"
--Salaries table

ALTER TABLE salaries
ADD COLUMN id_salaries SERIAL PRIMARY KEY;

--Dept_manager table

ALTER TABLE dept_manager
ADD COLUMN id_dep_manager SERIAL PRIMARY KEY;

-- Titles table

ALTER TABLE titles
ADD COLUMN id_titles SERIAL PRIMARY KEY;

--Dept_emp table

ALTER TABLE dept_emp
ADD COLUMN id_dept_emp SERIAL PRIMARY KEY;


--Employees table using "emp_no" as Primary Key

ALTER TABLE employees
ADD PRIMARY KEY (emp_no) ;

--Departments table using "dept_no" as Primary Key

ALTER TABLE departments
ADD PRIMARY KEY (dept_no)




--ADD Foreign Key to the tables

--Salary table

ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

--Dept_emp table

ALTER TABLE dept_emp
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

--Dept_manager table

ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

--Titles table

ALTER TABLE titles
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

--Dept_emp table

ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments (dept_no);



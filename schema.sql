-- Create tables
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR
);	

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no SERIAL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE employees (
	emp_no SERIAL,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
	emp_no SERIAL,
	salary INT,
	PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

-- Create Foreign Keys
ALTER TABLE dept_emp
	ADD FOREIGN KEY (dept_no)
	REFERENCES departments(dept_no)
    MATCH SIMPLE
;

ALTER TABLE dept_emp
	ADD FOREIGN KEY (emp_no)
	REFERENCES employees(emp_no)
    MATCH SIMPLE
;

ALTER TABLE dept_manager
	ADD FOREIGN KEY (dept_no)
	REFERENCES departments(dept_no)
    MATCH SIMPLE
;

ALTER TABLE employees
	ADD FOREIGN KEY (emp_title_id)
	REFERENCES titles(title_id)
    MATCH SIMPLE
 ;
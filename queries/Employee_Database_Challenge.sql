--Retreive emp_no, first_name, last_name columns from Employees
SELECT emp_no, first_name, last_name 
INTO retirement_info
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Retreieve title, from_date, to_date from Title and join to retirement_title
SELECT retirement_info.emp_no, retirement_info.first_name, retirement_info.last_name, titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM titles
LEFT JOIN retirement_info
ON retirement_info.emp_no = titles.emp_no
ORDER BY retirement_info.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, Last_name, title
INTO unique_titles
FROM retirement_titles
WHERE retirement_titles.to_date = ('9999-01-01')
ORDER BY emp_no, retirement_titles.to_date;

--Retreive number of titles from unique table and create retiring table
SELECT COUNT(title) count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

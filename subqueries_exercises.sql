USE brice;

# Find all the employees with the same hire date as employee 101010 using a subquery.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS Employee
FROM employees AS e
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );

# Find all the titles held by all employees with the first name Aamod.
SELECT title, COUNT(emp_no)
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
    )
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

# Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE gender = 'F'
AND emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > CURDATE()
);

# Find all the department names that currently have female managers.
SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F'
        )
    AND to_date > CURDATE()
    );

# Find the first and last name of the employee with the highest salary.
# Using SUB-QUERIE
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE salary = (SELECT MAX(salary) FROM salaries)
    )
LIMIT 1;

# Using JOIN
SELECT first_name, last_name
FROM employees AS e
JOIN salaries s on e.emp_no = s.emp_no
ORDER BY s.salary DESC
LIMIT 1;
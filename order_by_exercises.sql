USE brice;

SELECT *
FROM employees
WHERE (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')  AND gender = 'M'
ORDER BY last_name desc, first_name desc;

SELECT *
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no desc;
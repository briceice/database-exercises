USE brice;

SELECT DISTINCT title
FROM titles;

SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY last_name, first_name;

SELECT COUNT(last_name), last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT COUNT(*), gender
FROM employees
WHERE first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
GROUP BY gender;
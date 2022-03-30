USE brice;

SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

SELECT *
FROM employees
WHERE MONTH(birth_date) = '12'
    AND DAY(birth_date) = '25';

SELECT datediff(curdate(),hire_date)
FROM employees
WHERE MONTH(birth_date) = '12'
    AND DAY(birth_date) = '25'
    AND YEAR(hire_date) BETWEEN 1990 AND 1999
ORDER BY YEAR(birth_date), YEAR(hire_date) DESC;
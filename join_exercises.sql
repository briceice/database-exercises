USE brice;

SELECT d.dept_name AS Department_Name,
    CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e ON dm.emp_no = e.emp_no
WHERE YEAR(dm.to_date) = 9999
AND e.gender = 'F';

SELECT t.title, count(t.emp_no) AS Total
FROM titles AS t
JOIN dept_emp AS de ON t.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
AND YEAR(t.to_date) = 9999
AND YEAR(de.to_date) = 9999
GROUP BY title
ORDER BY Total DESC;

SELECT d.dept_name AS Department_Name,
       CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager,
       s.salary AS Salary
FROM departments AS d
    JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
    JOIN employees AS e ON dm.emp_no = e.emp_no
    JOIN salaries AS s ON dm.emp_no = s.emp_no
WHERE YEAR(dm.to_date) = 9999
    AND YEAR(s.to_date) = 9999;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS Employee,
       d.dept_name AS Department,
       CONCAT(m.first_name, ' ', m.last_name) AS Manaager
FROM current_dept_emp AS cde
    JOIN employees AS e ON cde.emp_no = e.emp_no
    JOIN departments AS d ON cde.dept_no = d.dept_no
    JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
    JOIN employees AS m ON dm.emp_no = m.emp_no
WHERE YEAR(cde.to_date) = 9999
  AND YEAR(dm.to_date) = 9999;

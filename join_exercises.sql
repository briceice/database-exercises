USE brice;

SELECT d.dept_name AS Department_Name,
    CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM departments as d
JOIN dept_manager as dm ON d.dept_no = dm.dept_no
JOIN employees e on dm.emp_no = e.emp_no
WHERE YEAR(dm.to_date) = 9999
AND e.gender = 'F';

SELECT t.title, count(t.emp_no) AS Total
FROM titles as t
JOIN dept_emp de on t.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
AND YEAR(t.to_date) = 9999
GROUP BY title
ORDER BY Total DESC;

# SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,
#        count(de.emp_no) AS Total,
#        e.emp_no,
#        de.dept_no,
#        de.to_date,
#        title
# FROM titles as t
#          JOIN employees e on t.emp_no = e.emp_no
#          JOIN dept_emp de on e.emp_no = de.emp_no
#     JOIN dept_manager dm on de.emp_no = dm.emp_no
# WHERE de.dept_no = 'd009'
#   AND YEAR(de.to_date) = 9999
#   AND t.title = 'Manager'
# GROUP BY e.emp_no;

SELECT d.dept_name AS Department_Name,
       CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager,
       s.salary AS Salary
FROM departments as d
         JOIN dept_manager as dm ON d.dept_no = dm.dept_no
         JOIN employees e on dm.emp_no = e.emp_no
         JOIN salaries s on dm.emp_no = s.emp_no
WHERE YEAR(dm.to_date) = 9999
    AND YEAR(s.to_date) = 9999;
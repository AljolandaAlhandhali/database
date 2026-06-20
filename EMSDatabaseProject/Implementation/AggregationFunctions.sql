-- TASK 1: BASIC AGGREGATION

-- (a) Total number of employees in each department
SELECT jd.job_ID,
       jd.name AS department_name,
       COUNT(e.emp_ID) AS total_employees
FROM JOB_DEPARTMENT jd
LEFT JOIN EMPLOYEE e
ON jd.job_ID = e.job_ID
GROUP BY jd.job_ID, jd.name
ORDER BY jd.name;

-- (b) Minimum, maximum, and average salary across all salary records
SELECT MIN(amount) AS minimum_salary,
       MAX(amount) AS maximum_salary,
       AVG(amount) AS average_salary
FROM SALARY_BONUS;

-- (c) Total bonus paid out across the entire company
SELECT SUM(bonus) AS total_bonus_paid
FROM SALARY_BONUS;


--------------------------------------------------------------------------------
-- TASK 2: GROUP BY WITH HAVING

-- (a) Departments where the average employee age exceeds 30
SELECT jd.job_ID,
       jd.name AS department_name,
       AVG(e.age) AS average_age
FROM JOB_DEPARTMENT jd
JOIN EMPLOYEE e
ON jd.job_ID = e.job_ID
GROUP BY jd.job_ID, jd.name
HAVING AVG(e.age) > 30
ORDER BY average_age DESC;

-- (b) Job titles where more than 2 employees share that qualification position
SELECT q.position AS job_title,
       COUNT(q.emp_ID) AS employee_count
FROM QUALIFICATION q
GROUP BY q.position
HAVING COUNT(q.emp_ID) > 2
ORDER BY employee_count DESC;

-- (c) Months where the total payroll amount exceeds 20,000
SELECT TO_CHAR(payroll_date, 'YYYY-MM') AS payroll_month,
       SUM(total_amount) AS total_monthly_payroll
FROM PAYROLL
GROUP BY TO_CHAR(payroll_date, 'YYYY-MM')
HAVING SUM(total_amount) > 20000
ORDER BY payroll_month;

-- Task 1: INNER JOIN — Employee Full Profile
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       jd.name AS department_name,
       q.position AS job_title,
       sb.amount AS salary_amount,
       MAX(l.leave_date) AS latest_leave_date
FROM EMPLOYEE e
INNER JOIN PAYROLL p
    ON e.emp_ID = p.emp_ID
INNER JOIN QUALIFICATION q
    ON e.emp_ID = q.emp_ID
INNER JOIN JOB_DEPARTMENT jd
    ON e.job_ID = jd.job_ID
INNER JOIN SALARY_BONUS sb
    ON e.salary_ID = sb.salary_ID
LEFT JOIN LEAVE_RECORD l
    ON e.emp_ID = l.emp_ID
GROUP BY e.emp_ID,
         e.fname,
         e.lname,
         jd.name,
         q.position,
         sb.amount
ORDER BY e.emp_ID;


--------------------------------------------------------------------------------
-- Task2: LEFT OUTER JOIN — Missing Records
-- (a) Employees Who Never Took Leave
SELECT e.emp_ID,
       e.fname,
       e.lname
FROM EMPLOYEE e
LEFT JOIN LEAVE_RECORD l
    ON e.emp_ID = l.emp_ID
WHERE l.leave_ID IS NULL;

-- (b) Departments With No Salary/Bonus Records
SELECT jd.job_ID,
       jd.name AS department_name
FROM JOB_DEPARTMENT jd
LEFT JOIN SALARY_BONUS sb
    ON jd.job_ID = sb.job_ID
WHERE sb.salary_ID IS NULL;

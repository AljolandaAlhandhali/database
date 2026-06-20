-- Task 1: Single-Row Subquery
-- (a) Employees whose salary is greater than the company average salary
SELECT e.emp_ID,
       e.fname,
       e.lname,
       sb.amount
FROM EMPLOYEE e
JOIN SALARY_BONUS sb
ON e.salary_ID = sb.salary_ID
WHERE sb.amount >
(
    SELECT AVG(amount)
    FROM SALARY_BONUS
);

-- (b) Department with the highest total payroll amount
SELECT jd.job_ID,
       jd.name,
       SUM(p.total_amount) AS total_payroll
FROM JOB_DEPARTMENT jd
JOIN PAYROLL p
ON jd.job_ID = p.job_ID
GROUP BY jd.job_ID, jd.name
HAVING SUM(p.total_amount) =
(
    SELECT MAX(total_payroll)
    FROM
    (
        SELECT SUM(total_amount) AS total_payroll
        FROM PAYROLL
        GROUP BY job_ID
    )
);

--------------------------------------------------------------------------------
-- Task 2: Multi-Row Subquery
-- (a) Employees who work in departments that have at least one bonus greater than 500 (Using IN)
SELECT emp_ID,
       fname,
       lname
FROM EMPLOYEE
WHERE job_ID IN
(
    SELECT job_ID
    FROM SALARY_BONUS
    WHERE bonus > 500
);

-- (b) Employees whose salary is greater than ALL salaries in the Maintenance department (Using ALL)
SELECT e.emp_ID,
       e.fname,
       e.lname,
       sb.amount
FROM EMPLOYEE e
JOIN SALARY_BONUS sb
ON e.salary_ID = sb.salary_ID
WHERE sb.amount > ALL
(
    SELECT sb2.amount
    FROM EMPLOYEE e2
    JOIN SALARY_BONUS sb2
    ON e2.salary_ID = sb2.salary_ID
    JOIN JOB_DEPARTMENT jd
    ON e2.job_ID = jd.job_ID
    WHERE jd.name = 'Maintenance'
);

-- (c) Employees whose salary is greater than ANY salary in the HR department (Using ANY)
SELECT e.emp_ID,
       e.fname,
       e.lname,
       sb.amount
FROM EMPLOYEE e
JOIN SALARY_BONUS sb
ON e.salary_ID = sb.salary_ID
WHERE sb.amount > ANY
(
    SELECT sb2.amount
    FROM EMPLOYEE e2
    JOIN SALARY_BONUS sb2
    ON e2.salary_ID = sb2.salary_ID
    JOIN JOB_DEPARTMENT jd
    ON e2.job_ID = jd.job_ID
    WHERE jd.name = 'Human Resources'
);

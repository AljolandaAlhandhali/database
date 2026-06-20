-- Task 1: Simple Read-Only View
-- Create View
CREATE OR REPLACE VIEW VW_EMPLOYEE_SUMMARY AS
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       e.gender,
       e.age,
       jd.name AS department_name,
       q.position AS job_title
FROM EMPLOYEE e
JOIN JOB_DEPARTMENT jd
ON e.job_ID = jd.job_ID
JOIN QUALIFICATION q
ON e.emp_ID = q.emp_ID;

-- (a) List all female employees over 30
SELECT *
FROM VW_EMPLOYEE_SUMMARY
WHERE gender = 'F'
AND age > 30;


-- (b) Try to INSERT through the view
INSERT INTO VW_EMPLOYEE_SUMMARY
VALUES (
    100,
    'Test User',
    'F',
    35,
    'Human Resources',
    'HR Officer'
);


--------------------------------------------------------------------------------
-- Task 2: Payroll Dashboard View
-- Create View
CREATE OR REPLACE VIEW VW_PAYROLL_DASHBOARD AS
SELECT p.payroll_ID,
       e.fname || ' ' || e.lname AS employee_name,
       jd.name AS department_name,
       sb.amount AS salary_amount,
       sb.bonus,
       l.reason AS leave_reason,
       p.payroll_date,
       p.total_amount
FROM PAYROLL p
JOIN EMPLOYEE e
ON p.emp_ID = e.emp_ID
JOIN JOB_DEPARTMENT jd
ON p.job_ID = jd.job_ID
JOIN SALARY_BONUS sb
ON p.salary_ID = sb.salary_ID
LEFT JOIN LEAVE_RECORD l
ON p.leave_ID = l.leave_ID;

-- Top 5 Payroll Records by Total Amount
SELECT *
FROM VW_PAYROLL_DASHBOARD
ORDER BY total_amount DESC
FETCH FIRST 5 ROWS ONLY;

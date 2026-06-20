-- TASK 1: INSERT SEED DATA

-- 1) JOB_DEPARTMENT: 5 departments
INSERT INTO JOB_DEPARTMENT VALUES (JOB_DEPARTMENT_SEQ.NEXTVAL, 'IT', 'Engineering', 'Software development department', '3000-8000');
INSERT INTO JOB_DEPARTMENT VALUES (JOB_DEPARTMENT_SEQ.NEXTVAL, 'HR', 'Human Resources', 'Employee management department', '2500-6000');
INSERT INTO JOB_DEPARTMENT VALUES (JOB_DEPARTMENT_SEQ.NEXTVAL, 'FIN', 'Finance', 'Payroll and accounting department', '3000-9000');
INSERT INTO JOB_DEPARTMENT VALUES (JOB_DEPARTMENT_SEQ.NEXTVAL, 'MKT', 'Marketing', 'Marketing and sales department', '2500-7000');
INSERT INTO JOB_DEPARTMENT VALUES (JOB_DEPARTMENT_SEQ.NEXTVAL, 'OPS', 'Operations', 'Daily operations department', '2000-6500');

-- 2) SALARY_BONUS: 5 records
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_SEQ.NEXTVAL, 4500, 54000, 500, 1);
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_SEQ.NEXTVAL, 3200, 38400, 300, 2);
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_SEQ.NEXTVAL, 6000, 72000, 700, 3);
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_SEQ.NEXTVAL, 3800, 45600, 400, 4);
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_SEQ.NEXTVAL, 2900, 34800, 250, 5);

-- 3) EMPLOYEE: 10 employees
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Ali', 'Al-Balushi', 'M', 28, 'Muscat', 'ali@gmail.com', 'pass123', 1, 1);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Sara', 'Al-Harthy', 'F', 32, 'Sohar', 'sara@gmail.com', 'pass123', 2, 2);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Ahmed', 'Al-Rawahi', 'M', 41, 'Nizwa', 'ahmed@gmail.com', 'pass123', 3, 3);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Maha', 'Al-Siyabi', 'F', 26, 'Muscat', 'maha@gmail.com', 'pass123', 1, 1);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Khalid', 'Al-Abri', 'M', 35, 'Sur', 'khalid@gmail.com', 'pass123', 4, 4);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Noor', 'Al-Kindi', 'F', 29, 'Ibri', 'noor@gmail.com', 'pass123', 5, 5);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Hamad', 'Al-Maawali', 'M', 38, 'Muscat', 'hamad@gmail.com', 'pass123', 3, 3);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Aisha', 'Al-Farsi', 'F', 24, 'Salalah', 'aisha@gmail.com', 'pass123', 2, 2);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Saeed', 'Al-Nabhani', 'M', 45, 'Muscat', 'saeed@gmail.com', 'pass123', 4, 4);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Fatma', 'Al-Amri', 'F', 30, 'Sohar', 'fatma@gmail.com', 'pass123', 5, 5);

-- 4) QUALIFICATION: 5 records
INSERT INTO QUALIFICATION VALUES (QUALIFICATION_SEQ.NEXTVAL, 'Software Developer', DATE '2023-01-15', 1);
INSERT INTO QUALIFICATION VALUES (QUALIFICATION_SEQ.NEXTVAL, 'HR Officer', DATE '2022-05-20', 2);
INSERT INTO QUALIFICATION VALUES (QUALIFICATION_SEQ.NEXTVAL, 'Accountant', DATE '2021-03-10', 3);
INSERT INTO QUALIFICATION VALUES (QUALIFICATION_SEQ.NEXTVAL, 'Marketing Specialist', DATE '2023-07-01', 5);
INSERT INTO QUALIFICATION VALUES (QUALIFICATION_SEQ.NEXTVAL, 'Operations Officer', DATE '2022-11-12', 6);

-- Multi-valued requirements
INSERT INTO QUALIFICATION_REQUIREMENT VALUES (1, 'SQL');
INSERT INTO QUALIFICATION_REQUIREMENT VALUES (1, 'Oracle');
INSERT INTO QUALIFICATION_REQUIREMENT VALUES (2, 'Communication Skills');
INSERT INTO QUALIFICATION_REQUIREMENT VALUES (3, 'Accounting Knowledge');
INSERT INTO QUALIFICATION_REQUIREMENT VALUES (4, 'Marketing Strategy');
INSERT INTO QUALIFICATION_REQUIREMENT VALUES (5, 'Operations Management');

-- 5) LEAVE_RECORD: 5 records
INSERT INTO LEAVE_RECORD VALUES (LEAVE_SEQ.NEXTVAL, DATE '2024-01-10', 'Sick leave', 1);
INSERT INTO LEAVE_RECORD VALUES (LEAVE_SEQ.NEXTVAL, DATE '2024-02-15', 'Annual leave', 2);
INSERT INTO LEAVE_RECORD VALUES (LEAVE_SEQ.NEXTVAL, DATE '2024-03-20', 'Emergency leave', 3);
INSERT INTO LEAVE_RECORD VALUES (LEAVE_SEQ.NEXTVAL, DATE '2024-04-05', 'Sick leave due to flu', 5);
INSERT INTO LEAVE_RECORD VALUES (LEAVE_SEQ.NEXTVAL, DATE '2024-05-12', 'Family leave', 6);

-- 6) PAYROLL: 8 records
INSERT INTO PAYROLL VALUES (PAYROLL_SEQ.NEXTVAL, DATE '2024-01-31', 'January payroll', 5000, 1, 1, 1, 1);
INSERT INTO PAYROLL VALUES (PAYROLL_SEQ.NEXTVAL, DATE '2024-01-31', 'January payroll', 3500, 2, 2, 2, 2);
INSERT INTO PAYROLL VALUES (PAYROLL_SEQ.NEXTVAL, DATE '2024-01-31', 'January payroll', 6700, 3, 3, 3, 3);
INSERT INTO PAYROLL VALUES (PAYROLL_SEQ.NEXTVAL, DATE '2024-02-29', 'February payroll', 5000, 4, 1, 1, NULL);
INSERT INTO PAYROLL VALUES (PAYROLL_SEQ.NEXTVAL, DATE '2024-02-29', 'February payroll', 4200, 5, 4, 4, 4);
INSERT INTO PAYROLL VALUES (PAYROLL_SEQ.NEXTVAL, DATE '2024-02-29', 'February payroll', 3150, 6, 5, 5, 5);
INSERT INTO PAYROLL VALUES (PAYROLL_SEQ.NEXTVAL, DATE '2024-03-31', 'March payroll', 6700, 7, 3, 3, NULL);
INSERT INTO PAYROLL VALUES (PAYROLL_SEQ.NEXTVAL, DATE '2024-03-31', 'March payroll', 3500, 8, 2, 2, NULL);

COMMIT;

---------------------------------------------------------------------------------------------------------------------------------------------------
-- TASK 2: SELECT QUERIES

-- (a) Employees whose age is between 25 and 40
SELECT emp_ID,
       fname,
       lname,
       age
FROM EMPLOYEE
WHERE age BETWEEN 25 AND 40
ORDER BY lname ASC;


-- (b) Payroll records where total_amount exceeds 5000
SELECT p.payroll_ID,
       e.fname || ' ' || e.lname AS employee_name,
       jd.name AS department_name,
       p.total_amount
FROM PAYROLL p
JOIN EMPLOYEE e
ON p.emp_ID = e.emp_ID
JOIN JOB_DEPARTMENT jd
ON p.job_ID = jd.job_ID
WHERE p.total_amount > 5000;


-- (c) Employees who have taken leave with reason containing 'sick'
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS employee_name,
       l.leave_date,
       l.reason
FROM EMPLOYEE e
JOIN LEAVE_RECORD l
ON e.emp_ID = l.emp_ID
WHERE LOWER(l.reason) LIKE '%sick%';


-- (d) Departments that have no employees assigned
SELECT jd.job_ID,
       jd.name AS department_name
FROM JOB_DEPARTMENT jd
WHERE NOT EXISTS (
    SELECT 1
    FROM EMPLOYEE e
    WHERE e.job_ID = jd.job_ID
);

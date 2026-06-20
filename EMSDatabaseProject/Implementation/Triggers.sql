-- Task 1: BEFORE INSERT Trigger — Auto Assign emp_ID
-- Create Trigger
CREATE OR REPLACE TRIGGER TRG_EMP_ID
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF :NEW.emp_ID IS NULL THEN
        :NEW.emp_ID := EMPLOYEE_SEQ.NEXTVAL;
    END IF;
END;
/
-- Test Trigger
INSERT INTO EMPLOYEE (
    fname,
    lname,
    gender,
    age,
    contact_add,
    emp_email,
    emp_pass,
    job_ID,
    salary_ID
)
VALUES (
    'Ali',
    'Al-Harthi',
    'M',
    30,
    'Muscat',
    'ali_test@gmail.com',
    '123456',
    1,
    1
);

COMMIT;
-- Verify
SELECT emp_ID,
       fname,
       lname
FROM EMPLOYEE
WHERE emp_email = 'ali_test@gmail.com';


--------------------------------------------------------------------------------
-- Task 2: AFTER INSERT Trigger — Welcome Log
-- Create Log Table
CREATE TABLE EMPLOYEE_LOG (
    log_ID NUMBER PRIMARY KEY,
    emp_ID NUMBER,
    action VARCHAR2(50),
    log_timestamp TIMESTAMP
);
-- Create Log Sequence
CREATE SEQUENCE EMPLOYEE_LOG_SEQ
START WITH 1
INCREMENT BY 1;
-- Create Trigger
CREATE OR REPLACE TRIGGER TRG_EMP_WELCOME_LOG
AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    INSERT INTO EMPLOYEE_LOG (
        log_ID,
        emp_ID,
        action,
        log_timestamp
    )
    VALUES (
        EMPLOYEE_LOG_SEQ.NEXTVAL,
        :NEW.emp_ID,
        'NEW HIRE',
        SYSTIMESTAMP
    );
END;
/
-- 	Test
    -- Employee 1
INSERT INTO EMPLOYEE (
    fname,
    lname,
    gender,
    age,
    contact_add,
    emp_email,
    emp_pass,
    job_ID,
    salary_ID
)
VALUES (
    'Sara',
    'Al-Amri',
    'F',
    28,
    'Sohar',
    'sara_test@gmail.com',
    '123456',
    2,
    2
);
    -- Employee 2
INSERT INTO EMPLOYEE (
    fname,
    lname,
    gender,
    age,
    contact_add,
    emp_email,
    emp_pass,
    job_ID,
    salary_ID
)
VALUES (
    'Ahmed',
    'Al-Busaidi',
    'M',
    35,
    'Muscat',
    'ahmed_test@gmail.com',
    '123456',
    3,
    3
);

COMMIT;

-- Verify Log Records
SELECT *
FROM EMPLOYEE_LOG
ORDER BY log_ID;
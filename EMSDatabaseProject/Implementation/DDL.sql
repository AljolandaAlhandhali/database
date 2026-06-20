-- SEQUENCE to auto-generate primary key
CREATE SEQUENCE JOB_DEPARTMENT_SEQ
START WITH 1
INCREMENT BY 1;

-- JOB_DEPARTMENT
CREATE TABLE JOB_DEPARTMENT (
    job_ID NUMBER PRIMARY KEY,
    job_dept VARCHAR2(100) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    description VARCHAR2(500),
    salary_range VARCHAR2(100) NOT NULL
);


--------------------------------------------------------------------------------
-- SEQUENCE to auto-generate primary key
CREATE SEQUENCE SALARY_BONUS_SEQ
START WITH 1
INCREMENT BY 1;

-- SALARY_BONUS
CREATE TABLE SALARY_BONUS (
    salary_ID NUMBER PRIMARY KEY,
    amount NUMBER(12,2) NOT NULL,
    annual NUMBER(12,2) NOT NULL,
    bonus NUMBER(12,2) DEFAULT 0 NOT NULL,
    
    job_ID NUMBER NOT NULL,
    FOREIGN KEY (job_ID) REFERENCES JOB_DEPARTMENT(job_ID),
    
    CHECK (amount > 0)
);


--------------------------------------------------------------------------------
-- SEQUENCE to auto-generate primary key
CREATE SEQUENCE EMPLOYEE_SEQ
START WITH 1
INCREMENT BY 1;

-- EMPLOYEE
CREATE TABLE EMPLOYEE (
    emp_ID NUMBER PRIMARY KEY,
    fname VARCHAR2(50) NOT NULL,
    lname VARCHAR2(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    age NUMBER(3) NOT NULL,
    contact_add VARCHAR2(250),
    emp_email VARCHAR2(150) NOT NULL,
    emp_pass VARCHAR2(255) NOT NULL,
    
    job_ID NUMBER NOT NULL,
    salary_ID NUMBER NOT NULL,
    FOREIGN KEY (job_ID) REFERENCES JOB_DEPARTMENT(job_ID),
    FOREIGN KEY (salary_ID) REFERENCES SALARY_BONUS(salary_ID),
    
    CHECK (gender IN ('M','F'))
);


--------------------------------------------------------------------------------
-- SEQUENCE to auto-generate primary key
CREATE SEQUENCE QUALIFICATION_SEQ
START WITH 1
INCREMENT BY 1;

-- QUALIFICATION
CREATE TABLE QUALIFICATION (
    qual_ID NUMBER PRIMARY KEY,
    position VARCHAR2(100) NOT NULL,
    date_in DATE NOT NULL,
    
    emp_ID NUMBER NOT NULL,
    FOREIGN KEY (emp_ID) REFERENCES EMPLOYEE(emp_ID)
);


--------------------------------------------------------------------------------
-- QUALIFICATION_REQUIREMENT
-- This table is for Multi-Valued Attribute: requirements
CREATE TABLE QUALIFICATION_REQUIREMENT (
    qual_ID NUMBER,
    requirement VARCHAR2(200),
    
    FOREIGN KEY (qual_ID) REFERENCES QUALIFICATION(qual_ID),
    PRIMARY KEY (qual_ID, requirement)
);


--------------------------------------------------------------------------------
-- SEQUENCE to auto-generate primary key
CREATE SEQUENCE LEAVE_SEQ
START WITH 1
INCREMENT BY 1;

-- LEAVE_RECORD
CREATE TABLE LEAVE_RECORD (
    leave_ID NUMBER PRIMARY KEY,
    leave_date DATE NOT NULL,
    reason VARCHAR2(250) NOT NULL,
    
    emp_ID NUMBER NOT NULL,
    FOREIGN KEY (emp_ID) REFERENCES EMPLOYEE(emp_ID)
);


--------------------------------------------------------------------------------
-- SEQUENCE to auto-generate primary key
CREATE SEQUENCE PAYROLL_SEQ
START WITH 1
INCREMENT BY 1;

-- PAYROLL
CREATE TABLE PAYROLL (
    payroll_ID NUMBER PRIMARY KEY,
    payroll_date DATE NOT NULL,
    report VARCHAR2(500),
    total_amount NUMBER(12,2) NOT NULL,
    
    emp_ID NUMBER NOT NULL,
    job_ID NUMBER NOT NULL,
    salary_ID NUMBER NOT NULL,
    leave_ID NUMBER,
    FOREIGN KEY (emp_ID) REFERENCES EMPLOYEE(emp_ID),
    FOREIGN KEY (job_ID) REFERENCES JOB_DEPARTMENT(job_ID),
    FOREIGN KEY (salary_ID) REFERENCES SALARY_BONUS(salary_ID),
    FOREIGN KEY (leave_ID) REFERENCES LEAVE_RECORD(leave_ID),
    
    CHECK (total_amount > 0)
);

-- Task 1: Procedure — SP_ADD_EMPLOYEE
-- Create Procedure
CREATE OR REPLACE PROCEDURE SP_ADD_EMPLOYEE (
    p_fname        VARCHAR2,
    p_lname        VARCHAR2,
    p_gender       CHAR,
    p_age          NUMBER,
    p_contact_add  VARCHAR2,
    p_emp_email    VARCHAR2,
    p_emp_pass     VARCHAR2,
    p_job_ID       NUMBER,
    p_salary_ID    NUMBER
)
IS
    v_count NUMBER;
BEGIN

    SELECT COUNT(*)
    INTO v_count
    FROM EMPLOYEE
    WHERE emp_email = p_emp_email;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Email already exists.'
        );
    END IF;

    INSERT INTO EMPLOYEE (
        emp_ID,
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
        EMPLOYEE_SEQ.NEXTVAL,
        p_fname,
        p_lname,
        p_gender,
        p_age,
        p_contact_add,
        p_emp_email,
        p_emp_pass,
        p_job_ID,
        p_salary_ID
    );

    DBMS_OUTPUT.PUT_LINE('Employee added successfully.');

    COMMIT;

END;
/

-- -- Display messages printed by DBMS_OUTPUT.PUT_LINE
SET SERVEROUTPUT ON;

-- First Test (Success)
BEGIN
    SP_ADD_EMPLOYEE(
        'Omar',
        'Al-Busaidi',
        'M',
        27,
        'Muscat',
        'omar@gmail.com',
        '123456',
        1,
        1
    );
END;
/
-- Second Test (Duplicate Email)
BEGIN
    SP_ADD_EMPLOYEE(
        'Omar',
        'Al-Busaidi',
        'M',
        27,
        'Muscat',
        'omar@gmail.com',
        '123456',
        1,
        1
    );
END;
/


--------------------------------------------------------------------------------
-- Task 2: Function — FN_NET_SALARY
-- Create Function
CREATE OR REPLACE FUNCTION FN_NET_SALARY (
    p_emp_ID NUMBER
)
RETURN NUMBER
IS
    v_net_salary NUMBER;
BEGIN

    SELECT sb.amount + sb.bonus
    INTO v_net_salary
    FROM EMPLOYEE e
    JOIN SALARY_BONUS sb
    ON e.salary_ID = sb.salary_ID
    WHERE e.emp_ID = p_emp_ID;

    RETURN v_net_salary;

END;
/

-- Use Function in SELECT Query
SELECT emp_ID,
       fname,
       lname,
       FN_NET_SALARY(emp_ID) AS net_salary
FROM EMPLOYEE
ORDER BY FN_NET_SALARY(emp_ID) DESC;

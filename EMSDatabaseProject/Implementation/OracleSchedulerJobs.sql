-- Task 1: Simple One-Time Scheduler Job
-- Create Job
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name   => 'JOB_GREET_EMPLOYEES',
        job_type   => 'PLSQL_BLOCK',
        job_action => '
        BEGIN
            DBMS_OUTPUT.PUT_LINE(''Payroll System Initialized'');

            INSERT INTO EMPLOYEE_LOG (
                log_ID,
                emp_ID,
                action,
                log_timestamp
            )
            VALUES (
                EMPLOYEE_LOG_SEQ.NEXTVAL,
                NULL,
                ''PAYROLL SYSTEM INITIALIZED'',
                SYSTIMESTAMP
            );

            COMMIT;
        END;',
        start_date => SYSTIMESTAMP + INTERVAL '2' MINUTE,
        enabled    => TRUE
    );
END;
/
-- Check Job
SELECT job_name,
       enabled,
       state
FROM USER_SCHEDULER_JOBS
WHERE job_name = 'JOB_GREET_EMPLOYEES';
-- Check Job Log
SELECT *
FROM USER_SCHEDULER_JOB_LOG
WHERE job_name = 'JOB_GREET_EMPLOYEES'
ORDER BY log_date DESC;
-- Check EMPLOYEE_LOG
SELECT *
FROM EMPLOYEE_LOG
ORDER BY log_ID DESC;


--------------------------------------------------------------------------------
-- Task 2: Recurring Job — Daily Leave Report
-- Create Job
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'JOB_DAILY_LEAVE_REPORT',
        job_type        => 'PLSQL_BLOCK',
        job_action      => '
        DECLARE
            v_leave_count NUMBER;
        BEGIN

            SELECT COUNT(*)
            INTO v_leave_count
            FROM LEAVE_RECORD
            WHERE TRUNC(leave_date) = TRUNC(SYSDATE);

            INSERT INTO EMPLOYEE_LOG (
                log_ID,
                emp_ID,
                action,
                log_timestamp
            )
            VALUES (
                EMPLOYEE_LOG_SEQ.NEXTVAL,
                NULL,
                ''DAILY LEAVE COUNT: '' || v_leave_count,
                SYSTIMESTAMP
            );

            COMMIT;
        END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY;BYHOUR=7;BYMINUTE=0;BYSECOND=0',
        enabled         => TRUE
    );
END;
/
-- Show Job Definition
SELECT *
FROM USER_SCHEDULER_JOBS
WHERE JOB_NAME = 'JOB_DAILY_LEAVE_REPORT';
-- Check Next Run Time
SELECT job_name,
       state,
       next_run_date
FROM USER_SCHEDULER_JOBS
WHERE job_name = 'JOB_DAILY_LEAVE_REPORT';
-- Check Execution Log
SELECT *
FROM USER_SCHEDULER_JOB_LOG
WHERE job_name = 'JOB_DAILY_LEAVE_REPORT'
ORDER BY log_date DESC;
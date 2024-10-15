/************************************* patients **********************************************************

*********************************************************************************************************/

CREATE OR REPLACE EVENT delRecords
        -- Schedule the time for the event
    ON SCHEDULE EVERY 1 DAY DO BEGIN

        --  Delete records from employee
        DELETE FROM employees.employees WHERE eStatus = 0;

        -- Calling a function to check wheter the patient is recovered or not
        CALL checkRecovery();

        -- Delete records from relations 
        DELETE FROM employees.relations WHERE recovered = 1;

        -- Delete records from turnus
        DELETE FROM employees.turnus WHERE dato < DATE_SUB(CURDATE(), INTERVAL + 1 YEAR);

        -- When the employee has gone a period with out being sick, he get back sickdays

END x
/*************************************************************************************************************/

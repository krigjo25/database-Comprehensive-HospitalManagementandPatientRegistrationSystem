/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

/*************************** TriggerPDF **********************

This trigger, will trigger a new creation of a pdf file, when
a new patient is added to the database.
x
***********************************************************/
DELIMITER x
CREATE OR REPLACE TRIGGER triggerPDF AFTER INSERT ON patientRegistrations
    FOR EACH ROW
    BEGIN

        /************ triggerPDF ********************'

            A PDF file called patientJournal will be created
            when a new record of a patient has been added to
            the database

        ************************************************/
        --  Declare variables
        DECLARE cmd VARCHAR(255);
        DECLARE result int(10);

        -- Give Variables a value
        SET cmd = CONCAT('python /home/runPDF.py');

        SET result = sys_exec(cmd);

    END x
/*********************************************************/
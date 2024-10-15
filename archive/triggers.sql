/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

/*************************** TriggerPDF **********************

This trigger, will trigger a new creation of a pdf file, when
a new patient is added to the database.
x
***********************************************************/
DELIMITER x

/*************************** Employees **********************

The Trigger add the employee to another table,
to keep the records clean, and still save the employee
Archives and termination are keept in new Databases
x
*************************************************************/
DELIMITER x
CREATE OR REPLACE TRIGGER terminateEmployee BEFORE DELETE ON employees
    FOR EACH ROW BEGIN

        --  Assigning old values into the new table
        INSERT INTO archive.terminatedEmployees ( eID, eName, birthDate, street, zipCode, email, phone, occupation, department)
        VALUES
        (OLD.eID, OLD.eName, OLD.birthDate, OLD.street, OLD.zipCode, OLD.email, OLD.phone, OLD.occupation, OLD.department);
    END x

/*********************************************************/
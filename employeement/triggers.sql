/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

/*************************** TriggerPDF **********************

This trigger, will trigger a new creation of a pdf file, when
a new patient is added to the database.
x
***********************************************************/
DELIMITER x

DELIMITER x
CREATE OR REPLACE TRIGGER terminateEmployee BEFORE DELETE ON employeeRecords
    FOR EACH ROW BEGIN

        /************ salaryChanges ********************'
            In order to keep the records clean, and still
            save information about resigned employees
            The Trigger will archive the  resigned employee in
            archives, terminatedemployees.

        ************************************************/

        --  Assigning old values into the new table
        INSERT INTO archive.terminatedEmployees ( eID, eName, birthDate, street, zipCode, email, phone, occupation, department)
        VALUES
        (OLD.eID, OLD.eName, OLD.birthDate, OLD.street, OLD.zipCode, OLD.email, OLD.phone, OLD.occupation, OLD.department);
    END x


/*********************************************************/

CREATE OR REPLACE TRIGGER salaryChanges AFTER UPDATE ON salaryInfo
    FOR EACH ROW BEGIN

        /************ salaryChanges ********************'
            When yearly salary is updated, the trigger will
            recalculate the necsessary values in monthly
            and hourly salary.

        ************************************************/

        --  Declare variables
        DECLARE mSalary DECIMAL(7.2);
        DECLARE hSalary DECIMAL(6.2);
        DECLARE ySalary DECIMAL(9.2);

        --  Set values to the variables using a function

        SELECT yearlyRate into ySalary FROM salaryInfo;
    
        SET hSalary = ySalary / 1950;
        SET mSalary = ySalary = mSalary / 163.5;

        --  Inserting values into the table
        UPDATE salaryInfo SET hourlyRate = hSalary;
        UPDATE salaryInfo SET monthlyRate = mSalary;

    END x
    


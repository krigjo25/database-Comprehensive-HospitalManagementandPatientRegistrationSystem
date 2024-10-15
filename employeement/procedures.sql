/***************************************************************

This file contains the Procedures which is used in the project

Turnus Prodcedures,
Relation Procedures,
Employees Procedures,

/***************************************************************/

/********************** Employees Procedures *******************/
CREATE OR REPLACE PROCEDURE newEmployee (IN eName VARCHAR(255), IN vDate DATE, IN vStreet VARCHAR(255), IN vZip MEDIUMINT, IN vEmail VARCHAR(255), IN vPhone VARCHAR(255), IN veStatus TINYINT, IN vTitle VARCHAR(255),  IN vDep VARCHAR(255), OUT msg VARCHAR(255))
    BEGIN

        /************ newEmployee ********************'
            Allows the management to insert a new employee,
            record into the databse.

        *****************************************************************/

        --  Declare variables
        DECLARE Error INT;
        DECLARE vCounter INT;
        DECLARE tilt VARCHAR(255);
        DECLARE vSalary DECIMAL(9,2);

        --  Selecting value into the variable tilt

        SELECT occupation INTO tilt FROM salaryInfo WHERE occupation = vTitle;

        -- Checking if the occupation exists, if not, produce an error
        IF tilt IS NULL THEN
            
            SET Error = 404;
            SET msg = CONCAT(' Title, ', vTitle, ' WERE NOT FOUND IN the Database');
            SELECT Error, msg AS 'ERROR message';

        ELSE

        --  Calling a function to calculate the salary and convert the Phone number
            SET vPhone = convertPhone(vPhone);
            SET vSalary = calculateSalary(vTitle, veStatus, vSalary);

            --  Inserting the records into the table
            INSERT INTO employeeRecords (eName, birthDate, street, zipCode, email, phone, eStatus, occupation, hSalary, department) VALUES
            (eName, vDate, vStreet, vZip, vEmail, vPhone, veStatus, vTitle, vSalary, vDep);
        END IF;
    END x

/**************************************************************/

CREATE OR REPLACE PROCEDURE modifyEmployee (IN vColumn VARCHAR(20), IN vValue VARCHAR(255), IN veID BIGINT)
    BEGIN

        /************ calculateSalary(vSalary) ********************'

            The procedure below allow the management
            to modify information about the employee,
            But it doesnt allow date but we assume 
            the date is correct in this case

        *******************************************************/

        --  The procedure updates, the values for employees, execpt date
        SET @Query = CONCAT('UPDATE employeeRecords SET ', vColumn, ' = ', vValue, ' WHERE eID = ', veID);
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

    END x
/***************************************************************/


CREATE OR REPLACE PROCEDURE newRelation ( IN veID BIGINT, IN vpID BIGINT, OUT vError VARCHAR(255))
    BEGIN

            /************ newRelations ********************'

                Assigns a doctor to a patient.

            *****************************************************************/

        -- Declareing new variables
        DECLARE vCount TINYINT;
        DECLARE pName VARCHAR(255);
        DECLARE veName VARCHAR(255);

        --  Assigning the new variable values
        SET veName = (SELECT eName from employeeRecords WHERE eID = veID);
        SET pName = (SELECT patientName from patientRegistration.patientRegistrations WHERE patientID = vpID);

        --  Counting how many times the doctor has been added to the table
        SET vCount = (SELECT COUNT(eID) FROM relations WHERE eID = veID);

        IF vCount <= 10 THEN

            -- Assigning doctor to patient
            INSERT INTO relations (pID, patientName, eID, employeeName )
                VALUES 
                (vpID, pName, veID, veName);

            SET vError = CONCAT(veName, ' Were assigned as ', pName, ' Primary doctor');

            SELECT vError AS 'SQL operation Succsess'; 

        ELSEIF vCount >= 10 THEN

            SET vError = CONCAT (veName, ' Has reached the maximum of assignments. Take care of your employees.');

            SELECT vError AS 'SQL operation Failed !';
        END IF;
    END x

CREATE OR REPLACE PROCEDURE modifyRelation(IN veID BIGINT, IN vpID BIGINT, OUT vConf VARCHAR(100))
    BEGIN

            -- Update relations patient and employee name
            UPDATE relations SET patientName = (SELECT patientName FROM patients.patient WHERE pID = vpID) WHERE pID= vpID;
            UPDATE relations SET employeeName = (SELECT employeeName FROm employeement.employeeRecords WHERE eID = veID) WHERE eID = veID;

            SET vConf = CONCAT('You have re-assigned ', (SELECT employeeName FROM relation WHERE eID = veID), ' To ', (SELECT patientName FROM relations WHERE pID = vpID));

            SELECT vConf AS 'SQL Confirmation';

    END x
/*******************************************************************/

/*********************** Turnus Procedures *************************/
CREATE OR REPLACE PROCEDURE newSalary (IN vName VARCHAR(255), IN ySalary DECIMAL(8.2))
    BEGIN

        /************ calculateSalary(vSalary) ********************'

            Inserting a new record for occupation, and salary
            information for the occupation.

        *****************************************************************/

        --  Declare variables
        DECLARE mSalary DECIMAL(7.2);
        DECLARE hSalary DECIMAL (6.2);

        --  Set values to the variables using a function
        SET mSalary = ySalary / 162.5;
        SET hSalary = ySalary / 1950;

        --  Inserting values into the table
        INSERT INTO salaryInfo(occupation, yearlySalary, monthlySalary, hourlySalary)
            VALUES (vName, ySalary, mSalary, hSalary);

    END x


/*******************************************************************/
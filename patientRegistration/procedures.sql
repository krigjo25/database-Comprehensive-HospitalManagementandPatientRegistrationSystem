/***************************************************************

This file contains the Procedures which is used in the project


Patient Procedures,
Billing Proceduures,

/***************************************************************/

/*********************** Patients Procedures ******************************/
DELIMITER x
CREATE OR REPLACE PROCEDURE newPatient (IN pName VARCHAR(255), IN bDate DATE, IN vssn VARCHAR(12), IN vGender VARCHAR(5), IN vPhone VARCHAR(255), IN vStreet VARCHAR(255), IN vZip INT, IN vWeight INT, IN vHeight INT, IN bType VARCHAR(2))
    BEGIN
        /************ newPatient ********************
            Creates a new patient record inside the patientRegistrations table, with
            
            -   Converting vssn from 123456789 to 123-456-789
            -   Converting Phone characters to area code etc.
            -   Calls a stored procedure to create a new table in patientRecords
                for storing booking data, by using the social security number

        *****************************************************************/

        --  Calls a StoredProcedure  
        CALL newPatientRecord(pName, vssn);

        --  Converting the given values for the variables using functions
        SET vssn = convertssn(vssn);
        SET vPhone = convertPhone(vPhone);

        --  Insert values into the table
        INSERT INTO patientRegistrations (patientName, birthDate, socialSecurityNumber, gender, phoneNumber, street, zipCode, kg, cm, bloodType) 
            VALUES (pName, bDate, vssn, vGender, vPhone, vStreet, vZip, vWeight, vHeight, bType);


    END x

/*****************************************************************/

CREATE OR REPLACE PROCEDURE modifyPatient (IN vColumn VARCHAR(20), vValue VARCHAR(255), IN vID INT)
    BEGIN
        /************ modifyPatient ********************

            The Procedure modifies the selected column,
            updates the value
    
        *****************************************************************/
        --  Declare variables
        DECLARE vAlergy TYPE OF patientRegistrations.alergyID;
        DECLARE vMedecine TYPE OF patientRegistrations.medecineID;
        DECLARE vMedecineTwo TYPE OF patientRegistrations.medecineID;

        -- Selecting medecine value into the variables

        IF vColumn = 'alergyID' THEN

            -- Select the old IDS into the vAlergy variable IF they're not default
            SELECT alergyID INTO vAlergy FROM patientRegistrations WHERE patientID = vID;
            SELECT medecineID INTO vMedecineTwo FROM hospitalManagementSystem.alergies WHERE alergyID = vValue;
            SELECT medecineID INTO vMedecine FROM hospitalManagementSystem.alergies WHERE alergyID = vAlergy;

            --  Checking wheter the vAlergy Contains 
            IF vAlergy != 'NNNNA' THEN

                SET vValue = CONCAT(vAlergy, ',', vValue);

                CASE

                    WHEN vMedecine != 'NNNNM' THEN
                        SET vMedecine = CONCAT(vMedecine, ',', vMedecineTwo);
                        UPDATE patientRegistrations SET medecineID = vMedecine WHERE patientID = vID;

                    WHEN vMedecine = 'NNNNM' THEN
                        UPDATE patientRegistrations SET medecineID = vMedecine WHERE patientID = vID;            
                END CASE;

            END IF;

        ELSEIF vColumn = 'diagnoseID' THEN

            -- Select the old IDS into the vAlergy variable IF they're not default
            SELECT diagnoseID INTO vAlergy FROM patientRegistrations WHERE patientID = vID;
            SELECT medecineID INTO vMedecine FROM HospitalManagementSystem.diagnosis WHERE alergyID = vAlergy;
            SELECT medecineID INTO vMedecine FROM HospitalManagementSystem.diagnosis WHERE alergyID = vAlergy;

            --  Checking wheter the vAlergy Contains 
            IF vAlergy != 'NNNND' THEN

                SET vValue = CONCAT(vAlergy, ',', vValue);
            
                CASE

                    WHEN vMedecine != 'NNNNM' AND vMedecine != vMedecineTwo THEN
                        SET vMedecine = CONCAT(vMedecine, ',', vMedecineTwo);
                        UPDATE patientRegistrations SET medecineID = vMedecine WHERE patientID = vID;

                    WHEN vMedecine = 'NNNNM' THEN
                        UPDATE patientRegistrations SET medecineID = vMedecine WHERE patientID = vID;
                END CASE;
            
            END IF;

        END IF;

                --  Updates patient information Which has VARCHAR as DATATYPE
                SET @Query = CONCAT('UPDATE patientRegistrations SET ', vColumn , ' = ', vValue, ' WHERE patientID = ', vID);

                --  Prepareing and executing the statement
                PREPARE stmt FROM @Query;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
        END x
/***********************************************************************/
DELIMITER
/*********************** Creating a new patientRecord Procedures ************************/
-- x
DELIMITER x
CREATE OR REPLACE PROCEDURE newPatientRecord (IN vName VARCHAR(255), IN vssn VARCHAR(255))
    BEGIN

        /************ newPatientTable ********************
            The Procedure creates a new patient table, with
            the socialSecurityNumber of the patient

        *****************************************************************/

        --  Declare variables
        DECLARE tableName VARCHAR(255);

        SET tableName = generateTableName(vName, vssn);
        
        --  Creating the table
        SET @Query = CONCAT('CREATE TABLE IF NOT EXISTS patientRecords.', tableName,'(id BIGINT SIGNED PRIMARY KEY AUTO_INCREMENT,oprocedure VARCHAR(255),DateIn DATE,procedureTime TIME,procedurePrice DECIMAL(8.2),report VARCHAR(255),eName VARCHAR(255),room VARCHAR(255),booked DATE DEFAULT CURDATE())');
        
        --Prepareing and executing the statement
        PREPARE stmt FROM @Query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

    END x

/*******************************************************************/
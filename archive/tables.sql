/***************************************************************
Comments such as the one below indicates, it has to be made after the the given table

--  Comment

This file contains tables which is placed in patients

DATABASE

employee,
    Tables
        employees,
        relations
        turnus

***************************************************************/

/******************************** Employee *******************************************************************/

CREATE OR REPLACE TABLE terminatedEmployee (
                        id BIGINT SIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
                        eID BIGINT NOT NULL,

                    --  General information
                        eName VARCHAR(255) NOT NULL,
                        birthDate DATE NOT NULL,
                        street VARCHAR(255) NOT NULL,
                        zipCode MEDIUMINT NOT NULL DEFAULT 12345,
                        email VARCHAR(255) NOT NULL,
                        phone VARCHAR(255) NOT NULL,

                    -- Work related information
                        occupation VARCHAR(255) NOT NULL,
                        department VARCHAR(255) NOT NULL,
                        terminated TIMESTAMP NOT NULL DEFAULT NOW(),
                    --  Constraints
                       INDEX(eName, sickDays, occupation, hRate, department));

/*************************************************************************************************************/
DELIMITER ;
/******************************** paidBillings **************************************************************/
CREATE OR REPLACE TABLE paidBillings (
                        
                        --  Table Columns
                        id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        invoiceID BIGINT NOT NULL,
                        pID BIGINT SIGNED NOT NULL,
                        discount TINYINT NOT NULL, 
                        incTax DECIMAL (7.2) NOT NULL, 
                        pStatus TINYINT NOT NULL DEFAULT 1,
                        datePaid DATE DEFAULT CURDATE(),

                        --  Table Constraints
                        INDEX (pID, invoiceID, pStatus),
                        CONSTRAINT patientIDFK_2 FOREIGN KEY (pID) REFERENCES patients.patient (id) ON DELETE CASCADE ON UPDATE CASCADE);
 /*************************************************************************************************************/

/******************************** creditBillings **************************************************************/
CREATE OR REPLACE TABLE creditedBillings (

                        --  Table Columns
                        id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        invoiceID BIGINT NOT NULL,
                        pID BIGINT SIGNED NOT NULL,
                        discount TINYINT NOT NULL, 
                        incTax DECIMAL (7.2) NOT NULL, 
                        pStatus TINYINT NOT NULL DEFAULT 0,
                        overDue DATE NOT NULL,
                        dateCredited DATE NOT NULL DEFAULT CURDATE(),

                        --  Table Constraints
                        INDEX (pID, invoiceID, pStatus),
                        CONSTRAINT patientIDFK_1 FOREIGN KEY (pID) REFERENCES patients.patient (id) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/
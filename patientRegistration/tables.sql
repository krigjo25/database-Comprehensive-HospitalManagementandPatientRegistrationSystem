/***************************************************************
This file contains tables which is placed in patients

DATABASE

patients
    Tables
        patient,
        socialSecurityNumber
        billing
************************************************************************/

/********************************************   Patient table   *******************************************/

CREATE OR REPLACE TABLE patientRegistrations (
                        patientID BIGINT SIGNED NOT NULL, -- N AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT=100
                        patientName VARCHAR(255) NOT NULL,

                        -- General information
                        birthDate DATE NOT NULL DEFAULT '1973-01-01',
                        socialSecurityNumber VARCHAR(12) NOT NULL UNIQUE DEFAULT 0101740009,
                        gender VARCHAR(5) NOT NULL DEFAULT 'M',
                        phoneNumber VARCHAR(255),
                        street VARCHAR(255) NOT NULL DEFAULT '128 CharminAvenue',
                        zipcode MEDIUMINT SIGNED NOT NULL DEFAULT 12345,

                    --  Health information
                        organDonor VARCHAR(3) NOT NULL DEFAULT 'no',
                        bloodDonor VARCHAR(3) NOT NULL DEFAULT 'no',
                        kg DECIMAL (5.2) DEFAULT 80.0,
                        cm DECIMAL (4.1) NOT NULL DEFAULT 180.0,
                        bloodType VARCHAR(2), 
                        primaryDoctor VARCHAR(255) NOT NULL DEFAULT 'Jhon Doe',
                        alergyID VARCHAR(255) NOT NULL DEFAULT 'NNNNA,',
                        diagnoseID VARCHAR(255) NOT NULL DEFAULT 'NNNND,',
                        medecineID  VARCHAR(255) NOT NULL DEFAULT 'NNNNM,',
                        patientJournal MEDIUMBLOB,

                    -- Employeement status 
                        company VARCHAR(255) NOT NULL DEFAULT 'Unemployeed',
                        industry VARCHAR(255) NOT NULL DEFAULT 'Unemployeed',
                        registered TIMESTAMP NOT NULL DEFAULT NOW(),

                    --  EmergencyContacts
                        contactOne VARCHAR(255),
                        NumberOne VARCHAR(255),
                        contactTwo VARCHAR(255),
                        NumberTwo VARCHAR(255),
                        contactThree VARCHAR(255),
                        NumberThree VARCHAR(255),
                    
                    --  Extra columns
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),
                    --  Table Constraints

                        INDEX (diagnoseID, medecineID, alergyID));

/*********************************************************************************************************/
DELIMITER

/********************************************   patientInfoTable,    *******************************************/

CREATE OR REPLACE TABLE socialSecurityNumber (
                        id INT SIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
                        
                    --  General Information
                        dateIn CURDATE NOT NULL,
                        oProcedure VARCHAR(255),
                        price DECIMAL (8.2)
                        dateProcedure DATE NOT NULL,
                        timeProcedure TIME NOT NULL,
                        employeeReport VARCHAR(255),
                        employeeName VARCHAR(255),
                        roomName VARCHAR(255) NOT NULL,
                        dateBooked DATE NOT NULL CURDATE(), 
                        dateOut Date,

                    --  Extra columns
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),
                        
                    --  Table Constraints

                        INDEX (patientID),
                        CONSTRAINT patientID_fk FOREIGN KEY(patientID) REFERENCES patients.patient(id) ON DELETE CASCADE ON UPDATE CASCADE);
/*********************************************************************************************************/

/************************************* Billings **********************************************************/
DELIMITER
CREATE TABLE billing (
                    --  Table Columns
                        id BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
                        invoiceID INT NOT NULL UNIQUE, -- AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=300000 
                        patientID BIGINT SIGNED NOT NULL,
                        discount TINYINT NOT NULL,
                        incTax DECIMAL(11,2),
                        overDue DATE NOT NULL,
                        paymentStatus TINYINT NOT NULL DEFAULT 0,
                    
                    -- Table Constraints
                        INDEX (patientID),
                        CONSTRAINT patientID_FK FOREIGN KEY (patientID) REFERENCES patientRegistrations (patientID) ON DELETE CASCADE);
/*************************************************************************************************************/

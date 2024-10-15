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
/******************************** SalaryInfo **************************************************************/
CREATE OR REPLACE TABLE salaryInfo (
                        --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        occupation VARCHAR(255) NOT NULL, 
                        yearlySalary DECIMAL(10,2) NOT NULL,
                        monthlySalary DECIMAL(7,2) NOT NULL,
                        hourlySalary DECIMAL (5,2) NOT NULL,

                        --  Constraints
                        INDEX(occupation));
/*************************************************************************************************************/

/******************************** Employee *******************************************************************/

CREATE OR REPLACE TABLE employeeRecords (
                        eID BIGINT SIGNED NOT NULL, -- AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT = 100

                    --  General information
                        eName VARCHAR(255) NOT NULL,
                        birthDate DATE NOT NULL,
                        street VARCHAR(255) NOT NULL,
                        zipCode MEDIUMINT NOT NULL DEFAULT 12345,
                        email VARCHAR(255) NOT NULL,
                        phone VARCHAR(255) NOT NULL,

                    -- Work related information
                        eStatus TINYINT NOT NULL DEFAULT 5,
                        occupation VARCHAR(255) NOT NULL,
                        hSalary DECIMAL(9,2),
                        department VARCHAR(255) NOT NULL,
                        sickDays TINYINT SIGNED NOT NULL DEFAULT 25,
                        hired TIMESTAMP NOT NULL DEFAULT NOW(),
                        
                    --  Constraints
                        INDEX(eName, sickDays, occupation, hSalary, department),
                        CONSTRAINT occupationFK FOREIGN KEY(occupation) REFERENCES employeement.salaryInfo (occupation) ON DELETE CASCADE);
/*************************************************************************************************************/
DELIMITER ;
/******************************** Relations **************************************************************/
CREATE OR REPLACE TABLE relations (

                        --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        pID BIGINT SIGNED NOT NULL,
                        patientName VARCHAR(255),
                        eID BIGINT SIGNED NOT NULL,
                        employeeName VARCHAR(255) NOT NULL,
                        recovered TINYINT NOT NULL DEFAULT 0,

                        --  Table Constraints
                        UNIQUE(pID),
                        INDEX (eID, pID),
                        CONSTRAINT employeeID_fk FOREIGN KEY (eID) REFERENCES employeement.employeeRecords (eID) ON DELETE CASCADE,
                        CONSTRAINT employeeName_fk FOREIGN KEY (employeeName) REFERENCES employeement.employeeRecords (eName) ON DELETE CASCADE,
                        CONSTRAINT patientID_fk FOREIGN KEY (pID) REFERENCES patientRegistration.patientRegistrations (patientID) ON DELETE CASCADE);
DELIMITER ;
/******************************** Turnus **************************************************************/
CREATE OR REPLACE TABLE turnus (
                        --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        eID BIGINT SIGNED NOT NULL,
                        eName VARCHAR(255) NOT NULL,
                        dato DATE NOT NULL,
                        inn TIME NOT NULL,
                        ut TIME NOT NULL,
                        hrs TINYINT NOT NULL,
                        minute TINYINT NOT NULL,
                        absence VARCHAR(255),
                        sickDays TINYINT SIGNED NOT NULL DEFAULT 25,

                        --  Table Constraints
                        INDEX (eID, eName, sickDays),
                        CONSTRAINT employeementID_FK2 FOREIGN KEY (eID) REFERENCES employeeRecords (eID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT employeeName_fk2 FOREIGN KEY (eName) REFERENCES employeeRecords (eName) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT sickDays_fk FOREIGN KEY (sickDays) REFERENCES employeeRecords (sickDays) ON DELETE CASCADE);
/*************************************************************************************************************/
DELIMITER ;

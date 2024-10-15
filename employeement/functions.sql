/*****************************functions for employees***********************************/

--  Converting Phone numbers
CREATE OR REPLACE FUNCTION convertPhone(vPhone VARCHAR(255)) RETURNS VARCHAR(255) NOT DETERMINISTIC
    BEGIN

        /************ convertPhone ********************
            The function adds the "-" between the digits
            using SUBSTRING to get a part of the digits,
            using CONCAT to add, '-'.

        *****************************************************************/--   Calculating bmi

        --  Gathering phonenumber
        DECLARE areaCode TYPE OF employeeRecords.phone;
        DECLARE lastDigit TYPE OF employeeRecords.phone;
        DECLARE threeDigit TYPE OF employeeRecords.phone;
        --  Trimming the Phone Number
        SET areaCode = SUBSTRING(vPhone, 1,3);
        SET lastDigit = SUBSTRING(vPhone, 7,4);
        SET threeDigit = SUBSTRING(vPhone, 4,3);

        SET vPhone = CONCAT ('(', areaCode, ')- ', threeDigit, '-', lastDigit);
    RETURN vPhone;
    END x

CREATE OR REPLACE FUNCTION checkRecovery() RETURNS INT NOT DETERMINISTIC
    BEGIN
        /************ checkRecovery() ********************
            Checking wheter the patient has left the hospital,
            and returns 1 if the patient has been recovered.

        *****************************************************************/--   Calculating bmi

        --  Declaring variables
        DECLARE vDate DATE;
        DECLARE vID BIGINT;
        DECLARE vpID BIGINT;    
        DECLARE vCounter BIGINT; 
        DECLARE vRecovery TINYINT;
        
        --  Set Values into variables
        SET vID = 0;
        SET vpID = 1000;
        SET vRecovery = 0;

        --  Counting rows
        SELECT COUNT(*) INTO vCounter FROM patients.patient WHERE (dateOut IS NOT NULL);

        --  While loop to check each row
        WhileCounter: WHILE vID <= vCounter DO

            --  Selecting recovery date into vDate
            SELECT dateOut INTO vDate FROM patients.patient WHERE pID = vpID;
    
            --  If statements
            IF vOutDate <= CURDATE() THEN SET vRecovery = 1;

                CASE

                    WHEN vRecovery > 0 THEN UPDATE employeement.relations SET recovered = vRecovery WHERE pID = vpID AND recovered = 0;

                END CASE;

            END IF;
            --  Update value of the variable
            SET vID = vID+1;
            SET vPID = vpID+1;

        END WHILE;
        --  Returning Values
        RETURN vRecovery;
    END x

CREATE OR REPLACE FUNCTION calculateSalary(vTitle VARCHAR(255), veStatus TINYINT, vSalary DECIMAL (9.2)) RETURNS DECIMAL(9.2)
    BEGIN

        /************ calculateSalary(vSalary) ********************'
            Calculates the hourly salary based on the Employee Status
            Checking wheter the patient has left the hospital,
            and returns 1 if the patient has been recovered.

        *****************************************************************/
        
        --  Declare variables
        DECLARE endLoop TINYINT;
        DECLARE msg VARCHAR(255);
        DECLARE vSalary DECIMAL(9.1);

        --  Declare cursor
        DECLARE cur CURSOR FOR 
        SELECT occupation, hourlySalary FROM salaryInfo WHERE occupation = vTitle;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET endLoop = 1;

        --  Adding values to the declared variables
        SET endLoop = 0;
        SET vSalary = 0;

        --  Opening the cur handler
        OPEN cur;
            salaryInfoLoop : LOOP

                FETCH cur INTO vTitle, vSalary;

                --  IF the value does not exist, leave the loop
                IF endLoop = 1 THEN LEAVE salaryInfoLoop;
                END IF;

            END LOOP;

        IF vTitle IS NOT NULL THEN

            SET vSalary = veStatus * vSalary/100;
            RETURN vSalary;
        END IF;
    END x
/*****************************************************************/

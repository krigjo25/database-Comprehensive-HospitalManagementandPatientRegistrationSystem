
CREATE OR REPLACE FUNCTION checkAvailableRoom (vID SMALLINT) RETURNS TINYINT DETERMINISTIC
    BEGIN

        /************ checkAvailableRoom(vID) ********************'
            Returns an integer to check wheter the room
            is available or not

        *****************************************************************/

        --  Declare variables
        DECLARE vBookedIn DATE;
        DECLARE endLoop TINYINT;
        DECLARE vRoomID SMALLINT;
        DECLARE vCounter SMALLINT;
        DECLARE vRoomName VARCHAR(255);
        DECLARE availableRoom TINYINT;

        --  Declare cursor
        DECLARE cur CURSOR FOR 
            SELECT rID, roomName, bookingInn FROM booking WHERE rID = vID;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET endLoop = 1;

        --  Adding values to the declared variables
        SET endLoop = 0;
        SET availableRoom = 0;

        --  Opening the cur handler
        OPEN cur;
        availableRoomLoop : LOOP
            FETCH cur INTO vRoomID, vRoomName, vbookedIn;

            --  Checking if boooking in is not equal to current date
            --  And roomID is has to be equal to the room number
            IF vbookedIn != CURDATE() OR endLoop = 1 THEN LEAVE availableRoomLoop;

            ELSE SET availableRoom = 1;
            END IF;

        END LOOP;
        CLOSE cur;
        RETURN availableRoom;
    END x
/***************************************************************/
CREATE OR REPLACE FUNCTION generateTableName (vName VARCHAR(255), vssn  VARCHAR(255)) RETURNS VARCHAR(7) NOT DETERMINISTIC
    BEGIN

        /************ generateTableName ********************
            The function Trimming the patientName (threeFirst letters 
            and Three Last letters), vssn(four last digits), 
            and creating a tablename with the
            using SUBSTRING to get a part of the digits,
            using CONCAT to add, '-'.

        *****************************************************************/

        --  Declare variables
        DECLARE tableName VARCHAR(255);

        SET vssn = SUBSTRING(vssn, 5, 4);
        SET vName = SUBSTRING(vName, 1, 3);
        SET tableName = CONCAT(vName, vssn);

    RETURN tableName;

    END x

/*****************************************************************/

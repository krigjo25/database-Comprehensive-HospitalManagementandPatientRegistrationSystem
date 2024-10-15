/*********************'*****************************************

This file contains the views which is used in the project

**************************************************************/

/********************* Rooms view *****************************
DATABASE 
    HospitalManagementSystem
    
**************************************************************/
CREATE OR REPLACE VIEW rooms AS
        SELECT

            firstFloor.roomID AS 'roomID',
            firstFloor.roomName AS 'roomName'

        FROM firstFloor

        UNION ALL

        SELECT

            secondFloor.roomID,
            secondFloor.roomName

        FROM secondFloor

        UNION ALL

        SELECT

            thirdFloor.roomID,
            thirdFloor.roomName

        FROM thirdFloor;
/*********************************************************/

/*********************  view *****************************
DATABASE 
    
    
**************************************************************/
        
/*********************************************************/
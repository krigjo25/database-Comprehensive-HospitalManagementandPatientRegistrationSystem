# Information about diagnosis, alergies and recommended medecine

In the given tables below is a list of deseases, alergies and medecines
Its a dynamic list where the doctor can find given desease, alergy or medecine  to retrieve in other cases such as sickpapers or other documents.

## Alergy table 

| id | alergyID | alergyName | symptoms | mID |
|---	|---	|---	|---	|---	|

|Constraints |
|---	|
| Unique |
| id |
| mID |
| FOREIGN KEY |
| miD |

## Diagnosis table

| id | doc | diagonsisName | symptoms | mID |
|---	|---	|---	|---	|---	|

|Constraints |
|---	|
| Unique |
| id |
| mID |
| FOREIGN KEY |
| miD |

## availableMedecine table
| id | mID | medecineName | symptoms |
|---	|---	|---	|---	|

## procedures

could have use for a procedure to insert new rows to our tabels and edit information.

### Creating a new record in Alergy
*   CALL inertA (alergyID, diagnoseName, medecineID

### Creating a new record in Diagnosis
*   CALL inertD (diagnoseID, diagnoseName, medecineID)

### Creating a new record in Available medecine
* CALL insertM (mID, medecineName, effective against)

----------------------------------------------------------
# Rooms

    -   100 - 199 First Floor 
    -   200 - 299 Second Floor
    -   300 - 399 Third Floor

## Tables

Creating a table which contains how many rooms and floors the<br>
hospital has each floor Table includes

| roomID | roomName |
|--- |--- |
| 100 | Library |
| 101 | Pharamacy |
| 102 | Cafeteria |
| 103 | Emergency Services |
| 104 | Reception |
| 105-115 | Observation Room |
| 111 | Recovery Room |
| 200 | Equipments |
| 201 | Operation Theaters |
| 202 | Ward |

## Procedures

Creating a procedure to assign a name and an ID to a room, and one to modify if there is any changes

### Assign a name and a id to a room
*   CALL firstFloor (vrID, rName);
*   CALL secondFloor (vrID, rName);
*   CALL thirdFloor (vrID, rName);

###   modify room information 
*    CALL modifyFloor (vTable, vColumn, vValue);

## Views

Creating a view to view all floors in one table
---------------------------------------------------------------------------------------------------------------------------------
#  RoomBooking

Creating a table for the hospital staff to book a room for surgery / Ward, during the patient's stay.<br>
We would need another table called operation procedures, where the price for the procedure is listed

## Booking Tables
| bookID | patientID | patientName | roomID | roomName | procedureName | procedureRate |eID | employeeName | Date | timeInn | timeOut | |
|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|--- |--- |--- |--- |

## Procedures

*   A procedure to search for a available room
*   A procedure to book a room
*   A procedure to cancel a room,

###   Searching for available rooms 
CALL searchRoom ()
    
###    Book a room
CALL bookRoom ()

###   Cancel a booking
CALL cancelBook ()
    
## functions

Creating a function to check wheter a room is available or not by using<br>
the roomID, and check after records in the booking table which has the<br>
same date and room. Can also be used to avoid dubble booking of a room.

checkAvailableRoom(roomID);

Returns 1 if the room is available and 0 if its booked
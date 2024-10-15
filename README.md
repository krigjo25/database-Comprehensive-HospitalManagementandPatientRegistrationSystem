# Hospital Manage System

## Table Of Content

[Introduction](#Introduction)......................
    
    developer.....................
    projectInformation...........................
        The design....................
        status..........................

[SQLData](#Databases)..........................

    Archive.......................
        terminatedemployeements.....
        credited................
        paidBillings............

    patientRegistrationsRegistration..........
        patientRegistrationsRegistrations...............
        billings..............

    patientRecords..................
        socialSecurityNumber..


    employeement.................
        employeeRecords.............
        relations.............
        turnus................
        salaryinfo............

    hospitalManageSystem.........
        alergies...............
        diagnosis..............
        availableMedecines.....
        booking.................
        floors..................


    Procedures........................

        patientRegistrationsRegistration.....................
            patientRegistrationsRegistrations...
            billing.............................
            patientRegistrationsRecords........

        employeementment....................
            employeementmentRecord.....
            relations..............
            Turnus.................

        hospitalManagementSystem.....
            alergies...............
            diagnosis..............
            availablemedecines.....

    Functions.........................

        patientRegistrationsRegistration........
            patientRegistrations................
            billing................

        employeements....................
            employeementRecord...............
            relations..............

        hospitalManagementSystem.....

        archive......................

    Triggers......................
        terminatemember...........
        terminatebook.............
            
    Events........................
        delRecords................
        discount..................
    
    Views.........................
    
[Python](#Python).....................

        mariadbPython.py...............
        customFunctions.py
        patientJournal.py.............
        runPDF.py.....................


[PDF](#PDF).......................

    patientjournal.pdf............
    employementSalary.............
    invoice.pdf...................

[Testing](#Testing)...................

        SQL Data......................
    
[Project Summuary](#ProjectSummuary).................

[Responsary](#Responsary).............

[Credentials](#Credentials)...........

    licence...........................
    Contact Information...............

## Introduction

### About the Developer

Kristoffer, born in 94, :flag_no:.
maintaining Python & SQL projects
otherwise just being a human.

### Project info

####    Purpose of the project

The primary goal of this project is to create a comprehensive system that can handle the complex data and processes involved in hospital management. By integrating various functionalities into a single system, it aims to improve efficiency, accuracy, and accessibility of hospital data.

####    Description of the project

The Comprehensive Hospital Management and Patient Registration System is designed to streamline and manage various aspects of hospital operations, including patient records, employee management, billing, and room allocation. This system integrates multiple functionalities to ensure efficient handling of hospital data and processes.


Information about the design can be found in the given links below
includes the text files below,

*   [archive](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/archive.md)
*   [invoice](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/invoice.md)
*   [Journal](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/journal.md)
*   [The Case](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/TheCase.md)
*   [employeements](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/employeement.md)
*   [HospitalManagementSystem](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/hospitalManagementSystem.md)
*   [patientRegistrationsRegistration](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/patientRegistration.md)


#### Status

    project start :<br>
        01.01-22

   Last Update :<br>
        05.04-22

    Finished : <br>
        dd.mm-yy
    
    SQL Database:<br> 
        mariaDB

##  Databases

[patientRegistration](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/patientRegistration/)

    patientRegistrations
        includes the "personal" information about a given patientRegistrations

    patientRecords
        has the tables of the patients, which includes what the patient is 
        doing at the hospital
    
    Billing
        Information about the Invoices for the patient.

[employeements](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/employeements/)

    employeeRecords..................
        includes the information about the Hospital Staff

    relations
        includes the iformation about assignments for doctors

    Turnus
        employee work schedule

    reports
        reports / notes from the doctor

[HospitalManagementSystem](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/HospitalManagementSystem)

    roomBookings..............
        A booking system so the staff has to book a given room

    availableMedicines 
        List of medicines

    allergies
        list of given registered Allergies

    diagnoses
        List of given diagnoses

    First floor
        room number 100 - 199

    Second floor
        room number 200 - 299
            
    Third floor
        room number 300 - 399

[archive](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/archive)

## Procedures

###  patientRegistration

####  patientRegistrations

    #####   add a new record of a patientRegistrations
    CALL newpatient (pName, bDate, vssn, vSex, vPhone, vStreet, vZip,vEmail, vWeight, vHeight, bType, vAlergies, vDoc, vMed);

    #####   Creates a new table in patientsRecords
    CALL newPatientRecord (pName, vssn);
 
    #####   Updates the value for the record
    CALL modifypatient (vColumn,vValue, vID)d;

### employeement

#### employeeRecords

    #####   Add a new record to the table
    CALL newemployee (eName, vDate, vStreet, vEmail, vPhone,veStatus ,vTitle, vDep);

    ##### Updates the information of the employeement  except :x: Date
    CALL modifyemployee (vColumn, vValue, veID);

#### Relations

    #####   Assign a doctor to a patientRegistrations
    CALL newRelation (veID, vpID);

    #####  Delete an assignement manually
    CALL delRelation (veID, vpID);

    #   Modify a relation
    CALL modifyRelation (vColumn, veID, vpID);

#### Turnus

    #####   Assign time for the employeement to be at work
    CALL newTurnus (veID, vDate, vTime, vhrs);

    #####   If the doctor is sick, update the sicDays, and add a comment to the turnus
    CALL sickDays (veID, vInt, vComment);

### HospitalManagementSystem

#### List Of Alergies

    #####   Creates a new record for alergies
    CALL insertA (vID, vName, vSymptoms, medicine ID);

#### Diagnosis

    #####  Creates a new record for Diagnosis
    CALL insertD (vID, vName, vSymptoms, medicine ID);

#### Medecines

    #####  Creates a new record for Medecines
    CALL insertM (vID, vName, vSymptoms, illness);

#### RoomBookings

    #####   Booking a room for the patientRegistrations
    CALL bookRoom (vpID, veID, vrID, vInn);

    #####   Cancellation of a room booking
    CALL delbook (vpID);

    #####   Check if a room is available
    CALL checkRoom (veID, vDate, vTimeInn);

#### Floors

    #####   Creates a new record for the table

    CALL firstFloor('roomName', 10000.00);
    CALL secondFloor('roomName', 10000.00);
    CALL thirdFloor('roomName', 10000.00);

##  Functions

###    employeement

####    Calculate a monthly salary

-   convertPhone(vPhone);
        Converts the digits into Areacode, 

-   calculateSalary(veStatus, vSalary);
        Calculates the salary for the inserted employeement

-   checkRecovery();
        Check if the person is recovered

### patientRegistration

-   generateTableName(vName, vssn)
        Generates a new table in patientRecords

-   convertssn(vssn);
    Converts the digits from the table, and adding "-"

-   convertPhone(vPhone);
    Converts the digits into areacode.

### hospitalManagementSystem 

-   checkAvailableRoom(vID);
    Check wheter a room is available, and returns an integer

## Views

-   Rooms

## Triggers

### patientRegistration

-   triggerPDF
    triggers a new pdf generation when a patientRegistrations has been registered<br>
    in the database

-   terminateBilling
    moves the old billings into a new database based on the billing is<br>
    paid or not.


### employeement

-   terminateemployeement
    trigger a new record, when the delRecords event has been executed.

### hospitalManagementSystem

### archives

##  Events

### patientRegistration

- delRecords
    Deletes records where the patientRegistrations is above 200 years

### employeement

- delRecords
    Deletes records where the employeement has been resigned

-   salaryChanges
        Re calculates the salary every month

### hospitalManagementSystem

-   delRecords
    Delete old bookingrecords

### archives

##  Testing and SQL Data

###  Test Performed in this SQL Project

The values has been manually entered, over time.

* [SQL data for archive](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/archive/SQLdata.sql)
* [SQL data for employeements](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/employeements/SQLdata.sql)
* [SQL data for HospitalManagementSystem](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/HospitalManagementSystem/SQLdata.sql)
* [SQL data for patientRegistrationsRegistration](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/patientRegistrationsRegistration/SQLdata.sql)

##  Python

### The Design

Information about the design can be found in the given links below
includes the text files below,

*   [pyLib](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/pylib/)
*   [invoice](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/invoice.md)
*   [Journal](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/journal.md)



### customFunctions.py


-   Created to easly maintain postal codes
-   This uploads blob files to the database


###  patientjournal.py

-   Creates a pdf file with values from the database.

### databasePython.py

-   Connects the scripts to the database.

### runPDF.py

-   Runs the scripts

##  PDF

### The patient's journal

The patient's invoice file name :<br>
3 first letters in the firstName<br>
3 first letters in the lastName<br>
4 last digits in the social security<br>

The patient's journal includes information about the patient, and what has been done.

### the patient's invoice

The patient's invoice file name :<br>
3 first letters in the firstName<br>
3 first letters in the lastName<br>
4 last digits in the social security.

Its a simple invoice for the patient,
during the patient's stay at the hospital


### Salary.pdf 

A simple salary for the employeement

##  ProjectSummuary

* In the world of programming, there is always room for cleaning, 
the common choose were to devide the different methods in classes, 
and devide them into each python file, so there would be less mess 
in the code. Deviding lists, static and Dynamical tables, in different
files, to make the code more readable for others.


*  While designing the Database, the need for a better text reading 
software, than using plaint text were a need PDF were choosen as the
file format for the text files, the information from the database had
to be extracted to the PDF from the database, by using reportLab's Library,
 it could be achived. The way to store the information in the database,
could be a more challange as database only read bytes, not words, so by
using 'BLOB' the file could be saved in the database.

*  The experience by using  the foreign key, which where experienced,
to avoid the foreign key issue 150, there has to be only one Primary key,
but there can be multiply usage of the other keys suggested soulution is
to  Choose a different key for the foreignKey. The choice were to  use 
unique insted of Primary Key. For the row ID is the Primary targeting to 
retieve information.

*   Kriss had a slightly challange to merge all the floors into one table,
The thought were to create a new table, with foreign key, but it wouldnt work, 
as the assumption about foreign keys can not refer to more than one table the b
etter soloution were to create a view for this matter.

*   Since the database is growing, there would be a need for new databases to keep the records as easy to maintain as possible, A database for Archives, patientRegistrationsRegistration, and employeements
one database for employeements and stuff for the employeements, one for the administration, misc, and one for the patientRegistrationsRegistration 


## Credits

### Database Plugins

### Python Responsories


* mariadb, - [MariaDB Community](https://github.com/MariaDB)
* Python-dotenv, - [Saurabh Kumar](https://github.com/skwebdeveloper)
* reportlab, - [Andy Robinson, Robin Becker, the ReportLab team and the community](https://reportlab.com)

### Contact Information

-   Discord : krigjo25#5588
-   messenger : krigjo25

Author notes<br>
« Everything is perfect at all times. »

###  Licence


This project is just an Open-Source licence.

Sincerely, 
@krigjo25
#Employee




Employee related information has a own database, to manage the databases easier


We would like to have a static table where values such as salary and titles are<br>
the main table employee consist of personal and work related information<br>

##Table

| eID | EmployeeName | birthDate | street | zipCode | email | Phone | eStatus | occupation | hourlyRate | department | hired |
|--- |--- |--- |---	|--- |--- |--- |---	|--- |--- |--- |---	|

 Constraints |
|---	|
| Unique |
| employeeID |

##Procedures

Would be a great idea to a have a procedure to register and modify employee information

###   Create a new record of employees

CALL newEmployee(eName, vDate, vStreet, vEmail, vPhone, veStatus, IN vTitle, vDep)

###   Modify employee Information
CALL modifyEmployee (vColumn, vValue, veID,)


##Events

An event to archive terminated employees upon deletion from the database

##Triggers

trigger a new record in another database when the employee has been deleted

-------------------------------------------------------------------------------------------------

#   Employee - Patient Relation table

Creating a list of patients which is assigned to doctors, <br>
will make the it easier to remember which patient the doctor has.

##relation table


| id | pID | patientName | eID | employeeName |
|--- |--- |--- |--- |--- |

| Constraints | Comment |
|--- |--- |
| Unique | CONSTRAINT | 
| pID |  The patient has to be registered and only one Primary doctor each patient|
| | |
| INDEX | KEY |
| eID | The doctor can be assigned to multiple patients |
| employeeName | Doctors can have the same name |
| patientName | Patients can have the same name |
| | |
| PRIMARY KEY| KEY |
| id | Row Counter ||

##Procedures

The table would need couple of procedures to assign, patients to doctors.

###   Assigning new patient to a doctor
-   CALL newRelation(eID, pID);

###   MODIFY the Doctor assignment
-   CALL modifyRelation(vcolumn, veID, vpID);

##Events

Creating an event to terminate a relation when the<br>
patient has been recovered. So the doctor can get new assignments<br>
patients if limit is reached.

-----------------------------------------------------------------------------------------------

# Turnus

a table called turnus to generate a turnus for the doctors, it selects necsessary information<br>
from the employees table.

The table generates a turnus for 3 months at the time, 

## Turnus table
| eID| eName | dato | timeInn | out | hrs | min | sickDays |
|--- |--- |--- |--- |--- |--- |--- |--- |

## Procedures

for this table i would need a procedure to create the Turnus and manage the sickDays

###   Add a new Turnus

-   CALL newTurnus(veID, vDate, vTimeInn, hh, mm, vai);

###   Decrease sickDays ammount

-   CALL sickDays(veID);

## Events
An event to give back sickDays whenever it has passed one year.

----------------------------------------------------------------------------------------------------

# salaryInformation

a table to store necsessary information about occupation and salary for the occupation

## salaryInformation table
| id | occupation | yearlySalary | monthlySalary | hourlySalary |
|---	|---	|---	|---	|---	|

## Procedures

For this table i would need a procedure to add a new occupation, add a yearly Salary.<br>
The procedure has to calculate monthly Salary and hourly Salary.

I would need one procedure to edit the yearlySalary, and recalculate the monthly salary<br>
and hourly Salary

###   Add a new occupation into the list

CALL newOccupation(vTitle, yearlySalary);

###   modify the yearlySalary
CALL modifyOccupation(vID, yearlySalary);

## Events
* An event to re calculate a salary, updating necsessary information .
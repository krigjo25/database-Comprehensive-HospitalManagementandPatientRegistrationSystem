# Patient Table

The patient table, should include necsessary information, for the assigned Doctor<br>
to do the necsessary treatment for the patient. Would like to have the patient details<br>
in a own Database, for easier maintance.

## Patient Information**

Information which is needed from the patient incldes some general information<br>
the patient's health, and proffesion.

| pID | patientName | ssn | gender | mobile| street | zipCode | companyName | industry | BodyWeight | bodyHeight | bodyMassIndex | bloodType | DiseaseID | alergyID | medecineID | dateIn | dateOut |
|--- |--- |--- |---	|--- |--- |--- |---	|--- |--- |---	|--- |--- |--- |---	|--- |--- |--- |

 Constraints |
|---	|
| Unique |
| patientID |
| patientName |
| |
| FOREIGN KEY |
| medecine |
| diagnosisCode |
| alergies |
| medecine |

##  Procedures

###  Register a new patient to the database
- CALL newPatient()

###  Modify patient information
- CALL modifyPatient()

###    Create a new record in patientInfo

-   Call newTable();

##  Functions

*   Convert ssn digits
*   Convert phone digits
*   [s]Calculate the BMI of a patient[/s] - The bmi gets calculated in the python code
-   generateTable(vName, vssn)

##  Events

*   When the patient is registered in the database, generate a PDF document
*   When the patient information gets updaed, the PDF regenerates

##  Trigger

When the patient gets registered for the first time in the<br>
database. Create a PDF containing the personal info, alergies, diagnosis<br>
( where the recommended treatments get fetched from the database)

##  Python Code
Goto [PatientJournal.md]()

        

# Billing system

This system can fetch fetch necsessary columns from the different tables, in order to calculate the bill,<br> 
then create an invoice for the patient.

The invoice fetches

*   Visited rooms, procedures done any extra treatments


##  BillingSystem Table

| patientID | invoiceID | incTax | reminder | overdue |
|--- |--- |--- |--- |--- |--- |

### Procedures

####  Insert necsessary values to create the pdf file
-    CALL newBilling (vpID)                 

####  Updates the values, if wrongly added
    CALL updateBilling (vColumn, vpID)

### Triggers

After the overdue, trigger a record into credited table<br>
else trigger a record  into paidBillings table

### Events

*   When the first overdue has passed on the invoice, trigger a new overdue, add a fine.
*   When the patient has been recovered trigger a pdf creation 

### PythonCode

Goto [Invoice.md]() 
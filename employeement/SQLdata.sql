/****************************** SalaryInfo ******************************/
CALL newSalary ('Pulmonologists', 333000.00);
CALL newSalary ('Radiologist', 350000.00);
CALL newSalary ('Immunologist', 393466.00);
CALL newSalary ('Anesthesiologists', 404000.00);
CALL newSalary ('Cardiologist', 252151.00);

CALL newSalary ('Critical Care Medecine Specialist', 366000.00);
CALL newSalary ('Dermatologist', 359000.00);
CALL newSalary ('Endocrinologist', 237500.00);
CALL newSalary ('General Surgeon', 373000.00);
CALL newSalary ('Certified Nurse Practisioner', 61220.56 );
/************************************************************************/

/************************************* employees ************************/

-- CALL newEmployee (Name, date, street, zip, email, phone, mobile, eStatus, occupation, department)
CALL newEmployee ('Ryan R. Orr', '1982-02-22', '662 Smith Street', 01545, 'alfredo2011@hotmail.com', '5088410971', 100,'Critical Care Medecine Specialist', 'ICU', @Error);
CALL newEmployee ('Jon George', '1994-01-01', '118 Cerullo Road', 20001, 'billie.deck@hotmail.com', '406925436', 50,'Critical Care Medecine Specialist', 'ICU', @Error);
CALL newEmployee ('Yollanda K. Lambardi', '1995-07-28', '2390 Russel Street', 01468, 'hoyt1978@gmail.com', '9789390913', 100,'Critical Care Medecine Specialist', 'ICU', @Error);
CALL newEmployee ('Eric E. West', '1975-07-23', '1164 Prospect Street', 08014, 'carli.barte@hotmail.com', '8567362941', 75,'Critical Care Medecine Specialist', 'ICU', @Error);

CALL newEmployee ('Brian A Benites', '1984-01-25', '2501 Woodland Terrace', 95630, 'allan2000@gmail.com','9169349710', 100,'General Surgeon', '', @Error);
CALL newEmpoyee ('Michele R. Dejesus', '1969-06-12', '1698 Wescam Street', 89501, 'rasheed_wiega@gmail.com', '7758981143', 100,'General Surgeon', 'ICU', @Error);

CALL newEmployee ('Sabrina R. McMahon', '1997-05-12', '4210 Norma Avenue', 75925, 'sabrmc@gmail.com', '830-890-3860', 50,'Radiologist', 'X-rayRoom', @Error);
CALL newEmployee ('Christopher S. Howard', '1974-03-30', '118 Cerullo Road', 84119, 'lilana_bart@yahoo.com', '4355146733', 50,'Radiologist', 'x-rayRoom', @Error);

CALL newEmployee ('Roberto E. Marshall', '1953-05-05', '1068 Center Street', 93721, 'mariana_gay@gmail.com', '5592073271', 60,'Cardiologist', '---', @Error);
CALL newEmployee ('Dennis M. Perez', '2000-12-25', '1550 Patterson Street', 77002, 'javonte2012@hotmail.com', '7132762437', 60,'Cardiologist', 'ICU', @Error);

CALL newEmployee ('Cathrine T.Beyer', '1999-02-25', '657 Tibbs Avenue', 20001, '657 Tibbs Avenue', '406-689-5023', 75,'Pulmonologists', 'ICU', @Error);
CALL newEmployee ('Cathrine J. Levis', '1994-01-01', '2890 Chandler Hollow Road', 15106, 'kelsie.greenho@hotmail.com', '412-429-1997', 50,'Immunologist', 'ICU', @Error);
CALL newEmployee ('Carolyn R Elliott', '1988-02-03', '1673 Lang Avenue', 84734, 'Kaley.bartolet@yahoo.com', '435-788-1852', 75,'Anesthesiologists', 'ICU', @Error);

CALL newEmployee ('Donald M. Woodfin', '1994-01-01', '118 Cerullo Road', 20001, 'neoma_kemme10@yahoo.com', '646-744-8588', 25,'Certified Nurse Practision', 'ICU', @Error);
CALL newEmployee ('Melissa S Burtoon', '1991-02-14', '48843 Southside Lane', 90017, 'lissa91@gmail.com', '323-657-6683', 80,'Certified Nurse Practision', 'ICU', @Error);
CALL newEmployee ('Lisa P. Fuller', '1981-06-25', '3411 Glory Road', 37110, 'lispfu@yahoo.com', '931-934-0140', 25,'Certified Nurse Practision', 'ICU', @Error);
CALL newEmployee ('Gregory M. Flood', '1980-12-24', '1921 Reel Avenue', 88061, 'alfredo2011@hotmail.com', '505-388-7136', 100,'Certified Nurse Practision', 'ICU', @Error);

CALL newEmployee ('Brian M Howell', '1976-06-04', '2645 Foley Street', 33442, 'jake.lind1973@yahoo.com', '9546991607', 100,'Surgeon', 'ICU', @Error);
CALL newEmployee ('Loida G Newton', '1972-08-18', '552 Horizon Circle', 98119, 'barton2000@hotmail.com', '2536855251', 100,'Surgeon', 'ICU', @Error);
CALL newEmployee ('Julia A. Hanson', '1994-01-01', '118 Cerullo Road', 20001, 'frida2015@gmail.com', '9122491720', 100,'Surgeon', 'ICU', @Error);
/************************************************************************/

/************************************* relations ************************/

--  CALL newRelation (veID, vpID, @vError);
CALL newRelation (1000, 1000, @vError);

--  CALL modifyRelation (modifyRelation( 'vColumn', veID, vpID, 'vValue', @conmsg)
/************************************************************************/
/************************************* Turnus ************************/

--  CALL newTurnus (veID, vDate, vTimeInn, vhrs, vMin, vai) 0 - 2
CALL newTurnus (1000, '2022.05.04', '08:00:00', 8, 0, 0);
/************************************************************************/

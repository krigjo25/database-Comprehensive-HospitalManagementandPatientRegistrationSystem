/************************************* Patient Table ************************/
                            /**
                                When a new patient gets registered, the
                                procedure `newPatientTable` Is called
                            **/
    CALL newPatient ('Aaron C. Crowder', '1960-09-07', '624492945', 'M', '7147672206', '178 Alpaca Way', 91505 , 103.6, 178,'O-');
    CALL newPatient ('Benjamin Z. Krieger' , '1970-05-19' , '024078901', 'M' , '7813863968', '2586 Romano Street', 02154 , 75.7, 176,'B+');
    CALL newPatient ('Donald H. Reed' , '1983-02-25' , '217696608', 'M', '2404653677', '747 Pine Tree Lane', 20191 , 108.1, 165,'A-');
    --CALL newPatient ('Geraldine J. Egerton' , '2000-11-02' , '171014356', 'F', '7243752103', '3426 Stuart Street', 15001 , 73.39, 162,'A+');
    CALL newPatient ('Rober L. Cooper', '1980-02-11', '635626170', 'M', '9565510901', '3681 Seth Street', 76901 , 108, 185,'B+');
    CALL newPatient ('Ivan S. Miller' , '1988-04-15' , '253462254', 'M' , '6787085679', '900 Kuhl Avenue', 30329 , 91.9, 176,'O+');
    CALL newPatient ('Jose J. Zuniga' , '1991-06-26' , '619927888', 'M' , '5627533058', '2828 Kerry Way', 90808 , 70.3, 187,'AB');
    CALL newPatient ('Joseph A. Mauldin' , '1975-06-07' , '426279252', 'M', '6017868837', '1484 School House Road', 39069 , 76.0, 168,'O+');
    CALL newPatient ('Judy R. Daniel' , '1996-08-17' , '208036728', 'F', '4127279908', '3077 Losh Lane', 1519 , 69.5, 170,'O+');
    CALL newPatient ('Kathryn M. Laird' , '1981-09-07' , '232268551', 'F', '3042763051', '1844 Froe Street', 26505 , 80.56, 168,'B+');
    CALL newPatient ('Keith N. Brown' , '1986-11-11' , '689035234', 'M' , '7043133213', '4287 Red Dog Road', 28273 , 110.7, 186,'B-');
    CALL newPatient ('Kevin L. Planas' , '1985-11-28' , '428950341', 'M' , '6016610065', '2986 Walnut Street', 39180 , 84.4, 169,'O+');
    CALL newPatient ('Mabelle R. Williams' , '1971-12-24' , '7684288873', 'F' , '4072392175', '3794 Barnes Street', 34746 , 83.19, 173,'A+',);
    CALL newPatient ('Majorie R. Cummings', '1992-06-24', '316026733', 'F', '5743042963', '2370 Villa Drive', 46625 , 52.21, 168,'A+');
    CALL newPatient ('Maria A. Acheson' , '1951-03-12' , '260410526', 'F' , '4043805030', '4949 College Street', 30071 , 65.77, 164,'O-');
    CALL newPatient ('Nicolas E. Abston' , '1983-06-06' , '023389720', 'M', '8646158470', '179 Pooh Bear Lane', 29673 , 47.3, 187,'A+');
    CALL newPatient ('Tammy F. Dudley', '1989-02-25' , '136768137', 'M', '7329755329', '3687 Mahlon Street', 07733 , 59.28, 154,'O+');
    CALL newPatient ('Tina L. Abernathy' , '1978-06-07' , '665013723', 'M' , '2255358538', '2874 Eva Pearl Street', 70802 , 64.27, 170,'AB');
    CALL newPatient ('Steven A. Crawford' , '1980-10-25' , '260574702', 'M' , '6785465620', '1472 Hanifan Lane', 30518 , 84.0, 168,'A+');

/************************************* Modifying Patients ************************/
    -- CALL modifyPatient('vColumn, vValue, vID)

    --  Alergies
    CALL modifyPatient ('alergyID', 'GA04A', 100);

    --  Diagnosis
    CALL modifyPatient ('diagnoseID', 'GA04A', 100);

    --  Medecines

/*****************************************************************************/
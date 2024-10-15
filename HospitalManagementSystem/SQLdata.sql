DELIMITER ;

/********************************** Rooms ************************************/

--  CALL firstFloor ('RoomName'); 
CALL firstFloor ('Reception');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Labratory');
CALL firstFloor ('Nursery clinic');
CALL firstFloor ('EmergencyRoom');
CALL firstFloor ('Storage');
CALL firstFloor('Observation Room');

--  CALL secondFloor ('RoomName');
CALL secondFloor ('Surgery Room');
CALL secondFloor ('Surgery Room 2');
CALL secondFloor ('x-Ray Room');
CALL secondFloor ('Laser Room');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Nursery');

--  CALL thirdFloor ('RoomName');
CALL thirdFloor ('Mobile Rehabilitation');
CALL thirdFloor ('Rheumatology and skin');
CALL thirdFloor ('Physical medicine and rehabilitation');
CALL thirdFloor ('Clinical support functions');
CALL thirdFloor ('Cancer treatment and palliation');
CALL thirdFloor ('Radiation therapy');
CALL thirdFloor ('Medical oncology');
CALL thirdFloor ('Ward');
CALL thirdFloor ('Ward');
CALL thirdFloor ('Ward');

/************************************************************************/

/********************************** operationProcedures ************************************/
--  CALL delProcedure (vID);
--  CALL modifyProcedure (vID, vRate);
--  CALL operationProcedure ( 'ProcedureName', time);


CALL operationProcedure('Ward', 70.00, '01:00');
CALL operationProcedure('MRI', 1000.00, '01:30');
CALL operationProcedure('X-Ray', 3579.90, '00:45');
CALL operationProcedure('CT-Scan', 3275.00, '01:00');
CALL operationProcedure('Consulation', 55.78, '00:45');
CALL operationProcedure('C-Section', 25300.00, '01:20');
CALL operationProcedure('Upper Endoscopy', 1750, '01:00');
CALL operationProcedure('Appendectomy',33000.00, '01:30');
CALL operationProcedure('Echocardiogram', 2000.00, '01:30');
CALL operationProcedure('Cancer treatment', 1350.00, '00:30');
CALL operationProcedure('Palletation Care', 1350.00, '01:00');
CALL operationProcedure('Cataract Surgery', 2500.00, '00:50');
CALL operationProcedure('Radiation Therapy', 12500.00, '00:20');
CALL operationProcedure('Heart Bypass Surgery', 100000.00, '5:30');
CALL operationProcedure('Hip Replacement Surgery', 35000.00, '02:30');

/*******************************************************************/

/********************************** Alergies Procedures ************************************/
--  CALL insertA (vID, vName, vSymptoms, mID);
--  CALL insertD (vID, vName, vSymptoms, mID);
--  CALL insertM (mID, vName, vIllness);

CALL insertM ('NNNNM', 'DEFAULT', 'DEFAULT');
CALL insertM ('NS32M', 'nose spray', 'testser');
CALL insertM ('AS12M', 'Inhalator', 'Astma');
CALL insertM ('NS32M', 'nose spray', 'testser');

CALL insertA ('GA04A', 'GrasAlergy', 'renne nese, hossting', 'NS32M');
CALL insertA ('AS00A', 'Astma', 'Hosting ved høyintesitet', 'AS12M');
CALL insertA ('NNNNA', 'DEFAULT', 'DEFAULT');

CALL insertD ('NNNND', 'DEFAULT', 'DEFAULT');
CALL insertD ('DT12D', 'Diabetes Type 1', 'DEFAULT');
CALL insertD ('DT13D', 'Diabetes Type 2', 'DEFAULT');


/*******************************************************************/

/********************************** Diagnosis Procedures ************************************/
--  CALL insertA (vID, vName, vSymptoms, mID);

/*******************************************************************/

/********************************** Medecine Procedures ************************************/
--  CALL insertA (vID, vName, vSymptoms, mID);

/*******************************************************************/

/********************************** Bookings ************************************/

--  CALL delBook (vpID);
--  CALL searchRoom (vID, @ErrorMsg);
--  CALL bookRoom (vpID, veID, vID, vOid, '00:00');

CALL searchRoom(101, @ErrorMsg); -- Working only directly in the database
CALL roomBooking (100, 210, 6, 0, @msg);

/*******************************************************************/

#   Python responsories
from os import getenv
from datetime import datetime, date

from pylib.databasePython import MariaDB


#   dotenv Responsories
from dotenv import load_dotenv


load_dotenv()


class Calculators():

    '''         Calculators     

        Calculate age
            Calculate a age type : yyyy-dd-mm
        
        Calculate bmi :
            Calculates the bmi
    '''

    def __init__(self):
        #   Initializing the classes

        pass

    def CalculateAge(self, birthDate):

        '''         calculateAge     
        
            Calculates the age difference between the current
            date and the given date

            The leap year is added 

        '''

        #   Converting the date into a string, then back to a date
        birthDate = str(birthDate)
        birthDate = datetime.strptime(birthDate, '%Y-%d-%m').date()

        #   Get the today's date
        curDate = date.today()

        #   Calculate the difference in years
        difference = curDate.year - birthDate.year  

        #   
        oneOrZero = ((curDate.month, curDate.day) < (birthDate.month, birthDate.day))

        #   Age equals the difference - one or zero
        age = difference - oneOrZero

        return age

    def Calculatebmi(self, kg, cm, age, gender):

        '''         calculatebmi
        
            Calculates bmi for adults and children

            Childrens 2-20
            kg / (m * m) * 10000

            Adults 20+
            kg / (m * m)


        '''

        #   Convert the height in meters
        m = cm / 100

        # Converts the weight into a integer
        kg = int(kg)

        #   Finds the bmi by dividing  with age and gender
        if age < 21 and gender == 'M':
            
            bmi = kg / (m * m) * 10000

        elif age < 21 and gender == 'F':

            bmi = kg / (m * m) * 10000

        elif age > 20 and gender =='F':
            bmi = kg / (m * m)
        else:
            #   Else we assume its a Male, above 20
            bmi = kg / (m * m)

        bmi = round(bmi, 2)

        # Checking the body's condition
        #   Checking if the bmi is below 18.5
        if bmi < 18.5:
            bmi = f'{bmi}, UW'

        #   Checking if the bmi is equal to 18.5 or above
        elif bmi == 18.5 and bmi < 25.1:
            bmi = f'{bmi}, N' # Normal

        #   Checking if the bmi is equal 25.0 or above 18.5
        elif bmi > 25.0 and bmi < 30.0:
            bmi = f'{bmi}, OW'
            
        #   Checking if the bmi is equal 25.0 or above 18.5
        elif bmi > 30.0:
            bmi = f'{bmi}, Obese'

        return bmi

class Converters():

    '''         Converters   

        TrimValues
            Trimming valuesCalculate a age type : yyyy-dd-mm

    '''

    def __init__(self):
        #   Initializing the classes

        pass

    def TrimValue(self, kwarg, kwargs):

        kwarg = str(kwarg[0:3])

        kwargs = str(kwargs).replace("-", "")
        kwargs = str(kwargs[5:9])

        result = kwarg + kwargs

        return result

class Dictionaries():

    def __init__(self):
        pass



    def AmericanPostalCodes(postalCode):

        '''         AmericanPostalCodes

            In life there would be an api for this
            so we leave it as an demostration.
            
            AmericanPostalCodes, lists of given 
            postalcodes in america.
        '''

        #   Creating a list to walk through
        zipCode = {
                    0000:'Warshington',
        }
        
        postalCode = zipCode.get(postalCode)
        return postalCode

class UploadFile():
    def __init__(self):

        self.dc = MariaDB
        self.database = database = getenv('database2')

    def BinaryConverter(self, fName):

        #   Converting data to binary format
        with open(fName, 'rb') as file:
            binaryData = file.read()
            
        return binaryData

    def generateBlob(self, query, photo):

        file = self.BinaryConverter(photo)
        bioData = self.BinaryConverter(photo, file)
        
        
        
        #   Converting information into tuple
        query = query, photo
        self.dc.updateTable(self.database, query)

        return bioData

    def generatePDF(self, pdf, path):

        #   Update a column
        query = f' UPDATE patient SET pdf = "{pdf}" WHERE id = 100'
        bioData =self.generateBlob(query, pdf)

        return print(bioData)



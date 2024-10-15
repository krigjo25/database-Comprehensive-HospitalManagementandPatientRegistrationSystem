#   Python Responsories
from os import getenv
from dotenv import load_dotenv


#   Library responsories
from pylib.databasePython import MariaDB
from pylib.patientJournal import PDFCanvas
from pylib.customFunctions import UploadFile, Converters

load_dotenv()

def PDFSetup():
 
    x = 0

    #   Classes initialization
    dc = MariaDB()
    con = Converters()

    #   Database Initialization
    database = getenv('database2')
    query = f'SHOW TABLES;'

    sqlData = dc.selectFromTable(database, query)

    query = f'SELECT * FROM {sqlData[x][0]}'
    sqlData = dc.selectFromTable(database, query)
    counter = dc.RowCount(database, query)

    #   Converting the sqlData into appropiatename
    while x < counter:

        #   Converting the sqlData into appropiate name

        sqlData = con.TrimValue(sqlData[x][1], sqlData[x][3])

        #   Initializing classes
        c = PDFCanvas(filename = sqlData)
        u = UploadFile()

        #   Creating the PDF

        #   information about the patient
        c.FirstPage()

        #   information about the visits
        c.SecondaryPage()

        #   Save the canvas document
        c.save()

        x += 1

    #   Uploading the pdf file
    #u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournals/patientJournal.pdf')#, f'{pid[0]}')
    

if __name__ == '__main__':
    PDFSetup()
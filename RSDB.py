import pyodbc
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px
import plotly.graph_objects as go
import plotly.figure_factory as ff
import math
import statsmodels.api as sm
from patsy import dmatrices

# Connect to the database

server = 'tcp:mcruebs04.isad.isadroot.ex.ac.uk' 
database = 'BEMM459_GroupP'
username = 'GroupP' 
password = 'YypE493+Lq'

cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password+';TrustServerCertificate=yes;Encrypt=no;')
cursor = cnxn.cursor()

####################################################################################################################

## 1 Check seats availability 

cursor.execute("SELECT SUM(NumRows * SeatsPerRow) AS TotalSeats,"
                " StadiumName FROM Section GROUP BY StadiumName")
rows = cursor.fetchall()
rows

capacity = pd.DataFrame(rows)
capacity['TotalSeats'], capacity['StadiumName'] = zip(*rows)
capacity.drop(columns =[0], inplace = True)
capacity

cursor.execute(" SELECT e.Event_name, e.StadiumName, "
                "COUNT(t.Event_name) AS TotalTicketAmount FROM Event e "
                "JOIN Ticket t ON e.Event_name = t.Event_name "
                "GROUP BY e.Event_name, e.StadiumName")
rows = cursor.fetchall()
rows

TicketID_of_game = pd.DataFrame(rows)
TicketID_of_game['Event_name'], TicketID_of_game['StadiumName'], TicketID_of_game['TotalTicketAmount'] = zip(*rows)
TicketID_of_game.drop(columns =[0], inplace = True)



# Merge capacity["TotalSeats"] by StadiumName in TicketID_of_game
TicketID_of_game = pd.merge(TicketID_of_game, capacity[["StadiumName", "TotalSeats"]], on="StadiumName", how="left")

# Result on SeatAvailability
TicketID_of_game['availability'] = TicketID_of_game['TotalSeats'] - TicketID_of_game['TotalTicketAmount']
TicketID_of_game

#################################################################################################

# Update AvailableSeats in Event table based on availability

cursor.execute(" ALTER TABLE Event ADD AvailableSeats INT CHECK (AvailableSeats >=0);")
cnxn.commit()


for i, row in TicketID_of_game.iterrows():
    cursor.execute(f"UPDATE Event SET AvailableSeats = {row['availability']} WHERE Event_name = '{row['Event_name']}'")
    
# Commit the changes
cnxn.commit()

cursor.execute("SELECT AvailableSeats FROM Event")
rows = cursor.fetchall()
rows

#################################################################################################

print(TicketID_of_game)

#####################################################################################################################################

# Create stack bar chart to display stadium availability

TicketID_of_game.sort_values('TotalSeats', ascending=False, inplace = True)
fig = px.bar(TicketID_of_game, 
            y="Event_name", 
            x=[ 'TotalTicketAmount', 'TotalSeats'], 
            orientation= 'h', 
            title='Stadium Availability',
            labels={'value': 'Number of Tickets', 'variable': ' ', 'Event_name': 'Event Name'},
            template='simple_white'
             )
fig.update_layout(
    title={
        'text': 'Stadium Availability',
        'y': 0.95,
        'x': 0.5,
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 50
        }
    }
)
fig.show()

#####################################################################################################################################

# 2 view price in each event

cursor.execute("SELECT Event_name, TicketPrice FROM Event")
rows = cursor.fetchall()

game_price = pd.DataFrame(rows)
game_price['Event_name'], game_price['TicketPrice'] = zip(*rows)
game_price.drop(columns =[0], inplace = True)
game_price


#################################################################################################
# Calculate Total Revenue per Game

cursor.execute("SELECT t.Event_name, SUM(e.TicketPrice * total_tickets) AS TotalPaymentAmount "
"FROM ("
  "SELECT Event_name, COUNT(TicketID) AS total_tickets "
  "FROM Ticket "
  "GROUP BY Event_name"
") t "
"JOIN Event e ON t.Event_name = e.Event_name "
"   GROUP BY t.Event_name")

rows = cursor.fetchall()
rows

total_payment_amount = pd.DataFrame(rows)
total_payment_amount['Event_name'], total_payment_amount['TotalPaymentAmount'] = zip(*rows)
total_payment_amount.drop(columns =[0], inplace = True)
total_payment_amount.sort_values('TotalPaymentAmount', ascending=False, inplace = True)
total_payment_amount




fig = px.bar(total_payment_amount, 
            x= 'TotalPaymentAmount', 
            y= 'Event_name', 
            color='Event_name', 
            orientation='h', 
            title='Total Revenue per Game',
            labels={'TotalPaymentAmount': 'Total Payment Amount', 'Event_name': 'Event Name'},
            template='simple_white'
                )
fig.update_layout(title={
        'text': 'Total Revenue per Game',
        'y': 0.95,
        'x': 0.5,
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 24
        }
    }
)
fig.show()  

#####################################################################################################################################

## 3 Update TotalPaymentAmount in "Invoice" Database

cursor.execute("SELECT * FROM Invoice")
rows = cursor.fetchone()
rows

######################################################################################################

cursor.execute("SELECT Ticket.InvoiceID, SUM(Event.TicketPrice) AS TotalPrice "
                "FROM Ticket "
                "INNER JOIN Event ON Ticket.Event_name = Event.Event_name "
                "GROUP BY Ticket.InvoiceID")
rows = cursor.fetchall()
rows
Total_price = pd.DataFrame(rows)
Total_price

Total_price['InvoiceID'], Total_price['TotalPayment'] = zip(*rows)
Total_price.drop(columns = [0], inplace = True)
Total_price


cursor.execute(" ALTER TABLE Invoice ADD TotalPaymentAmount INT CHECK (TotalPaymentAmount >=0);")
cnxn.commit()

for i, row in Total_price.iterrows():
    cursor.execute(f"UPDATE Invoice SET TotalPaymentAmount = {row['TotalPayment']} WHERE InvoiceID = '{row['InvoiceID']}'")
    
# Commit the changes
cnxn.commit()

##########################################################################################

cursor.execute("SELECT * FROM Invoice")
rows = cursor.fetchone()
rows
#####################################################################################################################################

# 4 DELETE and READ data

cursor.execute("SELECT SectionName FROM Section")
rows = cursor.fetchall()
rows

cursor.execute("DELETE FROM Section WHERE SectionName = 'TP'")

# Commit the changes
cnxn.commit()

cursor.execute("SELECT SectionName FROM Section")
rows = cursor.fetchall()
rows

######################


cursor.execute("INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('TP', 11, 2, 'Marble Centre')")
cnxn.commit()

cursor.execute("SELECT SectionName FROM Section")
rows = cursor.fetchall()
rows
#######################################################################################################


# Linear Regression

cursor.execute("SELECT Customer.CustomerID, Customer.FirstName, Customer.LastName, Customer.Sex, Customer.Age, Customer.Income, Customer.Education, Customer.MaritalStatus, COUNT(Ticket.TicketID) as TicketsBought FROM Customer JOIN Invoice ON Customer.CustomerID = Invoice.CustomerID JOIN Ticket ON Invoice.InvoiceID = Ticket.InvoiceID GROUP BY Customer.CustomerID, Customer.FirstName, Customer.LastName, Customer.Sex, Customer.Age, Customer.Income, Customer.Education, Customer.MaritalStatus")
rows = cursor.fetchall()

regression = pd.DataFrame(rows)
regression
regression['CustomerID'], regression['First_name'], regression['LastName'], regression["sex"], regression["Age"], regression["Income"], regression["Education"], regression["MaritalStatus"], regression["TicketsBought"] = zip(*rows)


regression.drop(columns =[0], inplace = True)
regression

y, X = dmatrices('TicketsBought ~ sex + Age + Income + Education + MaritalStatus', 
                data = regression,
                return_type = 'dataframe')

model = sm.OLS(y, X)
result = model.fit()

result.summary()

########################################################################################################

# ## correlation heatmap

corr = regression.corr()
sns.heatmap(corr)
plt.show()

############################################################################################################
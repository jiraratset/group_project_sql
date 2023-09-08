import pandas as pd
import plotly_express as px
import matplotlib.pyplot as plt
import pymongo

mongoClient = pymongo.MongoClient('mongodb://PTuchinda:PvtQ614%2BTt@mcruebs04.ex.ac.uk:27017/?authSource=BEMM459_PTUCHINDA&authMechanism=SCRAM-SHA-256&readPreference=primary&ssl=false&directConnection=true')

print('These are the database names that your connection can see')
print(mongoClient.list_database_names())

myDB = mongoClient["BEMM459_PTUCHINDA"]

print('These are the collections inside the database')

###########################################################################################


Customer_Colection = myDB["Customer"]



survey =[ {    "First_Name": "Donnell",    "Last_Name": "Breitenberg",    "favorite_sport": ["Football", "Basketball", "Tennis"],
    "favorite_sport_team": "Liverpool",
    "favorite_position": ["forward", "center-back"],
    "how_many_time_play": [{"Football": 3}, {"Basketball": 2}, {"Tennis": 1}],
    "social_media": {
      "platform": "Twitter",''
      "username": "pinyok123",
      "post_text": "Just watched the Liverpool game and what a match! #YNWA #LFC Liverpool 3-2 Man City",
      "sentiment_score": 0.8,
      "engagement": {
        "likes": 10,
        "retweets": 3
      }
    }
},
{ 
    "First_Name": "Jerad",
    "Last_Name": "Prohaska",
    "favorite_sport": ["Soccer", "Basketball"],
    "favorite_sport_team": "Barcelona",
    "favorite_position": ["Forward"],
    "how_many_time_play": [{"Soccer": 5}, {"Basketball": 2}],
    "social_media": {
      "platform": "Instagram",
      "username": "miajohnson",
      "post_text": "Had a great time playing soccer with my friends today! #soccer #fun #friends",
      "sentiment_score": 0.6,
      "engagement": {
        "likes": 20,
        "comments": 5
      }
    }
},
{ 
    "First_Name": "Elvie",
    "Last_Name": "Bogan",
    "favorite_sport": ["Football", "Basketball"],
    "favorite_sport_team": "Manchester United",
    "favorite_position": ["Midfielder", "Goalkeeper"],
    "how_many_time_play": [{"Football": 4}, {"Basketball": 3}],
    "social_media": {
      "platform": "Facebook",
      "username": "jamessmith",
      "post_text": "Excited for the upcoming Manchester United game! #MUFC #premierleague",
      "sentiment_score": 0.7,
      "engagement": {
        "likes": 30,
        "comments": 10,
        "shares": 2
      }
    }
},
{
  
    "First_Name": "Rubye",
    "Last_Name": "Hagenes",
    "favorite_sport": ["Tennis", "Basketball"],
    "favorite_sport_team": "Serena Williams",
    "favorite_position":["Point Guard"],
    "how_many_time_play": [{"Tennis": 2}, {"Basketball": 5}]
  ,
  
    "First_Name": "Deanna",
    "Last_Name": "Hane",
    "favorite_sport": ["Football", "Tennis"],
    "favorite_sport_team": "Chelsea",
    "favorite_position": ["Defender", "Forward"],
    "social_media": {
      "platform": "Twitter",
      "username": "ryanlee21",
      "post_text": "Great game from Chelsea today, glad they got the win! #CFC #premierleague",
      "sentiment_score": 0.9,
      "engagement": {
        "likes": 5,
        "retweets": 1
      }
    }
  },
  {
       "First_Name": "Karley",    "Last_Name": "Howe",    
       "favorite_sport": ["Basketball", "Soccer"],
    "favorite_sport_team": "LA Lakers",
    "favorite_position": ["Center"],
    "how_many_time_play": [{"Basketball": 5}, {"Soccer": 1}],
    "social_media": {
      "platform": "Instagram",
      "username": "sarahgarcia23",
      "post_text": "Loved watching the Lakers game last night, what a win! #LALakers #NBA",
      "sentiment_score": 0.8,
      "engagement": {
        "likes": 25,
        "comments": 7
      }
    }
  },
  {

    "First_Name": "Lucius",
    "Last_Name": "Wilkinson",
    "social_media": {
      "platform": "Twitter",
      "username": "alexkim12",
      "post_text": "So excited for the upcoming Real Madrid game, hoping for a win! #RealMadrid #LaLiga",
      "sentiment_score": 0.7,
      "engagement": {
        "likes": 15
      }
    }
  },
  
  
    {"First_Name": "Anissa",
    "Last_Name": "Boyle",
    "favorite_sport": ["Tennis", "Volleyball"],
    "favorite_sport_team": "Rafael Nadal",
    "favorite_position": ["Setter"],
    "how_many_time_play": [{"Tennis": 3}, {"Volleyball": 4}],
    "social_media": {}}
  ,
  
    {"First_Name": "Elijah",
    "Last_Name": "Kuhic",
    "favorite_sport": ["Football", "Baseball"],
    "favorite_sport_team": "New England Patriots",
    "favorite_position": ["Quarterback", "Pitcher"],
    "how_many_time_play": [{"Football": 2}, {"Baseball": 3}],
    
  },
  {
    "First_Name": "Kiara",
    "Last_Name": "Cormier",
    "favorite_sport": ["Basketball", "Soccer"],
    "favorite_sport_team": "Golden State Warriors",
    "favorite_position": ["Shooting Guard"],
    "how_many_time_play": [{"Basketball": 4}, {"Soccer": 2}],
    "social_media": {
      "platform": "Instagram",
      "username": "jessicawang24",
      "post_text": "Excited for the Warriors game tonight, hoping for a win! #DubNation #NBA",
      "sentiment_score": 0.7,
      "engagement": {
        "likes": 30,
        "comments": 4
      }
    }
  },
  {    "First_Name": "Florida",    "Last_Name": "Kovacek",    "favorite_sport": ["Baseball", "Football"],
    "favorite_sport_team": "Boston Red Sox",
    "favorite_position": ["Pitcher", "Quarterback"],
    "how_many_time_play": [{"Football": 2}],
    "social_media": {
      "platform": "Twitter",
      "username": "mlee123",
      "post_text": "What a game by the Red Sox last night! #BostonRedSox #MLB",
      "sentiment_score": 0.8,
      "engagement": {
        "likes": 10,
        "retweets": 3
      }
    }
  },
  {
    "First_Name": "Jacklyn",
    "Last_Name": "Keeling",
    "favorite_sport": ["Tennis", "Soccer"],
    "favorite_sport_team": "Roger Federer",
    "how_many_time_play": [{"Tennis": 3}, {"Soccer": 1}],
    "social_media": {}
  },
  {
    "First_Name": "Jared",
    "Last_Name": "Huel",
    
  },
  {
    "First_Name": "General",
    "Last_Name": "Ruecker",
    "favorite_sport": ["Volleyball"],
    "favorite_sport_team": "US Women's National Team",
    "favorite_position": ["Libero"],
    "social_media": {
      "platform": "Twitter",
      "username": "rachelgonzalez7",
      "post_text": "Loved watching the USWNT game last night! #USWNT #Soccer",
      "sentiment_score": 0.9,
      "engagement": {
        "likes": 20,
        "retweets": 5
      }
    }
  },
  {
    "First_Name": "Lacey",
    "Last_Name": "Hills",
    "favorite_sport": ["Football", "Basketball"],
    "favorite_sport_team": "Dallas Cowboys",
    "how_many_time_play": [{"Football": 3}, {"Basketball": 3}],
    "social_media": {
      "platform": "Facebook",
      "username": "justinnguyen99",
      "post_text": "Can't wait for the next Cowboys game! #DallasCowboys #NFL",
      "sentiment_score": 0.7,
      "engagement": {
        "likes": 35,
        "comments": 10,
        "shares": 3
      }
    }
  }
]

x = Customer_Colection.insert_many(survey)
print(myDB.list_collection_names())

myresult = Customer_Colection.find()

#print the result:
for x in myresult:
    print(x)


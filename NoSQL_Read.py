#############################################################################################
##CRUD##

# Create a new social media post
post = { "First_Name": "Ronaldo",
    "Last_Name": "Glover",
    "favorite_sport": ["Baseball", "Football"],
    "favorite_sport_team": "New York Yankees",
    "social_media": {
      "platform": "Facebook",
      "username": "miket_45",
      "post_text": "Yankees won again! #NewYorkYankees #MLB",
      "engagement": {
        "likes": 25,
        "comments": 5
      }
    }
  }

result = Customer_Colection.insert_one(post)

# Read new social media poste

check = Customer_Colection.find({"First_Name": "Ronaldo"})
for x in check:
    print(x)
    
#############################################################################################

# Update a social media post
result = Customer_Colection.update_one(
    {'First_Name': 'Ronaldo', 'Last_Name': 'Glover'},
    {'$set': {'social_media.engagement.likes': 35}}
)

print(result.modified_count)

check = Customer_Colection.find({"First_Name": "Ronaldo"})
for x in check:
    print(x)

#############################################################################################

# Delete post

# Find the inserted document and get its _id field
inserted_doc = Customer_Colection.find_one({"First_Name": "Ronaldo", "Last_Name": "Glover"})
doc_id = inserted_doc["_id"]

# Delete the document using its _id field
result = Customer_Colection.delete_one({"_id": doc_id})
print(result.deleted_count, "document deleted.")

check = Customer_Colection.find({"First_Name": "Ronaldo"})
for x in check:
    print(x)

#############################################################################################

# Read social media posts

# Initialize dictionaries to store the engagement totals
twitter_engagement = {'likes': 0, 'retweets': 0, 'total': 0}
instagram_engagement = {'likes': 0, 'comments': 0, 'total': 0}
facebook_engagement = {'likes': 0, 'comments': 0, 'shares': 0, 'total': 0}

# Iterate through the survey list
for customer in Customer_Colection.find():
    if 'social_media' in customer and 'platform' in customer['social_media']:
        platform = customer['social_media']['platform']
        engagement = customer['social_media']['engagement']
        
        # Add up engagement values depending on the platform
        if platform == 'Twitter':
            twitter_engagement['likes'] += engagement.get('likes', 0)
            twitter_engagement['retweets'] += engagement.get('retweets', 0)
            twitter_engagement['total'] += engagement.get('likes', 0) + engagement.get('comments', 0) + engagement.get('retweets', 0)
        elif platform == 'Instagram':
            instagram_engagement['likes'] += engagement.get('likes', 0)
            instagram_engagement['comments'] += engagement.get('comments', 0)
            instagram_engagement['total'] += engagement.get('likes', 0) + engagement.get('comments', 0)
        elif platform == 'Facebook':
            facebook_engagement['likes'] += engagement.get('likes', 0)
            facebook_engagement['comments'] += engagement.get('comments', 0)
            facebook_engagement['shares'] += engagement.get('shares', 0)
            facebook_engagement['total'] += engagement.get('likes', 0) + engagement.get('comments', 0) + engagement.get('shares', 0)

print("Twitter engagement:", twitter_engagement)
print("Instagram engagement:", instagram_engagement)
print("Facebook engagement:", facebook_engagement)


twitter_engagement
#############################################################################################

# Create a new dictionary to hold all the engagement data
all_engagement = {}

# Update the new dictionary with the engagement data from each platform
all_engagement.update({'Twitter': twitter_engagement})
all_engagement.update({'Instagram': instagram_engagement})
all_engagement.update({'Facebook': facebook_engagement})


# Create lists for the plot
platforms = list(all_engagement.keys())
totals = [all_engagement[platform]['total'] for platform in platforms]


# Sort the platforms and totals lists in ascending order
sorted_platforms, sorted_totals = zip(*sorted(zip(platforms, totals), key=lambda x: x[1]))

# Create the horizontal bar chart
plt.barh(sorted_platforms, sorted_totals, color=['#08a0e9', '#4267B2', '#8134AF'])

# Add labels and title
plt.xlabel('Total Engagements')
plt.ylabel('Social Media Platforms')
plt.title('Engagement by Social Media Platform')

# Display the chart
plt.show()
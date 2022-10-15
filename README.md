# hydration-tracker-ios
# Hydration Tracker iOS

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that keeps track of how much water a user drinks, reminds them to drink water, and keeps track of how often they reach their hydration goals.

### App Evaluation
- **Category:** Lifestyle/Health
- **Mobile:** People would want to track their hydration in real time and would also benefit from having reminders about it on their phone 
- **Story:** This app would have clear value to people who have trouble remembering to stay hydrated and would like to track that habit over time. It would help people develop an essential healthy habit
- **Market:** This app is marketed towards someone who wants to overcome a bad habit of not drinking enough water. The audience is large, but still provides large value.
- **Habit:** This app is specifically for habit formation and repeated use --> we want users to build a habit of staying hydrated
- **Scope:** This project's base form is simple and has utility, and it also has many features to add that can make it more appealing and useful to the user. This means that creating the app in the Codepath course is an achievable goal.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User gets to keep count of water taken in a day
* User can add water in 50 ml increments
* User can delete a record in case they accidentally add too much water
* User can enable reminders in the form of notifications to drink water
* Provides stats such as total water, total days of meeting goals, and average water 

**Optional Nice-to-have Stories**

* User can set a water goal
* User can keep track of water history in a month/week using a calender UI
* User can share data on social media using an API
* User can set a goal for water to drink in a day/week/month
*  User can keep track of streak
*  User can add water in 50/100/200 ml increments or set their own number of ml to add
*  Animation or nice display of some meter filling up based off of water intake


### 2. Screen Archetypes

* Water Intake Screen [Creation]
  * User gets to keep count of water taken in a day
  * User can add water in 50 ml increments
  * User can delete a record in case they accidentally add too much water
* Weekly or Monthly Calendar Screen [Stream]
  * User can keep track of water history in a month/week using a calender UI
* Stats Screen [Stream]
  * Provides stats such as total water, total days of meeting goals, and average water 
  * User can keep track of streak
* Settings Screen [Settings]
  * User can set a water goal
  * User can enable reminders in the form of notifications to drink water
* Share Screen [Creation]
  * User can share data on social media using an API

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Water Intake
* Calendar
* Stats

**Flow Navigation** (Screen to Screen)

* Water Intake Screen
   * Button to Settings Screen
* Stats Screen
   * Button to Share Screen

## Digital Wireframe
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.imgur.com/Fqw6qA2.png">

## Schema 
[This section will be completed in Unit 9]
### Models


   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | waterAmount   | Number   | amount of water consumed that day |
   | waterGoalAmounr   | number| amount of water to reach daily goal |
   | waterTotal  | number     | total amount of water since using the app |
   | streakCount       | number   | image caption by author |
   | dayMetCount | Number   | number of comments that has been posted to an image |
   | dayMissedCount| Number   | number of likes for the post |
   | createdAt     | DateTime | date when the water input is created (default field) |
   | lastUpdatedAt | DateTime | date when water amount is last updated (default field) |
   | day | Date | date on the calendar that changes color if the water goal is met on that day |
   | userId | String | unique id for the user post (default field) |
   | userPassword | String | password created by the user |
   
   

### Networking

#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all water update posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Delete) Delete existing water post of that day
   - Create Post Screen
      - (Create/POST) Create a new water amount tracking
      - (Create/POST) Create or edit goals for water amount intake
   - Profile Screen
      - (Read/GET) Query logged in user posts
      - (Read/GET) Query logged in user stats about their streaks, daily goal met, water amount
      - (Update/PUT) Update user profile image
   - Calendar Screen
      - (Read/GET) Query the calendar of current month
      - (Read/GET) Query logged in user days that the goal met of the current month
      - (Update/PUT) Update user profile image


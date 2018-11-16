# README

Welcome to Fauxgram!

    This is an interactive ruby on rails web app that replicates the experience of Instagram — an early version at least :grin:. Upon signing up, a user will be initialized with a user picture — which was accomplished with Active Storage — and brought to their own user page. On this page they can add a new photo, edit their information (including their profile picture), and log out. Additionally they can see how many posts they have, and view a list of who they are following/followed by. If a new user who follows no one clicks on ‘Feed’ they will be prompted to visit the ‘Discover Users’ tab of the app, where they can see everyone who signed up previously — we figured this would make more sense since our user base is very small. Users cannot have the same username, and must have a minimum password length of 6.

    Once  a user has followed other users, their feed will be populated with pictures — we limited the feed to 20 so it wasn’t so long —  with information about the user that posted them, the description and a few comments — if present. These pictures are clickable and will bring the user to a show page for that picture. The show page includes all the previously mentioned information in addition to likes for that picture and an input box for the user to leave a comment. Our likes are set up as emojis (x-mas themed!) that are clickable and will increase by one upon a click — similar to facebook reactions. If the user owns a picture, they have the option to edit — only the description — or delete it.


    In future updates of the app, we would like to:
    ⁃    Enable users to search for other users
    ⁃    Messaging feature
    ⁃    Users able to


    Things that need fixing:
    ⁃    A new post automatically has a few likes — the the association (Likes model) between Picture and Icon needs fixing.
    ⁃    

We have eight models:
User
Following
Pictures
Picture-hashtags
Hashtags
Comments
Likes
Icons

With these relationships:


For our User-Following relationship we used a self-referential table. This is a technique that you can use to create follower/followee relationships in your web app. It works by tricking the Following model into thinking that ‘:followees’ & ‘followers’ are separate tables that it ‘has_many’ of, but you assign these fake tables the class of User. Essentially you’re creating two versions of a User model for the Following model to associate with which is exactly what you want in this context.

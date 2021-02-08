# Overview

+ App gets the posts from jsonplaceholder and maps each id to a Post object. 
+ For state managment I went with bloc which helps me to rebuild the UI whenever a post is edited or added
+ The first time we get the data from the api, we store it on the device storage with hive. Whenever a user adds more posts/edits this is added to the storage using hive too. 
+ With this the app can work completely fine in offline mode too.


# Assumptions

+ I assumed that we won't have to get the original posts (after edit) again from the api. If this was required we could easily add this by deleteing the existing hivebox from disk, which would require the app to get the data from the api.


# What’s Left To Do

+ There are some places where I could move the hive logic inside a bloc event. This would make the code a bit more readable.
+ Some try catch exceptions, for example when the image url is wrong. (small things, we can add later).

# How to run

+ To run the app, just do a flutter run.


### Original assignment [here](TODO.md)
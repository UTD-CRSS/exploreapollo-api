# Apollo Project - API Web Server App 

[![Dependency Status](https://david-dm.org/UTD-CRSS/api.exploreapollo.org.svg)](https://david-dm.org/UTD-CRSS/api.exploreapollo.org)


# Development

This project requires Node ^4.0.0. You should install node using nvm.

# Setup
Clone the repo to a desire location in your machine, and at the root level of the repo, install all the required packages:   

    npm install 
    
Contact me for crerds config    

For the testing purpose, I'm using Postman to send request/receive response from server. It's currently available in chrome app store. 

# How to use
  - Open a terminal/command prompt and run the server.js
    
        node server.js

  - Open Postman and from here you should be able to play around with sending request/receive response from server
    
# Sample api for web server

**Sample Routes**

    /sample-api/audio            GET		get all audio metadatas
    /sample-api/audio	         POST	  	create an audio metadata
    /sample-api/audio/:audio_id  GET        get a single audio metadata	
    /sample-api/audio/:audio_id  PUT        update audio metadata with matched id with new info
    /sample-api/audio/:audio_id  DELETE     delete audio metadata with matched id from DB
    
    /sample-api/newUserSetup  POST   create new user in db
    /sample-api/users         GET    return all users in db
    /authenticate             POST   authenticate usr/pwd and return token if success
    
 


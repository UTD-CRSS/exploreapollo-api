# Apollo Project - API Web Server App 

[![Dependency Status](https://david-dm.org/UTD-CRSS/api.exploreapollo.org.svg)](https://david-dm.org/UTD-CRSS/api.exploreapollo.org)


# Development

This project requires Node ^4.0.0. You should install node using nvm.

# Setup
Clone the repo to a desire location in your machine, and at the root level of the repo, install all the required packages:   

    npm install 
    
Contact me for creds     

For the testing purpose, I'm using Postman to send request/receive response from server. It's currently available in chrome app store. 

# How to use
  - Open a terminal/command prompt and run the server.js
    
        node server.js

  - Open Postman and from here you should be able to play around with sending request/receive response from server
    
# API Routes for web server

**API Routes**

    /api/moment?momentID=%s                                          GET		return an audio streaming URL
    /api/transcript?momentID=%s&startTime=%s&endTime=%s	             GET	  	return all transcripts within given time interval of given momentID


    
 


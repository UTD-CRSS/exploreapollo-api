# Apollo Project - API Web Server App

![NASA](./NASA_logo.png?raw=true)

[![Dependency Status](https://david-dm.org/UTD-CRSS/api.exploreapollo.org.svg)](https://david-dm.org/UTD-CRSS/api.exploreapollo.org)


# Development

This project requires Node ^4.0.0. You should install node using nvm.

# Setup
Clone the repo to a desire location in your machine, and at the root level of
the repo, install all the required packages:

```
npm install
```

For the testing purpose, I'm using Postman to send request/receive response
from server. It's currently available in chrome app store.

# How to use
  - Open a terminal/command prompt and run the server.js
    ```
    npm start
    ```

  - Open Postman and from here you should be able to play around with sending
    request/receive response from server

# API Routes for web server

endpoint | method | description
--- | --- | ---
`/api/moments/:id` | GET | return an audio streaming URL
`/api/transcripts?momentID=%s&startTime=%s&endTime=%s` | GET | return all transcripts within given time interval of given momentID
`/api/stories` | GET | return all metadata for all available stories
`/api/stories/:id` | GET | return all metadata of story with provided ID

# Configuration

Environment variables available over at `config/custom-environment-variables.js`

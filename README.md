# API.exploreapollo.org

**Sample api for web server**

*Sample Routes*

    /sample-api/audio            GET		get all audio metadatas
    /sample-api/audio	         POST	  	create an audio metadata
    /sample-api/audio/:audio_id  GET        get a single audio metadata	
    /sample-api/audio/:audio_id  PUT        update audio metadata with matched id with new info
    /sample-api/audio/:audio_id  DELETE     delete audio metadata with matched id from DB
    
    /sample-api/newUserSetup  POST   create new user in db
    /sample-api/users         GET    return all users in db
    /sample-api/authenticate  POST   authenticate usr/pwd and return token if success


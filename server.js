// Sample Routes
//		/sample-api/audio      GET		get all audio metadatas
//		/sample-api/audio	   POST		create an audio metadata
//		/sample-api/:audio_id  GET      get a single audio metadata	
//		/sample-api/:audio_id  PUT      update audio metadata with matched id with new info
//		/sample-api/:audio_id  DELETE   delete audio metadata with matched id from DB
//
//      /sample-api/newUserSetup  POST   create new user in db
//      /sample-api/users         GET    return all users in db
//      /sample-api/authenticate  POST   authenticate usr/pwd and return token if success



// BASE SETUP
// =============================================================================

// import neccessary pkgs 
var express    = require('express');        
var app        = express();                 
var bodyParser = require('body-parser');
var jwt        = require('jsonwebtoken');
var audio 	   = require('./models/audio');
var config     = require('./config');
var User       = require('./models/user');

// import mongoose pkg and connect to designated DB
var mongoose   = require('mongoose');
mongoose.connect(config.database); 

// configure app to use bodyParser()
// this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.set('customKey',config.key); // set key
var port = 4060;        // set our port 

// ROUTES FOR OUR API
// =============================================================================
var router = express.Router();              // initialize and get an instance of the express Router

// REGISTER ROUTES -------------------------------
app.use(router); // default ./

var jsonTokenEnabled = true;
// routes use-cases
var count = 0;
router.use(function(req, res, next) {
	count++;
    console.log('Request '+ count +' received');

    if (!jsonTokenEnabled) next();
    else {
        // check header or url parameters or post parameters for token
        var token = req.headers['x-access-token'];

        // decode token
        if (token) {
            jwt.verify(token, app.get('customKey'), function(err, decoded) {      
                if (err) {
                    return res.json({ success: false, message: 'Failed to authenticate token.' });    
                } else {
                    // if everything is good, save to request for use in other routes whichever uses it
                    req.decoded = decoded;    
                    console.log("Authentication success");
                    next(); // only if token is correct
                }
            });
        } else {
            // if there is no token
            // return an error
            return res.status(403).send({ 
                success: false, 
                message: 'No token provided.' 
            });    
        }
    }
});

router.route('/')
	.get(function(req, res) {
    	res.json({ message: 'Default path - response from server' });   
	});

router.route('/sample-api/audio')
    // create audio info
    .post(function(req, res) {
        var myAudio = new audio();      
        myAudio.name = req.body.name;  
        myAudio.ET = Math.floor(Math.random()*100);
        // save it in DB
        myAudio.save(function(err) {
            if (err)	{res.send(err);}
            else {
            	res.json({ message: 'Audio Metadata created!' });
            }	
        });
    })
    // get all audios
    .get(function(req, res) {
        audio.find(function(err, tmpAudio) {
            if (err) { res.send(err); }
            else {  res.json(tmpAudio);}
        });
    });

router.route('/sample-api/audio/:audio_id')
    // get the audio with given id 
    .get(function(req, res) {
        audio.findById(req.params.audio_id, function(err, tmpAudio) {
            if (err) { res.send(err);  }
            else {	res.json(tmpAudio);}
        });
    })
    // update audio info for id
    .put(function(req, res) {
        audio.findById(req.params.audio_id, function(err, tmpAudio) {
            if (err){ res.send(err);}
            else {
            	tmpAudio.name = req.body.name;  // update audio info
            	tmpAudio.ET = req.body.ET;
            	// save the audio info
            	tmpAudio.save(function(err) {
               		if (err) { res.send(err); }
               		else { res.json({ message: 'Audio info updated' });}
            	});
            }	
        });
    })
    // delete audio info from db 
    .delete(function(req, res) {
        audio.remove({ _id: req.params.audio_id }, function(err, tmpAudio) {
            if (err) {res.send(err);}
            else { res.json({ message: 'Successfully deleted' });}
        });
    });   

router.route('/sample-api/newUserSetup')
    .post(function(req,res){
        var myNewUser = new User();      
        myNewUser.name = req.body.name;  
        myNewUser.password = req.body.password;
        myNewUser.admin = false;
        // save it in DB
        myNewUser.save(function(err) {
            if (err)    {res.send(err);}
            else {
                res.json({ message: 'New user created!' });
            }   
        });

    });
router.route('/sample-api/users')
    .get(function(req,res){        
        // save it in DB
        User.find(function(err, allUsers) {
            if (err) { res.send(err); }
            else {  res.json(allUsers);}
        });

    });
router.route('/sample-api/authenticate')
    .post(function(req,res){
        // find the user
        User.findOne({name: req.body.name}, function(err, user) {
            if (err) throw err;
            if (!user) {
                res.json({ success: false, message: 'User not found.'});
            } 
            else { // user found
                // check if password matches
                if (user.password != req.body.password) {
                    res.json({ success: false, message: 'Wrong password.' });
                } 
                else {
                // if user is found and password is right
                // create a token
                var token = jwt.sign(user, app.get('customKey'), {
                    expiresInMinutes: 600 // expires in 10 hours
                });

                // return the information including token as JSON
                res.json({
                    success: true,
                    message: 'Authentication success. Token created/found',
                    token: token
                });
                }   
            }
        });
    })            
// more routes for our API will happen here

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Server is listening to port ' + port);



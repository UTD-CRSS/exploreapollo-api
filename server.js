// Sample Routes
//		/sample-api/audios     GET		get all audio metadatas
//		/sample-api/audios	   POST		create an audio metadata
//		/sample-api/:audio_id  GET      get a single audio metadata	
//		/sample-api/:audio_id  PUT      update audio metadata with matched id with new info
//		/sample-api/:audio_id  DELETE   delete audio metadata with matched id from DB
//



// BASE SETUP
// =============================================================================

// import neccessary pkgs 
var express    = require('express');        
var app        = express();                 
var bodyParser = require('body-parser');
var audio 	   = require('./models/audio');

// import mongoose pkg and connect to designated DB
var mongoose   = require('mongoose');
mongoose.connect('mongodb://test:test@ds047468.mongolab.com:47468/audiometadata'); 

// configure app to use bodyParser()
// this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port = 4060;        // set our port 

// ROUTES FOR OUR API
// =============================================================================
var router = express.Router();              // initialize and get an instance of the express Router

// REGISTER ROUTES -------------------------------
app.use('/sample-api', router);
app.use('/',router);


// routes use-cases
var count = 0;
router.use(function(req, res, next) {
	count++;
    console.log('Request '+ count +' received');
    next(); // go to the next routes
});

router.route('/')
	.get(function(req, res) {
    	res.json({ message: 'Default path - response from server' });   
	});

router.route('/audio')
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

router.route('/audio/:audio_id')
    // get the audio with given id 
    .get(function(req, res) {
        audio.findById(req.params.audio_id, function(err, tmpAudio) {
            if (err) { res.send(err);  }
            else {	res.json(tmpAudio);}
        });
    })
    // update audio info for id
    .put(function(req, res) {
        // use our bear model to find the bear we want
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
// more routes for our API will happen here

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Server is listening to port ' + port);



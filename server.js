

// =============================================================================
// =========================== BASE SETUP ======================================
// =============================================================================

// import neccessary pkgs 
var express    = require('express');        
var app        = express();                 
var bodyParser = require('body-parser');
var jwt        = require('jsonwebtoken');
var util       = require('util');
var pg         = require('pg');

// our stuffs
var config     = require('./config');
var sqlLib     = require('./sqlLib');
var sampleData = require('./sampleData');


var conString  = util.format(config.database,config.username, config.password); 


// configure app to use bodyParser() - this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.set('customKey',config.key); // set key
var port = 4060;        // set our port 

// =============================================================================
// ====================== ROUTES INITIALIZATION ================================
// =============================================================================
var apiRoute = express.Router();
app.use(apiRoute); // REGISTER ROUTES
// =============================================================================
// ====================== ROUTES INITIALIZATION ================================
// =============================================================================



// =============================================================================
// ========================== ROUTES FOR OUR API ===============================
// =============================================================================

// *******************
// ** Moment Viewer **
// *******************

// 1. Transcript
apiRoute.route('/api/transcript')        
    .get(function(req,res){
        var result ={}; 
        var myTranscripts = [];   
        var momentID, startTime, endTime; 
        var momentIDParam,startTimeParam, endTimeParam;

        momentIDParam = req.query.momentID;
        startTimeParam = req.query.startTime;
        endTimeParam = req.query.endTime;

        if (momentIDParam == "" || startTimeParam == "" || endTimeParam == "" || momentIDParam == null || startTimeParam == null || endTimeParam == null )
            return res.json({"message" : "At least one param is empty or mising. Please try again"});

        momentID = parseInt(momentIDParam);
        startTime = parseInt(startTimeParam);
        endTime = parseInt(endTimeParam);

        // ===== query db ====
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json({"message" : "Error connecting to database"});        
            
            var queryString = sqlLib.SelectAllTranscriptsWithinGivenInterval;
            var temp_query = client.query(queryString,[momentID,startTime,endTime]);

            // ===== processing returned data ====
            temp_query.on("row",function(row){
                myTranscripts.push(row);        
            });

            // ===== package data and send back to front-end ==== 
            temp_query.on("end",function(){
                done();
                if (myTranscripts.length == 0) return res.json({"message" : "Incorrect metadata. Please try again"});                
                result = {
                    "message"       : "Success",
                    "momentID"      : momentID,
                    "startTime"     : startTime,
                    "endTime"       : endTime,
                    "transcripts"   : myTranscripts
                };
                return res.json(result); 
            });
            // ===== package data and send back to front-end ==== 
        });
        // ===== query db ====
    });

// 2. Moment 
apiRoute.route('/api/moment') 
    .get(function(req,res){
        var momentID = req.query.momentID;
        if (momentID == null || momentID == "") 
            return res.json({ "message" : "Empty momentID. Please try again"});
         
        var result ={}; 
        var momentMetadata = []; // array of row objects

        // ===== query db ====
        pg.connect(conString, function(err, client, done){
            if (err) return res.json({"message" : "Error connecting to database"});
            
            var queryString = sqlLib.GenerateStreamingURL;
            var temp_query = client.query(queryString,[momentID]);

            // ===== processing returned data ====
            temp_query.on("row",function(row){
                momentMetadata.push(row);        
            });

            // ===== package data and send back to front-end ====
            temp_query.on("end",function(){
                done();         
                if (momentMetadata.length == 0) return res.json({"message" : "Incorrect momentID. Please try again"}); 

                // cooking the audio url
                var momentlength = momentMetadata[0].met_end - momentMetadata[0].met_start; // met-start and end are same for all rows so pick an arbitrary one and extract these two
                var momentstart = momentMetadata[0].met_start;
                // right now its only mission 11 - might need to query/change above query to get mission id
                var audioURL  = config.defaultStreamingURL;
                for (var i = 0; i < momentMetadata.length; i++){
                    audioURL += "&channel=" + momentMetadata[i].channel_id         
                }
                audioURL += "&format=m4a"; // default format for now?
                audioURL += "&t=" + momentstart;
                audioURL += "&len=" + momentlength;    
                //console.log("Audio url " + audioURL); 

                // body?
                // upcoming moments?

                // package result object
                result = {
                    "message"         : "Success",
                    "title"           : momentMetadata[0].title,
                    "audioURL"        : audioURL,
                    "startTime"       : momentstart,
                    "length"          : momentlength,
                    "body"            : {}
                };
                return res.json(result); 
                
            });        
              
        });  // end outter query        
        // ===== query db ====
    });

// 3. Body???

// *******************
// ** Story Viewer **
// *******************

// 1. Story
apiRoute.route('/api/story')        
    .get(function(req,res){
        var storyID = req.query.storyID;
        if (storyID == null || storyID == "") 
            return res.json({ "message" : "Empty storyID. Please try again"});     
        var result ={}; 
        var momentList = [];
        var tempArray = []; // storing raw rows returned

        // ===== query db ====
        pg.connect(conString, function(err, client, done){
            if (err) return res.json({"message" : "Error connecting to database"});
            var queryString = sqlLib.SelectAllMomentsOfGivenStory;
            var temp_query = client.query(queryString,[storyID]);

            // ===== processing returned data ====
            temp_query.on("row",function(row){
                tempArray.push(row);        
            });

            // ===== package data and send back to front-end ====
            temp_query.on("end",function(){
                done();         
                if (tempArray.length == 0) return res.json({"message" : "Incorrect storyID. Please try again"});
                for (var i =0; i<tempArray.length; i++){
                    momentList.push({
                        "id"            : tempArray[i].moment_id,
                        "title"         : tempArray[i].moment_title,
                        "order"         : tempArray[i].moment_order,
                        "met_start"     : tempArray[i].met_start,
                        "met_end"       : tempArray[i].met_end,
                        "description"   : tempArray[i].moment_description
                    });
                }
                result = {
                    "message"         : "Success",
                    "id"              : storyID,
                    "title"           : tempArray[0].story_title,
                    "description"     : tempArray[0].story_description,  
                    "momentList"      : momentList
                };
                return res.json(result); 
            });
        });
    });

// =============================================================================
// ========================== ROUTES FOR OUR API ===============================
// =============================================================================


/* Testing our db connection - transcript test!
pg.connect(conString, function(err, client, done){
    if (err) {console.log("fail");return;}
    else {
        var result = []; 
        var id = 1;
        var mstart = 3.55e5; var mend =4.54e5;

        var queryString = sqlLib.SelectTranscript;
        var dquery = client.query(queryString,[id,mstart,mend]);

        dquery.on("row",function(row){
            result.push(row);
        });
        dquery.on("end",function(){
            done();
            console.log(JSON.stringify(result));
            return; 
        });
        dquery.on('error', function(error) {
            console.log("fail sql "+error);
        });     
    }
});
*/ 


// =============================================================================
// ====================== START THE SERVER =====================================
// =============================================================================

// 
// =============================================================================
app.listen(port);
console.log('Server is listening to port ' + port);



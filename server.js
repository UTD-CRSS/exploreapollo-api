

// =============================================================================
// =========================== BASE SETUP ======================================
// =============================================================================

// import neccessary pkgs 
var express    = require('express');        
var app        = express();                 
var bodyParser = require('body-parser');
var jwt        = require('jsonwebtoken');
var config     = require('./config');
var util       = require('util');
var pg         = require('pg');
var conString  = util.format(config.database, config.username,config.password); ;
var sampleData = require('./sampleData');

// configure app to use bodyParser() - this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//app.set('customKey',config.key); // set key
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

// 1. Transcript
apiRoute.route('/api/transcript')        
    .get(function(req,res){
        var result ={}; 
        var myTranscripts = [];   
        var momentID, startTime, endTime;

        // extract momentID, startTime and endtime
        var myKeys = Object.keys(req.query); 
        console.log("Check params "+JSON.stringify(req.query) +" ---- "+myKeys.length);
        
        momentID = req.query[myKeys[0]];
        startTime = req.query[myKeys[1]];
        endTime = req.query[myKeys[2]];
        console.log(momentID + "-" + startTime + "-" + endTime); 
            
        // ===== query db ====
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json({"message" : "Error connecting to database"});
            else {
                
                var queryString = "SELECT transcript_parts.id, transcript_parts.met_start, transcript_parts.message, transcript_parts.speaker_id, speakers.name, transcript_parts.ChannelID
                                    FROM (
                                        SELECT * FROM transcript_parts WHERE met_start  >= $1 AND met_start <= $2
                                    )
                                    INNER JOIN speakers
                                    ON transcript_parts.speaker_id = speakers.id
                                    ORDER BY transcript_parts.met_start ASC";
                var temp_query = client.query(queryString,[startTime,endTime]);

                // ===== processing returned data ====
                temp_query.on("row",function(row){
                    myTranscripts.push(row);        
                });
                // ===== processing returned data ====

                // ===== package data and send back to front-end ==== 
                temp_query.on("end",function(){
                    done();
                    if (myTranscripts.length == 0) return res.json({"message" : "Incorrect metadata. Please try again"});
                    else {
                       result = {
                            "message"       : "Success",
                            "momentID"      : momentID,
                            "startTime"     : startTime,
                            "endTime"       : endTime,
                            "transcripts"   : myTranscripts
                        };  

                        return res.json(result);          
                    }    
                    
                });
                // ===== package data and send back to front-end ==== 
            }
        });
        // ===== query db ====
        
        /*
        // ===== package data and send back to front-end ====    
        var tmp = sampleData.transcript1;
        tmp.momentID = momentID;
        tmp.startTime = startTime;
        tmp.endTime = endTime;
        res.send(tmp);
        // ===== package data and send back to front-end ====
        */    
    });

// 2. Moment
apiRoute.route('/api/moment') 
    .get(function(req,res){
        var momentID = req.query.momentID;
        if (momentID == null || momentID == "") 
            return res.json({ "message" : "Empty momentID. Please try again"});
        else { 
            var result ={}; 
            var momentMetadata = []; // array of row objects

            // ===== query db ====
            pg.connect(conString, function(err, client, done){
                if (err) return res.json({"message" : "Error connecting to database"});
                else {
                    var queryString = "SELECT moments.id, moments.title, moments.met_start, moments.met_end 
                                        FROM (
                                            SELECT channel_id FROM moment_channel_join ON moment_channel_join.id = $1
                                        )
                                        INNER JOIN moments
                                        ON moments.id = moment_channel_join.moment_id
                                        ORDER BY moment_channel_join.channel_id ASC";

                    var temp_query = client.query(queryString,[momentID]);

                    // ===== processing returned data ====
                    temp_query.on("row",function(row){
                        momentMetadata.push(row);        
                    });
                    // ===== processing returned data ====
                    temp_query.on("end",function(){
                        done();         
                        if (momentMetadata.length == 0) return res.json({"message" : "Incorrect momentID. Please try again"}); 
                        else { // valid momentID

                            // cooking the audio url
                            var momentlength = momentMetadata[0].met_end - momentMetadata[0].met_start; 
                            var momentstart = momentMetadata[0].met_start;
                            // right now its only mission 11 - might need to query/change above query to get mission id
                            var audioURL  = "audio.exploreapollo.org/stream?mission=11";
                            for (var i = 0; i < momentMetadata.length; i++){
                                audioURL += "&channel=" + momentMetadata[i].channel_id         
                            }
                            audioURL += "&format=m4a"; // default format for now?
                            audioURL += "&t=" + momentstart;
                            audioURL += "&len=" + momentlength;    
                            console.log("Audio url " + audioURL); 

                            // body?
                            // upcoming moments?

                            // package result object
                            result = {
                                "message"         : "Success",
                                "title"           : momentMetadata[0].title,
                                "audioURL"        : audioURL,
                                "startTime"       : momentstart,
                                "length"          : momentlength,
                                "body"            : {},
                                "upcomingMoments" : []
                            };
                            return res.json(result); 
                        }
                    });        
                }  
            });  // end outter query        
            // ===== query db ====

            /*
            return res.json({
                message : "Success for id " + momentID,
                resultObject : sampleData.momentMock
            });*/
        }    
    });

// =============================================================================
// ========================== ROUTES FOR OUR API ===============================
// =============================================================================







// =============================================================================
// ====================== START THE SERVER =====================================
// =============================================================================

// 
// =============================================================================
app.listen(port);
console.log('Server is listening to port ' + port);



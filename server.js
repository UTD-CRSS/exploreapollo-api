

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

// configure app to use bodyParser()
// this will let us get the data from a POST
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

// 1. Transcript
apiRoute.route('/api/transcript')        
    .get(function(req,res){
        var results ={}; 
        var myTranscripts = [];   
        var momentID, startTime, endTime;

        // extract momentID, startTime and endtime
        var myKeys = Object.keys(req.query); 
        console.log("Check params "+JSON.stringify(req.query) +" ---- "+myKeys.length);
        
        momentID = req.query[myKeys[0]];
        startTime = req.query[myKeys[1]];
        endTime = req.query[myKeys[2]];
        console.log(momentID + "-" + startTime + "-" + endTime);   

        // insert these metadata back to returned pkg
        results.momentID = momentID;
        results.startTime = startTime;
        results.endTime = endTime;

        // ===== query db ====
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error fetching transcript rows " + JSON.stringify(err));
            else {
                
                var queryString = "SELECT Transcript.TranscriptID, Transcript.StartTime, Transcript.TranscriptText, Transcript.SpeakerID, Speaker.Name, Transcript.ChannelID
                                    FROM (
                                        SELECT * FROM Transcript WHERE StartTime  >= $1 AND StartTime <= $2
                                    )
                                    INNER JOIN Speaker
                                    ON Transcript.SpeakerID = Speaker.ID
                                    ORDER BY Transcript.StartTime ASC";
                var temp_query = client.query(queryString,[startTime,endTime]);

                // ===== processing returned data ====
                temp_query.on("row",function(row){
                    myTranscripts.push(row);        
                });
                // ===== processing returned data ====

                // ===== package data and send back to front-end ==== 
                temp_query.on("end",function(){
                    done();
                    results.transcripts = myTranscripts
                    return res.json(results);         
                });
                // ===== package data and send back to front-end ==== 
            }
        });
        // ===== query db ====


        // ===== package data and send back to front-end ====    
        var tmp = sampleData.transcript1;
        res.send(tmp);
        // ===== package data and send back to front-end ====    
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



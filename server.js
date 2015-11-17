

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

// 1. Transcript
apiRoute.route('/api/transcript')        
    .get(function(req,res){
        var result ={}; 
        var myTranscripts = [];   
        var momentID, startTime, endTime;
        
        momentID = parseInt(req.query.momentID);
        startTime = parseInt(req.query.startTime);
        endTime = parseInt(req.query.endTime); 


        if (momentID == "" || startTime == "" || endTime == "" || momentID == null || startTime == null || endTime == null )
            return res.json({"message" : "At least one param is empty or mising. Please try again"});
            
        // ===== query db ====
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json({"message" : "Error connecting to database"});
            else {
                
                var queryString = sqlLib.SelectTranscript;
                var temp_query = client.query(queryString,[momentID,startTime,endTime]);

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
    });

// 2. Moment - confirmed 1.0
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
                    var queryString = sqlLib.GenerateStreamingURL;

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
                        }
                    });        
                }  
            });  // end outter query        
            // ===== query db ====

        }    
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



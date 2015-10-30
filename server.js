

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
        // extract momentID, startTime and endtime
        var myKeys = Object.keys(req.query); 
        console.log("Check params "+JSON.stringify(req.query) +" ---- "+myKeys.length);
        var momentID, startTime, endTime;
        momentID = req.query[myKeys[0]];
        startTime = req.query[myKeys[1]];
        endTime = req.query[myKeys[2]];
        console.log(momentID + "-" + startTime + "-" + endTime);    

        // ===== query db ====
        // ===== query db ====

        // ===== processing returned data ====
        // ===== processing returned data ====

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



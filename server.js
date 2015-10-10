// Sample Routes
//		/sample-api/audio            GET	  get all audio metadatas
//		/sample-api/audio	         POST	  create an audio metadata
//		/sample-api/audio/:audio_id  GET      get a single audio metadata	
//		/sample-api/audio/:audio_id  PUT      update audio metadata with matched id with new info
//		/sample-api/audio/:audio_id  DELETE   delete audio metadata with matched id from DB
//
//      /sample-api/newUserSetup  POST   create new user in db
//      /sample-api/users         GET    return all users in db
//      /authenticate             POST   authenticate usr/pwd and return token if success



// BASE SETUP
// =============================================================================

// import neccessary pkgs 
var express    = require('express');        
var app        = express();                 
var bodyParser = require('body-parser');
var jwt        = require('jsonwebtoken');
var config     = require('./config');
var pg = require('pg');
var conString = config.database;


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

var jsonTokenEnabled = false;
// routes use-cases
var count = 0;
// set up authentication 
router.use('/sample-api/',function(req, res, next) {
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
    	return res.json({ message: 'Default path - response from server' });   
	});

// 1. /sample-api/audio route
router.route('/sample-api/audio')
    // create audio info
    .post(function(req, res) { 
        if (req.body.name ==""||req.body.name ==null) 
            return res.json("Input field is empty or not present. Please try again");   
        var temp_name = req.body.name;  
        var temp_et = Math.floor(Math.random()*1000);
        // insert it to DB
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error inserting row "+JSON.stringify(err));
            else {
                client.query("INSERT INTO Audio(name,et) VALUES($1, $2)",[temp_name,temp_et])
                    .on("end",function(result){
                        done(); console.log(JSON.stringify(result));
                        return res.json((result.rowCount ==0)?"Create new audio fail. Please try again":"Insert success");   

                    });
            }
        });         
    })
    // get all audios
    .get(function(req, res) {
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error fetching audio rows "+JSON.stringify(err));
            else {
                var results =[];
                var temp_query = client.query("SELECT * FROM Audio ORDER BY id ASC");
                temp_query.on("row",function(row){
                    results.push(row);        
                });
                temp_query.on("end",function(){
                    done();
                    return res.json(results);         
                });
            }
        });
    });

// 2. /sample-api/audio/id route
router.route('/sample-api/audio/:audio_id')
    // get the audio with given id 
    .get(function(req, res) {
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error fetching audio row "+JSON.stringify(err));
            else {
                var result ="";
                var temp_query = client.query("SELECT * FROM Audio WHERE id=($1)",[parseInt(req.params.audio_id)]);
                temp_query.on("row",function(row){
                    result = row;        
                });
                temp_query.on("end",function(){
                    done(); 
                    return res.json((result=="")?"No row found with given id":result);         
                });
            }
        });
    })
    // update audio info for id
    .put(function(req, res) {        
        if (req.body.name ==""||req.body.et==""||req.body.name ==null||req.body.et==null) 
            return res.json("At least one input field is empty or not present. Please try again");
        var newName = req.body.name;
        var newEt = parseInt(req.body.et); 
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error updating audio row "+JSON.stringify(err));
            else {
                var temp_query = client.query("UPDATE Audio SET name=($1), et=($2) WHERE id=($3)",[newName,newEt,parseInt(req.params.audio_id)]);
                temp_query.on("end",function(result){
                    done(); console.log(JSON.stringify(result)); 
                    return res.json((result.rowCount ==0)?"Row id not found":"Update row success");         
                });
            }
        });
    })
    // delete audio info from db 
    .delete(function(req, res) {
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error deleting audio row "+JSON.stringify(err));
            else {
                var temp_query = client.query("DELETE FROM Audio WHERE id=($1)",[parseInt(req.params.audio_id)]);
                temp_query.on("end",function(result){
                    done(); console.log(JSON.stringify(result));
                    return res.json((result.rowCount ==0)?"Row id not found":"Delete row success");         
                });
            }
        });
    });   
// 3.a User management route /sample-api/newUserSetup
router.route('/sample-api/newUserSetup')
    .post(function(req,res){
        if (req.body.name ==""||req.body.password==""||req.body.name ==null||req.body.password==null) 
            return res.json("At least one input field is empty or not present. Please try again");
        var newName = req.body.name;  
        var newPassword = req.body.password;  
        var newIsAdmin = false;          
        // insert it to DB
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error inserting row "+JSON.stringify(err));
            else {
                client.query("INSERT INTO commonuser(name,password,isadmin) VALUES($1,$2,$3)",[newName,newPassword,newIsAdmin])
                    .on("end",function(result){
                        done(); console.log(JSON.stringify(result));
                        return res.json((result.rowCount ==0)?"Create new user fail. Please try again":"Insert success");         
                    });
            }
        }); 

    });
// 3.b route /sample-api/users    
router.route('/sample-api/users')
    // get all users
    .get(function(req, res) {
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error fetching user rows "+JSON.stringify(err));
            else {
                var results =[];
                var temp_query = client.query("SELECT * FROM commonuser ORDER BY id ASC");
                temp_query.on("row",function(row){
                    results.push(row);        
                });
                temp_query.on("end",function(){
                    done();
                    return res.json(results);         
                });
            }
        });
    });
// 3.c Authenticate user and send back token route /authenticate    
router.route('/authenticate')
    .post(function(req,res){
        count++;
        console.log('Request '+ count +' received');
        var result={};
        var found = false;
        // check if user name and pwd found in db
        pg.connect(conString, function(err, client, done) {
            if (err) return res.json("Error fetching user row "+JSON.stringify(err));
            else {
                var temp_query = client.query("SELECT * FROM commonuser WHERE name=($1) and password=($2)",[req.body.name,req.body.password]);
                temp_query.on("row",function(row){
                    result = row;   
                    console.log("Checking row "+JSON.stringify(result)); 
                    found = true;      
                });
                temp_query.on("end",function(){
                    done();
                    if (!found) return res.json("Username or password is incorrect. Please try again");  
                    else {
                        // if found, create token
                        // create a new temp object and pass in user name and admin flag - no pwd
                        var token = jwt.sign({name:req.body.name,isadmin:result.isadmin}, app.get('customKey'), {
                            expiresInMinutes: 600 // expires in 10 hours
                        });

                        // return the information including token as JSON
                        return res.json({
                            success: true,
                            message: 'Authentication success. Token created/found',
                            token: token
                        });  
                    }       
                });
            } // end else 
        });          
    })            
// more routes for our API will happen here



// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Server is listening to port ' + port);



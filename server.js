// =============================================================================
// =========================== BASE SETUP ======================================
// =============================================================================

// import neccessary pkgs
const express    = require('express');
const app        = express();
const bodyParser = require('body-parser');
const jwt        = require('jsonwebtoken');
const util       = require('util');
const pg         = require('pg');
const config     = require('config');
const _          = require('lodash');

// our stuffs
const sqlLib     = require('./sqlLib');
const sampleData = require('./sampleData');

// models
const Story = require('./models/Story');
const Moment = require('./models/Moment');

const dbAuth = `${config.get('db.user')}:${config.get('db.password')}`;
const dbHostInfo = `${config.get('db.host')}/${config.get('db.database')}`;
const conString = `pg://${dbAuth}@${dbHostInfo}`;

// configure app to use bodyParser() - this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(require('cors')());

app.set('customKey',config.key); // set key
const port = config.get('port');        // set our port

// =============================================================================
// ====================== ROUTES INITIALIZATION ================================
// =============================================================================
const apiRoute = express.Router();
app.use(apiRoute); // REGISTER ROUTES

// =============================================================================
// ========================== ROUTES FOR OUR API ===============================
// =============================================================================

// *******************
// ** Moment Viewer **
// *******************

// 1. Transcript
apiRoute.route('/api/transcripts')
    .get(function(req,res){
        var result ={};
        var myTranscripts = [];

        const momentIDParam = req.query.momentID;
        const startTimeParam = req.query.startTime;
        const endTimeParam = req.query.endTime;

        if (_.every([
            momentIDParam,
            startTimeParam,
            endTimeParam
        ], Boolean) === false) {
            res.status = 400;
            return res.json({
                message: "At least one param is empty or mising. Please try again"
            });
        }

        const momentID = parseInt(momentIDParam);
        const startTime = parseInt(startTimeParam);
        const endTime = parseInt(endTimeParam);

        // ===== query db ====
        pg.connect(conString, function(err, client, done) {
            if (err) {
                return res.json({"message" : "Error connecting to database"});
            }

            const queryString = sqlLib.SelectAllTranscriptsWithinGivenInterval;
            const temp_query = client.query(
                queryString,
                [momentID,startTime,endTime]
            );

            // ===== processing returned data ====
            temp_query.on("row", function(row) {
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
apiRoute.route('/api/moments/:id')
    .get(function(req,res){
        var momentID = req.params.id;
        if (!momentID) {
            return res.json({ "message" : "Empty momentID. Please try again"});
        }

        // ===== query db ====
        pg.connect(conString, function(err, client, done){
            if (err) {
                return res.json({"message" : "Error connecting to database"});
            }

            Moment
                .getById(momentID, client)
                .then((moment) => {
                    console.log(moment);
                    moment.mission =  {
                        id: 1,
                        title: "Apollo 11",
                        length: 7.031e8
                    };
                    moment. audioUrl = "https://aqueous-garden-9236.herokuapp.com/stream.mp3";

                    return res.json(moment);
                })
        });
    });

// 3. Body???

// *******************
// ** Story Viewer **
// *******************

// 1. Story
apiRoute.route('/api/stories')
    .get(function(req, res, next) {
        pg.connect(conString, function(err, client, done) {
            // TODO: Pagniation
            Story
                .getAll({}, client)
                .then((result) => {
                    done();
                    return res.json(result);
                });
        });
    });

apiRoute.route('/api/stories/:id')
    .get(function(req, res, next) {
        const storyID = req.params.id;

        if (!storyID) {
            res.status = 400;
            return res.json({message: "Empty storyID. Please try again"});
        }

        pg.connect(conString, function(err, client, done) {
            Story
                .getById(storyID, client)
                .then((result) => {
                    done();
                    return res.json(result);
                });
        });
    });

// =============================================================================
// ====================== START THE SERVER =====================================
// =============================================================================
app.listen(port);
console.log(`Server is listening to port ${port}`);

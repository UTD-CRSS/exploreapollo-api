// import pkg 
var mongoose     = require('mongoose');
var Schema       = mongoose.Schema;

var AudioSchema   = new Schema({
    name: String,
    ET: String
});

module.exports = mongoose.model('audio', AudioSchema);
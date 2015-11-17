var transcript1 = {
    "message"       : "Success",
    "momentID"      : 3,
    "startTime"     : "3.23e6",
    "endTime"       : "3.73e6",
    "transcripts"   : [
        {
            "id"         : 1,
            "message"    : "Today was meant to be a display of your power. Instead, I give you a glimpse of the devastation my race can unleash upon yours!",
            "met_start"  : "3.23e6",
            "met_end"    : "3.231e6",
            "channel_id" : 10,
            "speaker_id" : 3,
            "name"       : "Magneto"
        },
        {
            "id"         : 2,
            "message"    : "Today was meant to be a display of your power. Instead, I give you a glimpse of the devastation my race can unleash upon yours!",
            "met_start"  : "3.33e6",
            "met_end"    : "3.331e6",
            "channel_id" : 11,
            "speaker_id" : 4,
            "name"       : "Mr. Gold"
        },
        {
            "id"         : 3,
            "message"    : "I can be a far greater nightmare than you could ever imagine.",
            "met_start"  : "3.43e6",
            "met_end"    : "3.431e6",
            "channel_id" : 13,
            "speaker_id" : 5,
            "name"       : "Regina"
        },
        {
            "id"         : 4,
            "message"    : "Aye",
            "met_start"  : "3.53e6",
            "met_end"    : "3.532e6",
            "channel_id" : 7,
            "speaker_id" : 18,
            "name"       : "Greg"
        }
    ]
};

var momentMock = {
    "message"         : "Success",
    "title"           : "Potato",
    "audioURL"        : "http://audio.exploreapollo.org/stream?mission=11&channel=14&channel=18&channel=24&format=m4a&t=369300000&len=600",
    "startTime"       : "369300000",
    "length"          : "6000000",
    "body"            : {}
};

var storyMock = {
    "message"         : "Success",
    "id"              : 10,  
    "title"           : "Mars",
    "description"     : "asiqwieu12u129eu912ue9",  
    "momentList"      : [
        {
            "id"            : 12,
            "title"         : "crater",
            "order"         : 1,
            "met_start"     : 3.23e4,
            "met_end"       : 4.23e4,
            "description"   : "abcdxyz"
        },
        {
            "id"            : 16,
            "title"         : "water",
            "order"         : 2,
            "met_start"     : 3.84e4,
            "met_end"       : 5.93e4,
            "description"   : "asjdsjdb"
        },
        {
            "id"            : 22,
            "title"         : "crust",
            "order"         : 3,
            "met_start"     : 6.11e4,
            "met_end"       : 7.22e4,
            "description"   : "abcqwejqjkbcjbscdxyz"
        },
        {
            "id"            : 34,
            "title"         : "lava",
            "order"         : 4,
            "met_start"     : 7.13e4,
            "met_end"       : 9.55e4,
            "description"   : "asdmasdjkbjkb212bl"
        },
    ]
};


exports.transcript1 = transcript1;
exports.momentMock = momentMock;
exports.storyMock = storyMock;




var transcript1 = {
    "message"       : "Success",
    "momentID"      : 3,
    "startTime"     : "3.23e6",
    "endTime"       : "3.73e6",
    "transcripts"   : [
        {
            "id"        : 1,
            "startTime" : "3.23e6",
            "speaker"   : "Magneto",
            "speakerID" : 26,
            "message"   : "Today was meant to be a display of your power. Instead, I give you a glimpse of the devastation my race can unleash upon yours!",
            "channel"   : 15
        },
        {
            "id"        : 2,
            "startTime" : "3.33e6",
            "speaker"   : "Mr. Gold",
            "speakerID" : 27,
            "message"   : "I'll be here too, spending every waking moment of my immortal life trying to rip your heart out.",
            "channel"   : 1
        },
        {
            "id"        : 3,
            "startTime" : "3.43e6",
            "speaker"   : "Regina",
            "speakerID" : 16,
            "message"   : "I can be a far greater nightmare than you could ever imagine.",
            "channel"   : 12
        },
        {
            "id"        : 4,
            "startTime" : "3.53e6",
            "speaker"   : "Greg",
            "speakerID" : 18,
            "message"   : "Ay",
            "channel"   : 18
        },
        {
            "id"        : 5,
            "startTime" : "3.63e6",
            "speaker"   : "Patricia",
            "speakerID" : 7,
            "message"   : "Next",
            "channel"   : 22
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




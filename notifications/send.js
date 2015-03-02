var fs  = require("fs");
var util = require('util');
var gcm = require('node-gcm');
var message = new gcm.Message();
var inp = process.argv.slice(2); 
//API Server Key
var sender = new gcm.Sender('AIzaSyAnbj4OdGYGduIGy9o-2u2mBVxRu-T78hg');
var registrationIds = [];
 
// Value the payload data to send...
message.addData('message',inp[1]);
message.addData('title',inp[0]);
message.addData('msgcnt','3'); // Shows up in the notification in the status bar when you drag it down by the time

//message.addData('soundname','beep.wav'); //Sound to play upon notification receipt - put in the www folder in app - may not work
//message.collapseKey = 'demo';
//message.delayWhileIdle = true; //Default is false
message.timeToLive = 30000;// Duration in seconds to hold in GCM and retry before timing out. Default 4 weeks (2,419,200 seconds) if not specified.
 
// At least one reg id/token is required
fs.readFileSync('output.txt').toString().split('\n').forEach(function (line) { 
	registrationIds.push(line.toString());
});

/**
 * Parameters: message-literal, registrationIds-array, No. of retries, callback-function
 */
sender.send(message, registrationIds, 4, function (result) {
    console.log(result); //null is actually success
});

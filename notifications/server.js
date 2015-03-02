var fs  = require("fs");
var registrationIds = [];
var http = require('http');
var util=require('util');
var port = 8080;
var server = http.createServer();
var res=[];
util.puts('hello1',registrationIds);
http.createServer(function(request, response) {
    console.log("Request received");
    response.writeHeader(200, {"Content-Type": "application/json"});
    request.on('data', function (chunk) {
        registrationIds.push(chunk.toString('utf8'));
        res=registrationIds;
        console.log("res",res);
	fs.appendFileSync("output.txt", (chunk.toString('utf8')) + "\n");
        response.write(JSON.stringify({data : res}));
    });
    response.end();
util.puts('hello3',registrationIds);
    console.log("error",response);
}).listen(8080);
// function request(request, response) {
//     response.writeHead(200, {"Content-Type": "text/json"})
//     request.on('data', function(data) {
//              registrationIds.push(data);
//              util.puts('hello2',registrationIds);
//     });
//     request.on('end', function() {
//         console.log(registrationIds);
//         response.end(registrationIds);
//     });
// }
util.puts(registrationIds);
var gcm = require('node-gcm');
var message = new gcm.Message();
util.puts('hello3',registrationIds);
//API Server Key
var sender = new gcm.Sender('AIzaSyA7Dosaf0ddnTQ3b29wfTt7NpvOt--KeVc');

// Value the payload data to send...
message.addData('message', "Hello Cordova!");
message.addData('title','Push Notification Sample' );
message.addData('msgcnt','2'); // Shows up in the notification in the status bar
message.collapseKey = 'demo';
message.delayWhileIdle = true; //Default is false
message.timeToLive = 3000;// Duration in seconds to hold in GCM and retry before timing out. Default 4 weeks (2,419,200 seconds) if not specified.

/**
 * Parameters: message-literal, registrationIds-array, No. of retries,
callback-function
 */
sender.send(message, registrationIds, 4, function (err, result) {
    console.log(result);
});

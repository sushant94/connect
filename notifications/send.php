<?php



// Replace with real BROWSER API key from Google APIs
$apiKey = "AlzaSyAnbj4OdGYGdulGy9o-2u2mBVxRu-T78hg";
// Replace with real client registration IDs
$registrationIDs = array('APA91bF-8gCVGtdhFewtLL2ipivIFhL4PoyNq7WPuistc_NYDcy8BDf3FrDbd4odJyQxs0dYhV6r7i9bqVHbzeZir9SxmeUekhuJtht2gp7w9WYl0TEY1cfn9v0aTuSlk6UO_FqVEb31O1hEg0D7-nYNhL4ScZfTgeQOBpBVOHHQ0sUckbXP7WA');
// Message to be sent
$message = "there is an update, waiting for you to install...";
// Set POST variables
$url = 'https://android.googleapis.com/gcm/send';

$fields = array(
            'registration_ids'  => $registrationIDs,
            'data'              => array( "message" => $message ),
            );

$headers = array(
                'Authorization: key=' . $apiKey,
                'Content-Type: application/json'
            );

// Open connection
$ch = curl_init();

// Set the url, number of POST vars, POST data
curl_setopt( $ch, CURLOPT_URL, $url );

curl_setopt( $ch, CURLOPT_POST, true );
curl_setopt( $ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );

curl_setopt( $ch, CURLOPT_POSTFIELDS, json_encode( $fields ) );

// Execute post
$result = curl_exec($ch);

// Close connection
curl_close($ch);

echo $result;


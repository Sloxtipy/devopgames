<?
//---- IOS PUSH ----
//


// Old public function
function sendPushIOS($passphrase, $devID, $message){
		
	sendIOSPushNotification($devID,$message,NULL);	
}


// Send iOS Push To Live
function sendIOSPushNotification($token,$message,$data){

	$apns_url = 'gateway.push.apple.com';
	$pass = 'JmRrpw2015';
	$prod_cert = 'ck.pem';

	sendPushNotificationIOS($apns_url,$pass,$prod_cert,$token,$message,$data);

	// Send to test
    // se comenta produce error el dia 26 nov 2016 reportado por doctor.
    // revisar porque se esta enviando en live y en test 
	//sendIOSDevPushNotification($token,$message,$data);
}

// Send iOS Push To Test
function sendIOSDevPushNotification($token,$message,$data){

	$test_cert = 'ck_dev.pem';
	$pass = 'Temp!23456';
	$apns_url = 'gateway.sandbox.push.apple.com';

	sendPushNotificationIOS($apns_url,$pass,$test_cert,$token,$message,$data);

}

// Send iOS push
function sendPushNotificationIOS($apns_url,$passphrase,$apns_cert,$deviceToken,$message,$data){

	// -- Validation --
	
	if  ((!isset($passphrase)) || (!isset($apns_cert))  || (!isset($deviceToken))) {
		return;
	}


	// -- Payload --
	
	$payload = array();
	$payload['aps'] = array();

	// Message
	if (isset($message)) {
		$payload['aps']['alert']= $message;
	}

	// Badge
	if (isset($data['badge'])){

		$badge = $data['badge'];
		$payload['aps']['badge'] = intval($badge);

	}

	// Sound
	$payload['aps']['sound'] = 'default';

	// Data
	if (isset($data)) {
		$payload['data'] = $data;
	}

	$payload = json_encode($payload);

 
	// -- Socket Stream --

	$apns_port = 2195;

	$stream_context = stream_context_create();
	stream_context_set_option($stream_context, 'ssl', 'local_cert', $apns_cert);
	stream_context_set_option($stream_context, 'ssl', 'passphrase', $passphrase);

	$apns = stream_socket_client('ssl://' . $apns_url . ':' . $apns_port, $error, $error_string, 2, STREAM_CLIENT_CONNECT, $stream_context);

	// if (!$apns)
		//exit("Failed to connect: $err $errstr" . PHP_EOL);

	$apns_message = chr(0) . chr(0) . chr(32) . pack('H*', str_replace(' ', '', $deviceToken)) . chr(0) . chr(strlen($payload)) . $payload;
	$result = fwrite($apns, $apns_message);

	// if (!$result)
	// 	echo 'Message not delivered' . PHP_EOL;
	// else
	// 	echo 'Message successfully delivered' . PHP_EOL;

	// @socket_close($apns);
	@fclose($apns);

}


//---- ANDROID PUSH ----
//
function send_pushAndroid($devID, $msgToSend, $userID){
	
	$msgToSend = "Pediatraweb: tiene un nuevo msg"; //Quitar luego que se customize en el App
	$registrationIds = array($devID);
	
	// prep the bundle
	$msg = array
	(
		'message' 	=> $msgToSend, //'Probando un mensaje hasta android'
		'title'		=> 'Pediatraweb..',
		'subtitle'	=> '',
		'tickerText'	=> '',
		'userid'	=> $userID,
		'vibrate'	=> 1,
		'sound'		=> 1,
		'largeIcon'	=> 'large_icon',
		'smallIcon'	=> 'small_icon'
	);
	$fields = array
	(
		'registration_ids' 	=> $registrationIds,
		'data'			=> $msg
	);

	$headers = array
	(
		'Authorization: key=' . ANDROID_API_ACCESS_KEY,
		'Content-Type: application/json'
	);

	$ch = curl_init();
	curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
	curl_setopt( $ch,CURLOPT_POST, true );
	curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
	curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
	curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
	curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
	$result = curl_exec($ch );
	curl_close( $ch );

}

function send_pushDetailAndroid($devID, $msgToSend, $data){
	
	$registrationIds = array($devID);
	
	// prep the bundle
	$msg = array
	(
		'message' 	=> $msgToSend, //'Probando un mensaje hasta android'
		'title'		=> 'Pediatraweb..',
		'subtitle'	=> '',
		'tickerText'	=> '',
		'userid'	=> $data['userid'],
        'patientid' => $data['patientid'],
        'usernamemsg' => $data['usernamemsg'],
        'chatid' => $data['chatid'],
        'badge' => $data['badge'],
		'vibrate'	=> 1,
		'sound'		=> 1,
		'largeIcon'	=> 'large_icon',
		'smallIcon'	=> 'small_icon'
	);
	$fields = array
	(
		'registration_ids' 	=> $registrationIds,
		'data'			=> $msg
	);

	$headers = array
	(
		'Authorization: key=' . ANDROID_API_ACCESS_KEY,
		'Content-Type: application/json'
	);

	$ch = curl_init();
	curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
	curl_setopt( $ch,CURLOPT_POST, true );
	curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
	curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
	curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
	curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
	$result = curl_exec($ch );
	curl_close( $ch );

}

?>

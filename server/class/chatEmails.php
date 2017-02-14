<?

    
function sendClosedChatEmail($sqlsrv_conn,$title,$chat_id){


 $q = "SELECT USR_LASTNAME +', ' +USR_NAME AS DOCTORNAME FROM DefUser, Chat where F_DOCTOR=USR_ID and CHAT_ID='".$chat_id."' ";
$doctorname =  db_sqlsrv_oneValue("DOCTORNAME", $q,$sqlsrv_conn);
 $q = "SELECT USR_EMAIL FROM DefUser, Chat where F_USR=USR_ID and CHAT_ID='".$chat_id."' ";
$patientmail =  db_sqlsrv_oneValue("USR_EMAIL", $q,$sqlsrv_conn);
 $q = "SELECT patient_lastname +', ' +patient_name AS PTNAME FROM patient, Chat where F_PATIENT=PATIENT_ID and F_USR=F_PARENT and CHAT_ID='".$chat_id."' ";
$patientname =  db_sqlsrv_oneValue("PTNAME", $q,$sqlsrv_conn);
//Mail Paciente
		$mail_to = $patientmail;
		$mail_title = $title;
		$mail_html = file_get_contents('../../mails/close-chat.html');
		
		$mail_html = str_replace('|DOCTORNAME|',$doctorname,$mail_html);
		$mail_html = str_replace('|PATIENTNAME|',$patientname,$mail_html);
		
		$mail = new PHPMailer;
		$mail->isSMTP();
		$mail->SMTPOptions = array(
			'ssl' => array(
				'verify_peer' => false,
				'verify_peer_name' => false,
				'allow_self_signed' => true
			)
		);
		$mail->SMTPDebug = 0; // 0 = off (for production use)
		$mail->Debugoutput = 'html'; 
       // $mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for GMail, borrar cuando no se requiera servidor google
		$mail->SMTPAuth = true;
        
        $mail->CharSet = 'UTF-8';
		$mail->Host = $GLOBALS['config_mail_host'] ;
		$mail->Port = $GLOBALS['config_mail_port'];
		$mail->Username =$GLOBALS['config_mail_user'];
		$mail->Password = $GLOBALS['config_mail_pass'];
		$mail->setFrom($GLOBALS['config_mail_user_mail'], $GLOBALS['config_mail_user_name']);
		$mail->addReplyTo($GLOBALS['config_mail_user_mail'],  $GLOBALS['config_mail_user_name']);
		$mail->addAddress($mail_to, $mail_to);
		
		$mail->Subject = $mail_title;
		$mail->msgHTML($mail_html, dirname(__FILE__));
		$mail->AltBody = 'This is a plain-text message body';
		//Attach an image file
		//$mail->addAttachment('images/phpmailer_mini.png');
		//send the message, check for errors
		
		if (!$mail->send()) {
		//	echo "Mailer Error: " . $mail->ErrorInfo;
		} else {
		//	echo "Message sent!";
		}
}
function sendChatEmail($sqlsrv_conn,$title,$chat_id,$msgBy,$user)
{
    if ($msgBy == 1) {
		$q = "SELECT USR_LASTNAME +', ' +USR_NAME AS DOCTORNAME FROM DefUser, Chat where F_DOCTOR=USR_ID and CHAT_ID='" . $chat_id . "' ";
		$doctorname = db_sqlsrv_oneValue("DOCTORNAME", $q, $sqlsrv_conn);
		$q = "SELECT USR_EMAIL FROM DefUser, Chat where F_DOCTOR=USR_ID and CHAT_ID='" . $chat_id . "' ";
		$patientmail = db_sqlsrv_oneValue("USR_EMAIL", $q, $sqlsrv_conn);
		$q = "SELECT patient_lastname +', ' +patient_name AS PTNAME FROM patient, Chat where F_PATIENT=PATIENT_ID and F_USR=F_PARENT and CHAT_ID='" . $chat_id . "' ";
		$patientname = db_sqlsrv_oneValue("PTNAME", $q, $sqlsrv_conn);

        //Mail Paciente
		$mail_to = $patientmail;
		$mail_title = $title;
        $mail_html = file_get_contents('../../../mails/new-chat-dr.html');


		$mail_html = str_replace('|DOCTORNAME|', $doctorname, $mail_html);
		$mail_html = str_replace('|PATIENTNAME|', $patientname, $mail_html);
	}else {
        $q = "SELECT USR_LASTNAME +', ' +USR_NAME AS DOCTORNAME FROM DefUser, Chat where F_DOCTOR=USR_ID and CHAT_ID='" . $chat_id . "' ";
        $doctorname = db_sqlsrv_oneValue("DOCTORNAME", $q, $sqlsrv_conn);
        $q = "SELECT USR_EMAIL FROM DefUser, Chat where F_USR=USR_ID and CHAT_ID='" . $chat_id . "' ";
        $patientmail = db_sqlsrv_oneValue("USR_EMAIL", $q, $sqlsrv_conn);
        $q = "SELECT patient_lastname +', ' +patient_name AS PTNAME FROM patient, Chat where F_PATIENT=PATIENT_ID and F_USR=F_PARENT and CHAT_ID='" . $chat_id . "' ";
        $patientname = db_sqlsrv_oneValue("PTNAME", $q, $sqlsrv_conn);

//Mail Doctor
        $mail_to = $patientmail;
        $mail_title = $title;
        $mail_html = file_get_contents('../../../mails/new-chat.html');

        $mail_html = str_replace('|DOCTORNAME|', $doctorname, $mail_html);
        $mail_html = str_replace('|PATIENTNAME|', $patientname, $mail_html);
    }
	$mail = new PHPMailer;
	$mail->isSMTP();
	$mail->SMTPOptions = array(
		'ssl' => array(
			'verify_peer' => false,
			'verify_peer_name' => false,
			'allow_self_signed' => true
		)
	);
	$mail->SMTPDebug = 0; // 0 = off (for production use)
	$mail->Debugoutput = 'html';
	// $mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for GMail, borrar cuando no se requiera servidor google
	$mail->SMTPAuth = true;

	$mail->CharSet = 'UTF-8';
	$mail->Host = $GLOBALS['config_mail_host'] ;
	$mail->Port = $GLOBALS['config_mail_port'];
	$mail->Username =$GLOBALS['config_mail_user'];
	$mail->Password = $GLOBALS['config_mail_pass'];
	$mail->setFrom($GLOBALS['config_mail_user_mail'], $GLOBALS['config_mail_user_name']);
	$mail->addReplyTo($GLOBALS['config_mail_user_mail'],  $GLOBALS['config_mail_user_name']);
	$mail->addAddress($mail_to, $mail_to);

	$mail->Subject = $mail_title;
	$mail->msgHTML($mail_html, dirname(__FILE__));
	$mail->AltBody = 'This is a plain-text message body';
	//Attach an image file
	//$mail->addAttachment('images/phpmailer_mini.png');
	//send the message, check for errors

	if (!$mail->send()) {
	//	echo "Mailer Error: " . $mail->ErrorInfo;
	} else {
      //	echo "Message sent!";

	}
}
function initialChatEmail($sqlsrv_conn,$title,$chat_id,$msgBy,$user)
{
    $msgBy = 1;
    if ($msgBy == 1) {
        $q = "SELECT USR_LASTNAME +', ' +USR_NAME AS DOCTORNAME FROM DefUser, Chat where F_DOCTOR=USR_ID and CHAT_ID='" . $chat_id . "' ";
        $doctorname = db_sqlsrv_oneValue("DOCTORNAME", $q, $sqlsrv_conn);
        $q = "SELECT USR_EMAIL FROM DefUser, Chat where F_DOCTOR=USR_ID and CHAT_ID='" . $chat_id . "' ";
        $patientmail = db_sqlsrv_oneValue("USR_EMAIL", $q, $sqlsrv_conn);
        $q = "SELECT patient_lastname +', ' +patient_name AS PTNAME FROM patient, Chat where F_PATIENT=PATIENT_ID and F_USR=F_PARENT and CHAT_ID='" . $chat_id . "' ";
        $patientname = db_sqlsrv_oneValue("PTNAME", $q, $sqlsrv_conn);

        //Mail Paciente
        $mail_to = $patientmail;
        $mail_title = $title;
        $mail_html = file_get_contents('../../mails/new-chat-dr.html');


        $mail_html = str_replace('|DOCTORNAME|', $doctorname, $mail_html);
        $mail_html = str_replace('|PATIENTNAME|', $patientname, $mail_html);
    }else {
        $q = "SELECT USR_LASTNAME +', ' +USR_NAME AS DOCTORNAME FROM DefUser, Chat where F_DOCTOR=USR_ID and CHAT_ID='" . $chat_id . "' ";
        $doctorname = db_sqlsrv_oneValue("DOCTORNAME", $q, $sqlsrv_conn);
        $q = "SELECT USR_EMAIL FROM DefUser, Chat where F_USR=USR_ID and CHAT_ID='" . $chat_id . "' ";
        $patientmail = db_sqlsrv_oneValue("USR_EMAIL", $q, $sqlsrv_conn);
        $q = "SELECT patient_lastname +', ' +patient_name AS PTNAME FROM patient, Chat where F_PATIENT=PATIENT_ID and F_USR=F_PARENT and CHAT_ID='" . $chat_id . "' ";
        $patientname = db_sqlsrv_oneValue("PTNAME", $q, $sqlsrv_conn);

//Mail Doctor
        $mail_to = $patientmail;
        $mail_title = $title;
        $mail_html = file_get_contents('../../mails/new-chat.html');

        $mail_html = str_replace('|DOCTORNAME|', $doctorname, $mail_html);
        $mail_html = str_replace('|PATIENTNAME|', $patientname, $mail_html);
    }
    $mail = new PHPMailer;
    $mail->isSMTP();
    $mail->SMTPOptions = array(
        'ssl' => array(
            'verify_peer' => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true
        )
    );
    $mail->SMTPDebug = 0; // 0 = off (for production use)
    $mail->Debugoutput = 'html';
    // $mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for GMail, borrar cuando no se requiera servidor google
    $mail->SMTPAuth = true;

    $mail->CharSet = 'UTF-8';
    $mail->Host = $GLOBALS['config_mail_host'] ;
    $mail->Port = $GLOBALS['config_mail_port'];
    $mail->Username =$GLOBALS['config_mail_user'];
    $mail->Password = $GLOBALS['config_mail_pass'];
    $mail->setFrom($GLOBALS['config_mail_user_mail'], $GLOBALS['config_mail_user_name']);
    $mail->addReplyTo($GLOBALS['config_mail_user_mail'],  $GLOBALS['config_mail_user_name']);
    $mail->addAddress($mail_to, $mail_to);

    $mail->Subject = $mail_title;
    $mail->msgHTML($mail_html, dirname(__FILE__));
    $mail->AltBody = 'This is a plain-text message body';
    //Attach an image file
    //$mail->addAttachment('images/phpmailer_mini.png');
    //send the message, check for errors

    if (!$mail->send()) {
      //  	echo "Mailer Error: " . $mail->ErrorInfo;
    } else {
        //	echo "Message sent!";

    }
}
?>
<?
$logeado = loggedIn($sqlsrv_conn);

function getToken(){
$token = @$_SESSION['pw2015'];
	return $token;
}

function loggedIn($vConn){
$token =  getToken();
	if ($token=="")
	{
		return false;
	}
	else
	{
	$cnt = db_sqlsrv_count("DefUser","WEB_TOKEN = '".$token."'",$vConn);
		if ($cnt==0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
}
function getUsrName($vConn){

	if (loggedIn($vConn)){
		$token =  getToken();
		return db_sqlsrv_oneValue("USR_NAME", "SELECT USR_NAME FROM DefUser WHERE WEB_TOKEN = '".$token."'",$vConn);
	} else {
		return -1;
	}
}
function getUsrPss($vConn){

	if (loggedIn($vConn)){
		$token =  getToken();
		return db_sqlsrv_oneValue("USR_PASS", "SELECT USR_PASS FROM DefUser WHERE WEB_TOKEN = '".$token."'",$vConn);
	} else {
		return -1;
	}
}

function getUserID($vConn){
	if (loggedIn($vConn)){
	$token =  getToken();
	return db_sqlsrv_oneValue("USR_ID", "SELECT USR_ID FROM DefUser WHERE WEB_TOKEN = '".$token."'",$vConn);
	} else { return -1;}
}

function getUserName($vConn){
	if (loggedIn($vConn)){
	$token =  getToken();
	return db_sqlsrv_oneValue("USR_LOGIN", "SELECT USR_LOGIN FROM DefUser WHERE WEB_TOKEN = '".$token."'",$vConn);
	} else { return "";}
}

function getIsDoctor($vConn){
	if (loggedIn($vConn)){
	$token =  getToken();
	return db_sqlsrv_oneValue("IS_DOCTOR", "SELECT IS_DOCTOR FROM DefUser WHERE WEB_TOKEN = '".$token."'",$vConn);
	} else { return "-1";}
}
?>
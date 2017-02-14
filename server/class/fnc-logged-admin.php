<?
define("sesvar_admin",'pwadm2015');
$logeado = loggedIn($sqlsrv_conn);

function getToken(){
$token = @$_SESSION[sesvar_admin];
	return $token;
}

function loggedIn($vConn){
$token =  getToken();
	if ($token==""){return false;} else {
	$cnt = db_sqlsrv_count("Employee","WEB_TOKEN = '".$token."' AND INACTIVE = '0' AND ACCESS_ADMIN = '1'",$vConn);
		if ($cnt==0){return false;} else {return true;}
	}
}

function getUserID($vConn){
	if (loggedIn($vConn)){
	$token =  getToken();
	return db_sqlsrv_oneValue("EMPLOYEE_ID", "SELECT EMPLOYEE_ID FROM Employee WHERE WEB_TOKEN = '".$token."' AND INACTIVE = '0' AND ACCESS_ADMIN = '1'",$vConn);
	} else { return -1;}
}

function getUserName($vConn){
	if (loggedIn($vConn)){
	$token =  getToken();
	return db_sqlsrv_oneValue("EMPLOYEE_LOGIN", "SELECT EMPLOYEE_LOGIN FROM Employee WHERE WEB_TOKEN = '".$token."'",$vConn);
	} else { return "";}
}

?>
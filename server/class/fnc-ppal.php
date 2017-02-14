<?
//--------------------------------------------------------------------------------------------------------------------------
function getOptimalCrop($imageWidth, $imageHeight, $maxWidth, $maxHeight){
$width = $imageWidth;
$height = $imageHeight;
$heightRatio = $height / $maxHeight;
$widthRatio  = $width /  $maxWidth;
if ($heightRatio > $widthRatio) {$optimalRatio = $heightRatio;
} else {$optimalRatio = $widthRatio;}
$optimalHeight =0; $optimalWidth=0;
if ($optimalRatio>0){
$optimalHeight = $height / $optimalRatio;
$optimalWidth  = $width  / $optimalRatio;
}
return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);
}
//--------------------------------------------------------------------------------------------------------------------------
function buildImage($vImagePath){
list($width, $height, $type, $attr) = @getimagesize($vImagePath);
$dimensions = floor($width*1.5) ."x". floor($height*1.5);
$array = array(); $array = getOptimalCrop($width, $height, 240, 240);
$thumb_x = floor($array["optimalWidth"]);
$thumb_y = floor($array["optimalHeight"]);
$strHtml ='<div class=\'my-gallery\' itemscope itemtype=\'https://schema.org/ImageGallery\'>';
$strHtml.='<figure itemprop=\'associatedMedia\' itemscope itemtype=\'https://schema.org/ImageObject\'>';
$strHtml.='<a href=\''.chat_img_path.basename($vImagePath).'\' itemprop=\'contentUrl\' data-size=\''.$dimensions.'\'>';
$strHtml.='<img src=\''.chat_img_path.basename($vImagePath).'\' itemprop=\'thumbnail\' width=\''.$thumb_x.'\' height=\''.$thumb_y.'\' />';
$strHtml.='</a></figure></div>';
return $strHtml;
}
//--------------------------------------------------------------------------------------------------------------------------
function quitar_tildes($cadena) {
$no_permitidas= array ("�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","�","Ù","� ","è","ì","ò","ù","�","�","â","�","î","ô","û","Â","Ê","Î","Ô","Û","�","ö","Ö","ï","ä","�","�","Ï","Ä","Ë");
$permitidas= array ("a","e","i","o","u","A","E","I","O","U","n","N","A","E","I","O","U","a","e","i","o","u","c","C","a","e","i","o","u","A","E","I","O","U","u","o","O","i","a","e","U","I","A","E");
$texto = str_replace($no_permitidas, $permitidas ,$cadena);
return $texto;
}
//--------------------------------------------------------------------------------------------------------------------------
function getIpHash(){
return md5(@$_SERVER['REMOTE_ADDR'] . @$_SERVER['HTTP_USER_AGENT']);
}
//--------------------------------------------------------------------------------------------------------------------------
function age($ageInWeeks, $ageInMonths){
if ($ageInMonths<12){
		$age = $ageInWeeks ." semanas.";
	}  else {
		if ($ageInMonths<24){
		$age = $ageInMonths ." meses.";
		} else {
		$age_y = floor($ageInMonths/12);
		$age = $age_y ."A y ". ($ageInMonths-($age_y*12))." meses";
		}
	}
return $age;
}
//--------------------------------------------------------------------------------------------------------------------------
function is_valid_luhn($number) {
$number = preg_replace("/[^0-9]/", "", $number);
  settype($number, 'string');
  $sumTable = array(
    array(0,1,2,3,4,5,6,7,8,9),
    array(0,2,4,6,8,1,3,5,7,9));
  $sum = 0;
  $flip = 0;
  for ($i = strlen($number) - 1; $i >= 0; $i--) {
    $sum += $sumTable[$flip++ & 0x1][$number[$i]];
  }
  return $sum % 10 === 0;
}
//--------------------------------------------------------------------------------------------------------------------------
function truncateTo($text, $chars) {
    $text = $text." ";
    $text = substr($text,0,$chars);
    $text = substr($text,0,strrpos($text,' '));
    $text = $text."...";
    return $text;
}
//--------------------------------------------------------------------------------------------------------------------------

function truncate($text, $chars = 45) {
    $text = $text." ";
    $text = substr($text,0,$chars);
    $text = substr($text,0,strrpos($text,' '));
    $text = $text."...";
    return $text;
}
//--------------------------------------------------------------------------------------------------------------------------
function validatePt($vUsrID,$vToken,$vConn){
$q_from = "DefUser"; $q_where = "USR_ID = '".$vUsrID."' AND WEB_TOKEN = '".$vToken."' AND INACTIVE = '0' AND IS_DOCTOR = '0'";
$cnt = db_sqlsrv_count($q_from, $q_where, $vConn);
	if ($cnt==1){return true;} else { return false;}
}
//--------------------------------------------------------------------------------------------------------------------------
function validateDr($vUsrID,$vToken,$vConn){
$q_from = "DefUser"; $q_where = "USR_ID = '".$vUsrID."' AND WEB_TOKEN = '".$vToken."' AND INACTIVE = '0' AND IS_DOCTOR = '1'";
$cnt = db_sqlsrv_count($q_from, $q_where, $vConn);
	if ($cnt==1){return true;} else { return false;}
}
//--------------------------------------------------------------------------------------------------------------------------
function buildReceiverMsg($vMessage,$vTime,$vRow){
$message = "<div class='receiverMessage' id='div_id_".$vRow."'>".nl2br($vMessage)."<div align='left' class='notification'>Recibido a las ".$vTime."</div><div class='clearfix'></div></div><div class='clearfix'></div><br style='height:0px;'>";
return $message;
}//--------------------------------------------------------------------------------------------------------------------------
function buildFromMsg($vMessage,$vTime,$vRow){
$message = "<div class='fromMessage' id='div_id_".$vRow."'>".nl2br($vMessage)."<div align='right' class='notification'>Enviado a las ".$vTime."</div><div class='clearfix'></div></div><div class='clearfix'></div><br style='height:0px;'>";
return $message;
}
//--------------------------------------------------------------------------------------------------------------------------
function displayJson($msgJson,$vConn){
closeSQL($vConn);
header('Content-Type: application/json');
echo $msgJson;
exit();
}
//--------------------------------------------------------------------------------------------------------------------------
function logedIn($vConn){
	if (@$_SESSION["Token"] == ""){return false;} else {
	$token = $_SESSION["Token"];
	$q = "IP = '" . $_SERVER['REMOTE_ADDR'] . "' AND SES_ID = '" . $token .  "'";
	$tokenRegistry = db_sqlsrv_count("USR_SESSION",$q,$vConn);
		if ($tokenRegistry == 1){return true;} else {return false;}

	}
}
//--------------------------------------------------------------------------------------------------------------------------
function getLoggedUsr($vConn1) {
$usuarioCZ = $_SESSION["UsuarioCZ"];
$isPacient = $_SESSION["isPacient"];

	if (logedIn($vConn1)) {
	return array($usuarioCZ,$isPacient);
	} else {
	$q  = "SELECT F_USR_ID FROM USR_SESSION WHERE IP = '" . $_SERVER['REMOTE_ADDR'] . "'";
	$usuarioCZ = db_sqlsrv_oneValue("F_USR_ID",$q, $vConn1);
	$q  = "SELECT USR_PACIENT FROM USR_SESSION WHERE IP = '" . $_SERVER['REMOTE_ADDR'] . "'";
	$isPacient = db_sqlsrv_oneValue("USR_PACIENT",$q, $vConn1);
		if ($usuarioCZ != "") {
		setLoggedUsr($usuarioCZ, $vConn1);
		return array($usuarioCZ,$isPacient);
		} else {
		return array("-1","-1");
		}
	}
}
//--------------------------------------------------------------------------------------------------------------------------
function setLoggedUsr($vUser, $vConn1){
$UsuarioCZ = trim($vUser);
$Token = sha1($UsuarioCZ . date("Ymd") . mt_rand(100000,999999));
$q= "";

    $_SESSION["Token"] = $Token;
	$_SESSION["UsuarioCZ"] = $UsuarioCZ;
	$q = "DELETE FROM USR_SESSION WHERE F_USR_ID = '" . $UsuarioCZ . "' OR IP = '" . $_SERVER['REMOTE_ADDR']."'";
	db_sqlsrv_execute($q,$vConn1);

	$q = "INSERT INTO USR_SESSION (SES_ID, F_USR_ID, IP) VALUES (";
	$q.= "'" . $Token . "'";
	$q.= ", '" . $UsuarioCZ . "'";
	$q.= ", '" . $_SERVER['REMOTE_ADDR'] . "'";
	$q.= ")";
	db_sqlsrv_execute($q,$vConn1);
	return true;
}
//--------------------------------------------------------------------------------------------------------------------------
function clearLoggedUsr($vConn1){
$usuarioCZ = $_SESSION["UsuarioCZ"];
$q = "";
	$q = "DELETE FROM USR_SESSION WHERE F_USR_ID = '" . $UsuarioCZ . "'";
	db_sqlsrv_execute($q,$vConn1);
	$_SESSION["Token"] = "";
	$_SESSION["UsuarioCZ"] = "";

}
//--------------------------------------------------------------------------------------------------------------------------
function validateLogin($vUser, $vPwd, $vConn1){
$q = "id = '" . $vUser . "' AND valor = '" . encryptMe($vUser,$vPwd) . "'";
$cant = db_sqlsrv_count("CONFG_CDLU",sanitize($q),$vConn1);
	if (cant == 0) {
	return false;
	} else {
	return true;
	}
}
//--------------------------------------------------------------------------------------------------------------------------
function encryptMe($vUsr,$vPw){
return sha1(strtolower($vUsr).Pwhash.strtolower($vPw));
}
//--------------------------------------------------------------------------------------------------------------------------
function cleanInyection($vVar){
$vVar = str_replace("'","-",$vVar);
$text = sanitize($vVar);
$arr = array('CREATE', 'SELECT', 'DELETE','INSERT', 'UPDATE', 'DROP', 'EXECUTE');
for ($i=0;$i<sizeof($arr);$i++){
$text = str_replace($arr[$i],"",$text);
}
return $text;
}
//--------------------------------------------------------------------------------------------------------------------------
function sanitize($input){
if (is_array($input)) {foreach($input as $var=>$val) {$output[$var] = $val;}}
    else { if (get_magic_quotes_gpc()){$input = stripslashes($input);}$input  = cleanInput($input);
		$output = $input;//$output = mysql_real_escape_string($input);
    }return $output;
}
//--------------------------------------------------------------------------------------------------------------------------
function cleanInput($input) {
  $search = array(
    '@<script[^>]*?>.*?</script>@si',   // Strip out javascript
    '@<[\/\!]*?[^<>]*?>@si',            // Strip out HTML tags
    '@<style[^>]*?>.*?</style>@siU',    // Strip style tags properly
    '@<![\s\S]*?--[ \t\n\r]*>@'         // Strip multi-line comments
	//
  );
    $output = preg_replace($search, '', $input); return $output;
  }
//--------------------------------------------------------------------------------------------------------------------------
//Para los select
function isSelected($cmp1,$cmp2){
if ($cmp1==$cmp2){return ' selected="selected"';} else {return '';}
}
//---------------------------------------------------------------------------------------------------------------------------
//para el option
function isOption($cmp1,$cmp2){
if ($cmp1==$cmp2){return ' checked="checked"';} else {return '';}
}
//para el check
function isChecked($arreglo,$valor_actual){
if (in_array($valor_actual, $arreglo)){return ' checked="checked"';} else {return '';}
}
//---------------------------------------------------------------------------------------------------------------------------
//para la foto
function existeFoto($fotURL){
if ((file_exists($fotURL))&&(basename($fotURL)!="")){return true;} else { return false;}
}
//---------------------------------------------------------------------------------------------------------------------------
function extension($archivo){
return strtolower(pathinfo($archivo, PATHINFO_EXTENSION));
}
//---------------------------------------------------------------------------------------------------------------------------
function randomString($length = 10) {
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
//---------------------------------------------------------------------------------------------------------------------------
function generateRandoms($numOffRandoms){
$arrayRandom = array();
	for ($i=0;$i<$numOffRandoms;$i++){
	$arrayRandom[] = randomString(5);
	}
	return $arrayRandom;
}
//---------------------------------------------------------------------------------------------------------------------------
function num_mes_full($mes, $year){
if ($mes == 1){ $mes_txt = 31;
} elseif ($mes == 2){if (($year % 4)==0){$mes_txt = 29;} else {$mes_txt = 28;}
} elseif ($mes == 3){$mes_txt = 31;
} elseif ($mes == 4){$mes_txt = 30;
} elseif ($mes == 5){$mes_txt = 31;
} elseif ($mes == 6){$mes_txt = 30;
} elseif ($mes == 7){$mes_txt = 31;
} elseif ($mes == 8){$mes_txt = 31;
} elseif ($mes == 9){$mes_txt = 30;
} elseif ($mes == 10){$mes_txt = 31;
} elseif ($mes == 11){$mes_txt = 30;
} elseif ($mes == 12){$mes_txt = 31;} return ($mes_txt);
}
//---------------------------------------------------------------------------------------------------------------------------
function getMonthString($vMonth){
	if ($vMonth == 1){
	$vMonth_txt = "Enero";
	} elseif ($vMonth == 2){
	$vMonth_txt = "Febrero";
	} elseif ($vMonth == 3){
	$vMonth_txt = "Marzo";
	} elseif ($vMonth == 4){
	$vMonth_txt = "Abril";
	} elseif ($vMonth == 5){
	$vMonth_txt = "Mayo";
	} elseif ($vMonth == 6){
	$vMonth_txt = "Junio";
	} elseif ($vMonth == 7){
	$vMonth_txt = "Julio";
	} elseif ($vMonth == 8){
	$vMonth_txt = "Agosto";
	} elseif ($vMonth == 9){
	$vMonth_txt = "Septiembre";
	} elseif ($vMonth == 10){
	$vMonth_txt = "Octubre";
	} elseif ($vMonth == 11){
	$vMonth_txt = "Noviembre";
	} elseif ($vMonth == 12){
	$vMonth_txt = "Diciembre";
	}
return $vMonth_txt;
}
//---------------------------------------------------------------------------------------------------------------------------
function generatePass(){
$gen1 = mt_rand(97,122);
$gen2 = mt_rand(97,122);
$gen3 = mt_rand(97,122);
$newPass = chr($gen1).$gen1;
$newPass.= chr($gen2).$gen2;
$newPass.= chr($gen3).$gen3;
return $newPass;
}
//---------------------------------------------------------------------------------------------------------------------------
function dayOfWeek($date){
$dayoftheweek = date("N",strtotime($date));
	if ($dayoftheweek==1){
	return "Lun";
	} elseif ($dayoftheweek==2){
	return "Mar";
	} elseif ($dayoftheweek==3){
	return "Mie";
	} elseif ($dayoftheweek==4){
	return "Jue";
	} elseif ($dayoftheweek==5){
	return "Vie";
	} elseif ($dayoftheweek==6){
	return "Sab";
	} elseif ($dayoftheweek==7){
	return "Dom";
	}
}
//---------------------------------------------------------------------------------------------------------------------------

?>

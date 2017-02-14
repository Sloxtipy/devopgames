<?
$vAttributesUser = array(getLoggedUsr($sqlsrv_conn));
if (sizeof($vAttributesUser)==2){
$vUserID = $vAttributesUser[0];
$vUserPacient = $vAttributesUser[1];
} else {
echo "NLI"; closeSQL($sqlsrv_conn); exit();
}
?>
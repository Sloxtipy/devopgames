<?php
try{
    require('../globals/vars.php');
     /*$conn = new PDO('mysql:host=localhost:8080;dbname=namecus','usuario','password');*/
   //  $conn = new PDO('mysql:host=localhost:3306;dbname=namecus');
    // echo 'Conexion realizada';
    }            
catch (PDOException $ex) {
       echo $ex->getMessage();
       exit;
    }
/* @var $_POST type */

$nombre= cleanInyection($_GET["usuario"]);
$pass= cleanInyection($_GET["pass"]);
//$nombre = 'jsimo';
//$pass = '12345';

$query=("SELECT USR_NAME, USR_PASS FROM tbl_login WHERE USR_NAME = '".$nombre."' AND "."USR_PASS = ".$pass."");
$rs= mysql_query($query); 
$row=mysql_fetch_object($rs);
$nr = mysql_num_rows($rs);

if($nr == 1){
    header("Location:../dashboard");
} 

else if($nr == 0) {
     header("Location: ../server/logout.php");
}  

?>
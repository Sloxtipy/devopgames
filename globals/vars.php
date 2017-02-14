<?php
require("../server/class/fnc-ppal.php");
define('DB_SERVER','localhost:3306');
define('DB_NAME','namecus');
define('DB_USER','root');
//define('DB_PASS','TU_CLAVE');
define('DB_PASS','12345');
$con = mysql_connect(DB_SERVER,DB_USER,DB_PASS);
$pat =mysql_select_db(DB_NAME,$con);
?>
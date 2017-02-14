<?php
function verificar_login($user,$password,&$result)
{
    $sql = ("SELECT USR_NAME, USR_PASS FROM tbl_login WHERE USR_NAME = '".$nombre."' AND "."USR_PASS = ".$pass."");
    $rec = mysql_query($sql);
    $count = 0;
    while ($row = mysql_fetch_object($rec)) {
        $count++;
        $result = $row;
    }
    if ($count == 1) {
        return 1;
    } else {
        return 0;
    }
}
?>
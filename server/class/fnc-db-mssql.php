<?

define("SQLSRV_FETCH_ASSOC", MSSQL_ASSOC);

$sqlsrv_conn = mssql_connect($cnf_sqlServer, $cnf_sqlUser, $cnf_sqlPass);
if (!$sqlsrv_conn || !mssql_select_db($cnf_sqlDB, $sqlsrv_conn)) {
    die('Unable to connect or select database!');
}

function db_sqlsrv_execute($db_conection,$q){

	$bool= false; 

	if (sqlsrv_query($db_conection,$q)){
		$bool = true;
	} 

	return $bool;

}


function sqlsrv_query($db_conection,$q){
	return mssql_query($q);
}

function sqlsrv_fetch_array($stmt){
	return mssql_fetch_array($stmt, MSSQL_ASSOC);
}


function db_sqlsrv_count($q_from, $q_where, $db_conection){
	$count = 0;	
	$q = "SELECT COUNT(*) AS cuantos FROM ".$q_from; 
	if ($q_where!=""){ 
		$q.= " WHERE ".$q_where; 
	}	
	$stmt = sqlsrv_query($db_conection,$q);

	if ($row = sqlsrv_fetch_array($stmt)){
		$count = $row["cuantos"]; 
	}

	sqlsrv_free_stmt($stmt);

	return $count;
}

function db_sqlsrv_oneValue($field, $q, $db_conection){
	$valor= "";
	$stmt = sqlsrv_query($db_conection,$q); 
	if ($row = sqlsrv_fetch_array($stmt, MSSQL_ASSOC)){ 
		$valor = $row[$field];
	} 
	sqlsrv_free_stmt($stmt);
	return $valor; 
}

function db_sqlsrv_max($campo_max, $q_from, $q_where, $vConn){
	$maximo = 0; 
	$q = "SELECT MAX(".$campo_max.") AS ".$campo_max." FROM ".$q_from;
	if ($q_where!=""){ 
		$q.= " WHERE ".$q_where;
	} 
	$stmt = sqlsrv_query($vConn,$q); 
	if ($row = sqlsrv_fetch_array($stmt, MSSQL_ASSOC)){
		$maximo = $row[$campo_max];
	} ; 
	sqlsrv_free_stmt($stmt); 
	return $maximo;
}

function db_sqlsrv_next($var_cmpo,$var_tbls,$var_where, $db_conection){

	$num = db_sqlsrv_max($var_cmpo,$var_tbls,$var_where, $db_conection);
	if (trim($num=="")){
		$next = 1;
	} else {
		$next = $num + 1;
	}
	return $next;
}



function sqlsrv_free_stmt($stmt){
	mssql_free_result($stmt);
}

function closeSQL($db_conection){
	mssql_close($db_conection);
}


?>
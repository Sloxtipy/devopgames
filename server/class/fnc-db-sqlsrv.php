<?
//****************************************************************************************************************
$connectionInfo = array( "Database"=>$cnf_sqlDB, "UID"=>$cnf_sqlUser, "PWD"=>$cnf_sqlPass);
        $sqlsrv_conn = sqlsrv_connect( $cnf_sqlServer, $connectionInfo );

        if($sqlsrv_conn === false )
        {
            die("No hay conexión a SQL Server");
            exit();
}
//****************************************************************************************************************
function db_sqlsrv_max($campo_max, $q_from, $q_where, $vConn){
        $maximo = 0;
            $q = "SELECT MAX(".$campo_max.") AS ".$campo_max." FROM ".$q_from;

        if ($q_where!="")
        {
            $q.= " WHERE ".$q_where;
        }
            $stmt = sqlsrv_query($vConn,$q);
                if( $stmt === false ) {
                    if( ($errors = sqlsrv_errors() ) != null) {
                        foreach( $errors as $error ) {
                            echo "SQLSTATE: ".$error[ 'SQLSTATE']."<br />";
                            echo "code: ".$error[ 'code']."<br />";
                            echo "message: ".$error[ 'message']."<br />";
                        }
                    }
                }

        if ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC))
            {
                $maximo = $row[$campo_max];
            } ;
    sqlsrv_free_stmt($stmt);
    return $maximo;
        }
//****************************************************************************************************************
function db_sqlsrv_next($var_cmpo,$var_tbls,$var_where, $vConn){
        $num = db_sqlsrv_max($var_cmpo,$var_tbls,$var_where, $vConn);
        if (trim($num==""))
        {
            $next = 1;
        }
        else
        {
            $next = $num + 1;
        }
    return $next;
}
//****************************************************************************************************************
function db_sqlsrv_count($q_from, $q_where, $vConn){
    $count = 0;
    $q = "SELECT COUNT(*) AS cuantos FROM ".$q_from;
    if ($q_where!="")
        {
            $q.= " WHERE ".$q_where;
        }
    $stmt = @sqlsrv_query($vConn,$q)
        ;if ($row = @sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC))
    {
        $count = $row["cuantos"];
    }
    @sqlsrv_free_stmt($stmt);

    return $count;
}
//****************************************************************************************************************
function db_sqlsrv_oneValue($campo, $query, $vConn){
    $valor= "";
    $stmt = sqlsrv_query($vConn,$query);
            if( $stmt === false ) {
                if( ($errors = sqlsrv_errors() ) != null) {
                    foreach( $errors as $error ) {
                        echo "SQLSTATE: ".$error[ 'SQLSTATE']."<br />";
                        echo "code: ".$error[ 'code']."<br />";
                        echo "message: ".$error[ 'message']."<br />";
                    }
                }
            }

        if ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC))
            {
                $valor = $row[$campo];
            }
    sqlsrv_free_stmt($stmt);
    return $valor;
}
//****************************************************************************************************************
function db_sqlsrv_execute($vConn,$query){
    $bool= false;
        if (sqlsrv_query($vConn,$query))
        {
            $bool = true;
        } return $bool;
}
//****************************************************************************************************************
function closeSQL($vConn)
{
    @sqlsrv_close($vConn);
}
//****************************************************************************************************************
?>
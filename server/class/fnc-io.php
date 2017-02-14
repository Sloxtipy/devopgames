<?
function to_txt($data, $nb_txt, $type){
if ($type=="a"){$data=txt_to_string($nb_txt).$data;}
if (@file_exists($nb_txt)){@unlink($nb_txt);}
$f=@fopen($nb_txt,'w');if (!@fputs($f, $data ,strlen($data))){echo "@Error intentado colocar la data: ".$nb_txt;}@fclose($f);
}
//********************************************************
function listar_directorio($directory) {
$results = array();$handler = opendir($directory); while ($file = readdir($handler)) {
if ($file != "." && $file != ".."){$results[] = $file;}}closedir($handler);return $results;
}
//********************************************************
function vacia_dir($directory) {
if (file_exists($directory)){
$results = array();$handler = @opendir($directory); while ($file = @readdir($handler)){if ($file!= "."&&$file!= ".."){@unlink($file);}}closedir($handler);}
}
//********************************************************
function dir_size($path, $error){
$acum=0; 
if ($gestor = @opendir($path)){while (false !== ($archivo = @readdir($gestor))){$rt=$path.$archivo;
$acum=+@filesize($rt);}
   if ($acum>0){$acum= ($acum/1024);	   
   if (($acum/1024) > 1024){$i = number_format(($acum/1024), 2, ',', '.') . " Mb";
   } else {$i = number_format($acum, 2, ',', '.') . " Kb";} @closedir($gestor); return($i);
   } else { @closedir($gestor); return("0 bytes");}
	} else {
	return($error);
	}
}
//********************************************************
function txt_to_string($path){
$varfile="";if ($f=@fopen($path,'r')){while (!feof($f)){$varfile.= fgets($f, 1024);} fclose($f);}return $varfile;
}
?>
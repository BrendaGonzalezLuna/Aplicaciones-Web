<?php
$HOST = "localhost";
$USER = "root";
$PASSW = "";
$BD = "utt";


$con = mysqli_connect($HOST, $USER, $PASSW, $BD);
if ($con)
{
	/*echo "Conexion Exitosa con la BD";*/
	echo "<br>";
}
else
{
	echo "Error en la conexion";
}
?>
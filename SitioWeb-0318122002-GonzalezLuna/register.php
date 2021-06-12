<?php
require 'conexion.php';
require 'validacion.php';

$errores = array();

if(!empty($_POST))
{
    $nombre = $_POST['nombre'];
    $usuario = $_POST['usuario'];
    $email = $_POST['email'];
    $favorita = $_POST['favorita'];
    $carrera = $_POST['carrera'];
    $pasatiempo = $_POST['pasatiempo'];


    if(isNull($nombre, $usuario, $email, $favorita, $carrera, $pasatiempo))
    {
        echo'<script type="text/javascript">
        alert("Debe llenar todos los campos.");
        </script>';
    }


    $query = "insert into maestro(nombre, usuario, email, favorita, carrera, pasatiempo)
	values('$nombre', '$usuario', '$email',  '$favorita', '$carrera', $pasatiempo);";
	        
	$consulta = mysqli_query($con, $query);
	echo'<script type="text/javascript">
    alert("Registro exitoso.");
    </script>';
			
}
    
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Registro</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4"> Registrar maestros!</h1>
                            </div>
                            <form class="user" autocomplete="off" method="post" action="register.php">
                             <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            name="nombre" placeholder="Nombre" value="<?php if(isset($nombre)) echo $nombre; ?>" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            name="usuario" placeholder="Usuario">
                                    </div>
                            </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" name="email"
                                        placeholder="Correo electronico" value="<?php if(isset($email)) echo $email; ?>" required>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            name="favorita" placeholder="Comida favorita" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            name="pasatiempo" placeholder="Pasatiempo">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <select  class="custom-select" name="carrera">
                                    <?php 
                                    $query =  ('SELECT * FROM carrera');
                                    $consulta = mysqli_query($con, $query);
                                          foreach($consulta as $ub):?>{

                                             <option value ="<?php echo $ub ['id'];?>"> <?php echo $ub['nombre']?></option>
                                          }
                                        <?php endforeach; ?>   
                                    </select>
                                </div>
                               <br>
                                <input id = "submit" type = "submit"  name = "Guardar" value = "Registrarse" class="btn btn-primary btn-user btn-block">
                                </input>
                                
                                
                            </form>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>



</body>

</html>
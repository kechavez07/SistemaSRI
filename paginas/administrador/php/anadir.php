<?php 

include("db.php");

if(isset($_POST['anadir'])) {
    echo "si entra al metodo anadir"; //si existe save, guardar en cada variable los datos ingresados por el usuario
    $nombre=$_POST['nombres'];  //guardo cada dato ingredado
    $apellido=$_POST['apellidos'];
    $cedula=$_POST['cedula'];   
    $contrasena=$_POST['contrasena'];
    $email=$_POST['correo'];

    $query="INSERT INTO usuario (IDROL,CEDULA,NOMBREU,APELLIDOU,CONTRASENA,CORREO) VALUES ('2','$cedula','$nombre', '$apellido','$contrasena','$email')"; //guardo cada variable en la tabla usuario de mi base de datos
    $result=mysqli_query($conn, $query); 

    if (!$result) { //si result no es cierto dar un mensaje de fail
        die("Fallo la grabacion");
    }


}

?>
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
//Ingreso datos de proveedor
if(isset($_POST['anadirProvedor'])) {
    //echo "si entra al metodo anadir"; //si existe save, guardar en cada variable los datos ingresados por el usuario
    $nombreEmpresa=$_POST['nombreEmpresa'];  //guardo cada dato ingresado
    $direccion=$_POST['direccion'];
    $telefono=$_POST['telefono'];   
    $email=$_POST['email'];
    $servicios=$_POST['servicios'];

    $query="INSERT INTO proveedor (IDPROVEEDOR,NOMBREEMPRESA,DIRECCION,TELEFONO,EMAIL,SERVICIOS) VALUES (NULL,'$nombreEmpresa','$direccion', '$telefono','$email','$servicios')"; //guardo cada variable en la tabla usuario de mi base de datos
    $result=mysqli_query($conn, $query); 

    if (!$result) { //si result no es cierto dar un mensaje de fail
        die("Fallo la grabacion");
    }
}
if(isset($_POST['anadirProducto'])) {
    //echo "si entra al metodo anadir"; //si existe save, guardar en cada variable los datos ingresados por el usuario
    $nombreEmpresa=$_POST['nombreEmpresa'];  //guardo cada dato ingresado
    $direccion=$_POST['direccion'];
    $telefono=$_POST['telefono'];   
    $email=$_POST['email'];
    $servicios=$_POST['servicios'];

    $query="INSERT INTO proveedor (IDPROVEEDOR,NOMBREEMPRESA,DIRECCION,TELEFONO,EMAIL,SERVICIOS) VALUES (NULL,'$nombreEmpresa','$direccion', '$telefono','$email','$servicios')"; //guardo cada variable en la tabla usuario de mi base de datos
    $result=mysqli_query($conn, $query); 

    if (!$result) { //si result no es cierto dar un mensaje de fail
        die("Fallo la grabacion");
    } 
    else {
        echo "<script>alert('Proveedor registrado con éxito');</script>";
        echo "<script>window.location.href = '../html/añadirProveedor.html';</script>"; // Cambia 'ruta_a_tu_pagina.html' por la página de destino que quieras redirigir
    }
}
?>
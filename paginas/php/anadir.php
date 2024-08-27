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
    else {
    echo "<script>alert('Usuario creado con exito');</script>";
    echo "<script>window.location.href = '../html/añadirUV.html';</script>";
}

}
//Ingreso datos de proveedor
include("db.php");

if(isset($_POST['anadirProvedor'])) {
    $nombreEmpresa = $_POST['nombreEmpresa'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];   
    $email = $_POST['email'];
    $servicios = $_POST['servicios'];

    $query = "INSERT INTO proveedor (IDPROVEEDOR, NOMBREEMPRESA, DIRECCION, TELEFONO, EMAIL, SERVICIOS) VALUES (NULL, '$nombreEmpresa', '$direccion', '$telefono', '$email', '$servicios')";

    // Ejecutar la consulta y comprobar si se ejecutó correctamente
    if (!mysqli_query($conn, $query)) {
        echo "Error en la grabación: " . mysqli_error($conn);
    } else {
        echo "<script>alert('Proveedor registrado con éxito');</script>";
        echo "<script>window.location.href = '../html/añadirProveedor.html';</script>";
    }
}
if(isset($_POST['anadirProducto'])) {
    //echo "si entra al metodo anadir"; //si existe save, guardar en cada variable los datos ingresados por el usuario
    $codigo=$_POST['codigo'];  //guardo cada dato ingresado
    $nombreprod=$_POST['nombreprod'];
    $categoria=$_POST['categoria'];   
    $descripcion=$_POST['descripcion'];
    $cantidad=$_POST['cantidad'];
    $precio=$_POST['precio'];

    $query="INSERT INTO producto (IDPRODUCTO,CODIGO,NOMBREPRODUCTO,IDCATEGORIA,DESCRIPCION,PRECIO) VALUES (NULL,'$codigo','$nombreprod', '$categoria','$descripcion','$precio')"; //guardo cada variable en la tabla usuario de mi base de datos
    $result=mysqli_query($conn, $query); 

    if (!$result) { //si result no es cierto dar un mensaje de fail
        die("Fallo la grabacion");
    } 
    else {
        echo "<script>alert('Proveedor registrado con éxito');</script>";
        echo "<script>window.location.href = '../html/añadirProveedor.html';</script>";
    }
}
?>
<?php
include 'db.php';


$sql = "SELECT IDUSUARIO, IDROL, CEDULA,CONTRASENA FROM usuario";
$result = $conn->query($sql);


if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    //echo "id: " . $row["IDUSUARIO"]. " - id rol: " . $row["IDROL"]. " " . $row["NOMBREUSUARIO"]. $row["CONTRASENA"]."<br>";
    if($row["CEDULA"] == $_POST['username'] && $row["CONTRASENA"] == $_POST['password']){
      if($row["IDROL"] == 1){
        header("Location: ../paginas/administrador/paginaInicioAdministrador.php");
      }else if($row["IDROL"] == 2){
        header("Location: ../paginas/ventas/paginaInicioVentas.php");
      }else if($row["IDROL"] == 3){
        header("Location: ../paginas/bodega/paginaInicioBodega.php");
      }
    }else{
      echo "Usuario o contraseña incorrectos";
    }
  }
} else {
  echo "0 results";
}

$conn->close();
?>
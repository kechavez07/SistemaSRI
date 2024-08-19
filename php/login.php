<?php
$servername = "localhost";
$username = "admin";
$password = "admin";
$dbname = "peluqueria";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT IDUSUARIO, IDROL, NOMBREUSUARIO,CONTRASENA FROM usuario";
$result = $conn->query($sql);


if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    //echo "id: " . $row["IDUSUARIO"]. " - id rol: " . $row["IDROL"]. " " . $row["NOMBREUSUARIO"]. $row["CONTRASENA"]."<br>";
    if($row["NOMBREUSUARIO"] == $_POST['username'] && $row["CONTRASENA"] == $_POST['password']){
      if($row["IDROL"] == 1){
        header("Location: ../html/paginaInicioAdministrador.html");
      }else if($row["IDROL"] == 2){
        header("Location: ../html/paginaInicioVentas.html");
      }else if($row["IDROL"] == 3){
        header("Location: ../html/paginaInicioBodega.html");
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
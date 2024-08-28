<?php
include '../configuraciones/php/db.php';

$user = $_POST['username'];
$pass = $_POST['password'];

$user = $conn->real_escape_string($user);
$pass = $conn->real_escape_string($pass);

$sql = "SELECT * FROM usuario WHERE CEDULA = '$user' AND CONTRASENA= '$pass'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $idUsuario = $row['IDROL'];
    echo json_encode([ 'idUsuario' => $idUsuario,'cedula'=> $row['CEDULA'], 'nombre' => $row['NOMBREU'], 'apellido' => $row['APELLIDOU'], 'correo' => $row['CORREO'],'estado' => $row['ESTADO']]);
} else {
    echo json_encode(['status' => 'error']);
}

$conn->close();
?>

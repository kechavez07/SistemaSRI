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
    $idUsuario = $row['IDUSUARIO'];
    // Devolver una respuesta JSON
    echo json_encode(['status' => 'success', 'idUsuario' => $idUsuario]);
} else {
    echo json_encode(['status' => 'error']);
}

$conn->close();
?>

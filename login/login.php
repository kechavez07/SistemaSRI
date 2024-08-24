<?php

$servername = "localhost";
$username = "admin";
$password = "admin";
$dbname = "peluqueria";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$user = $_POST['username'];
$pass = $_POST['password'];

$user = $conn->real_escape_string($user);
$pass = $conn->real_escape_string($pass);

$sql = "SELECT * FROM usuario WHERE CEDULA = '$user' AND CONTRASENA= '$pass'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    
    echo "success";
} else {
    
    echo "error";
}

$conn->close();
?>

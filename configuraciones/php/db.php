<?php
$servername = "localhost";
$username = "admin";
$password = "admin";
$dbname = "peluqueria";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
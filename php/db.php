<?php
session_start();
$conn = mysqli_connect(
  'localhost',
  'admin',
  'admin',
  'peluqueria'
);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

?>
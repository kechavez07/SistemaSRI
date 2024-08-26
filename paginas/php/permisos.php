<?php
// Conexión a la base de datos
$conn = new mysqli("localhost", "admin", "admin", "peluqueria");

// Verificar la conexión
if ($conn->connect_errno) {
    die("Error al conectar con la base de datos: " . $conn->connect_error);
}

$idUsuario = $_POST['idUsuario'];

// Consulta para obtener los datos de las cartas
$query = "SELECT * FROM paginas WHERE IDROL = '$idUsuario'";
$result = $conn->query($query);

// Arreglo para almacenar los datos
$cards = array();

while ($row = $result->fetch_assoc()) {
    $cards[] = array(
        'title' => $row['TITLE'],
        'description' => $row['DESCRIPTION'],
        'link' => $row['LINK'],
    );
}


echo json_encode($cards);

$conn->close();
?>


<?php
// Conexión a la base de datos
include 'db.php';
$action = $_POST['accion'];

if ($action == 'categoria') {
    $query = "SELECT * FROM categoria";
    $result = $conn->query($query);

    if (!$result) {
        die('Error en la consulta: ' . $conn->error);
    }

    $categoria = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $categoria[] = array(
                'id' => $row['IDCATEGORI'],   // Corregido de 'IDPOROVEEDOR' a 'IDPROVEEDOR'
                'categoria' => $row['CATEGORIA'],
            );
        }
    } else {
        echo json_encode([]);
        return;
    }

    echo json_encode($categoria);
    $conn->close();
}

?>


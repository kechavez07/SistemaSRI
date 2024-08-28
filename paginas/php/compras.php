<?php
// Conexión a la base de datos
include 'db.php';
$action = $_POST['accion'];

if ($action == 'proveedores') {
    $query = "SELECT * FROM proveedor";
    $result = $conn->query($query);

    if (!$result) {
        die('Error en la consulta: ' . $conn->error);
    }

    $proveedor = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $proveedor[] = array(
                'id' => $row['IDPROVEEDOR'],   // Corregido de 'IDPOROVEEDOR' a 'IDPROVEEDOR'
                'nombreEmpresa' => $row['NOMBREEMPRESA'],
                'direccion' => $row['DIRECCION'],
                'telefono' => $row['TELEFONO'],
                'email' => $row['EMAIL'],
                'servicios' => $row['SERVICIOS'],
                'estado' => $row['estado'],
            );
        }
    } else {
        echo json_encode([]);
        return;
    }

    echo json_encode($proveedor);
    $conn->close();
}


// Consulta para obtener los datos de las cartas

?>


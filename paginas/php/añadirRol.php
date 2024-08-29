<?php
include 'db.php';
$action = $_POST['accion'];

if ($action == 'roles') {
    $query = "SELECT * FROM rol";
    $result = $conn->query($query);

    if (!$result) {
        die('Error en la consulta: ' . $conn->error);
    }

    $proveedor = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $proveedor[] = array(
                'id' => $row['IDROL'],   
                'rol' => $row['ROL'],
                );
        }
    } else {
        echo json_encode([]);
        return;
    }

    echo json_encode($proveedor);
    $conn->close();
}

if ($action == 'compras') {
    
    $bodeguero = $_POST['bodeguero'];
    $proveedor = $_POST['proveedor'];
    $fechaHora = $_POST['fechaHora'];
    $repartidor = $_POST['repartidor'];
    $productos = json_decode($_POST['productos'], true);
    
    
    if (json_last_error() !== JSON_ERROR_NONE) {
        echo json_encode(['error' => 'Error al decodificar JSON de productos']);
        exit;
    }
    
    $query = "INSERT INTO entrega( IDPROVEEDOR,IDUSUARIO, FECHAENTREGA, REPARTIDOR) VALUES ('$proveedor','$bodeguero', '$fechaHora', '$repartidor')";
    $result = $conn->query($query);
    if (!$result) {
        echo json_encode(['error' => 'Error al insertar entrega: ' . $conn->error]);
    } else {
        $query = "SELECT MAX(IDENTREGA) AS ID FROM entrega";
        $result = $conn->query($query);
        if (!$result) {
            die('Error en la consulta: ' . $conn->error);
        } else {
            $idEntrega = $result->fetch_assoc();
            $idEntrega = $idEntrega['ID'];
            $query = "INSERT INTO detalleentrega (IDENTREGA, IDPRODUCTO, CANTIDADENTREGADA) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($query);

            if (!$stmt) {
                die('Error en la preparación de la consulta: ' . $conn->error);
            }

            foreach ($productos as $producto) {
                $stmt->bind_param('iii', $idEntrega, $producto['idproducto'], $producto['cantidad']);
                
                if (!$stmt->execute()) {
                    die('Error en la ejecución de la consulta: ' . $stmt->error);
                }
            }

            $stmt->close();
            echo json_encode(['success' => 'Productos enviados correctamente']);
        }
        echo json_encode(['success' => 'Productos enviados correctamente']);
    }
    
} 

?>


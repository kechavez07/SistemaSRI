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

if ($action == 'productos') {
    
    $codigo = $_POST['codigo'];
    $producto = $_POST['producto'];
    $categoria = $_POST['categoria'];
    $descripcion = $_POST['descripcion'];
    $precio = $_POST['precio'];
    
    $query = "INSERT INTO producto( IDPRODUCTO,CODIGO, NOMBREPRODUCTO, IDCATEGORI, DESCRIPCION, PRECIO) VALUES ('$producto', $codigo,'$categoria', '$descripcion', '$precio')";
    $result = $conn->query($query);
    if (!$result) {
        echo json_encode(['error' => 'Error al insertar entrega: ' . $conn->error]);
    } else {
        $query = "SELECT MAX(IDENTREGA) AS ID FROM entrega";
        $result = $conn->query($query);
        if (!$result) {
            die('Error en la consulta: ' . $conn->error);
        } else {
            echo json_encode(['success' => 'Productos enviados correctamente']);
        }
    }
    
} 

?>


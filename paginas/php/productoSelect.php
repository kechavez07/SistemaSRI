<?php
include("db.php");

$sql = "SELECT * FROM categoria"; 
$result = $conn->query($sql);

$categories = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $categories[] = array(
            'id' => $row['IDCATEGORI'],
            'categoria' => $row['CATEGORIA'],
        );
    }
}else {
    echo json_encode(array("error" => "No se encontraron datos."));
}

// Devolver datos en formato JSON
echo json_encode($categories);

$conn->close();
?>
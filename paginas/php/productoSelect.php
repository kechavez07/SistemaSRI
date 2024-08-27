<?php
include("db.php");

$sql = "SELECT * FROM categoria"; 
$result = $conn->query($sql);

$categories = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $categories[] = $row;
    }
}

$conn->close();

// Devolver datos en formato JSON
echo json_encode($categories);
?>
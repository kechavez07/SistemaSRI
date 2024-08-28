<?php
$sql = "SELECT IDROL, NOMBRE FROM rol"; // Asegúrate de que esta consulta corresponda a tu tabla de roles
$result = $conn->query($sql);

$roles = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $roles[] = $row;
    }
}

echo json_encode($roles);

$conn->close();
?>
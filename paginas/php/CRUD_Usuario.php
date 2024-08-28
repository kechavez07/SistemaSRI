<?php
$action = $_POST['action'];
$crud = new CrudUsuario();

if ($action == 'create') {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $cedula = $_POST['cedula'];
    $contrasena = $_POST['contrasena'];
    $correo = $_POST['correo'];
    $idrol = $_POST['idrol'];
    $data = $crud->create($nombre, $apellido, $cedula, $contrasena, $correo, $idrol);
    echo $data;
} elseif ($action == 'read') {
    $data = $crud->read();
    echo $data;
} elseif ($action == 'edit') {
    $id = $_POST['id'];
    $data = $crud->edit($id);
    echo $data;
} elseif ($action == 'delete') {
    $id = $_POST['id'];
    $data = $crud->delete($id);
    echo $data;
} elseif ($action == 'update') {
    $id_p = $_POST['id_p'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $cedula = $_POST['cedula'];
    $contrasena = $_POST['contrasena'];
    $correo = $_POST['correo'];
    $idrol = $_POST['idrol'];
    $data = $crud->update($id_p, $nombre, $apellido, $cedula, $contrasena, $correo, $idrol);
    echo $data;
}

class CrudUsuario {
    public $conn = null;

    function __construct() {
        $this->conn = new mysqli('localhost', 'admin', 'admin', 'peluqueria');
        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }

    function create($nombre, $apellido, $cedula, $contrasena, $correo, $idrol) {
        $stmt = $this->conn->prepare("INSERT INTO usuario (NOMBREU, APELLIDOU, CEDULA, CONTRASENA, CORREO, IDROL) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssi", $nombre, $apellido, $cedula, $contrasena, $correo, $idrol);
        if ($stmt->execute()) {
            return 'true';
        } else {
            return 'false';
        }
    }

   
    function edit($id) {
        $stmt = $this->conn->prepare("SELECT * FROM usuario WHERE IDUSUARIO = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $jsondata = array();
        if ($row = $result->fetch_assoc()) {
            $jsondata['id'] = $row['IDUSUARIO'];
            $jsondata['nombre'] = $row['NOMBREU'];
            $jsondata['apellido'] = $row['APELLIDOU'];
            $jsondata['cedula'] = $row['CEDULA'];
            $jsondata['contrasena'] = $row['CONTRASENA'];
            $jsondata['correo'] = $row['CORREO'];
            $jsondata['idrol'] = $row['IDROL'];
            $jsondata['estado'] = $row['ESTADO'];
            header('Content-type: application/json; charset=utf-8');
            return json_encode($jsondata);
        }
    }

    function delete($id) {
        $stmt = $this->conn->prepare("UPDATE usuario SET ESTADO = 'Inactivo' WHERE IDUSUARIO = ?");
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            return "true";
        } else {
            return "false";
        }
    }

    function update($id_p, $nombre, $apellido, $cedula, $contrasena, $correo, $idrol) {
        $stmt = $this->conn->prepare("UPDATE usuario SET NOMBREU = ?, APELLIDOU = ?, CEDULA = ?, CONTRASENA = ?, CORREO = ?, IDROL = ? WHERE IDUSUARIO = ?");
        $stmt->bind_param("ssssiii", $nombre, $apellido, $cedula, $contrasena, $correo, $idrol, $id_p);
        if ($stmt->execute()) {
            return 'true';
        } else {
            return 'false';
        }
    }
}
?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="../css/estilosAdmin.css" type="text/css" rel="stylesheet">
<title>Documento sin título</title>
</head>

<body>
  <?php include '../../prueba.php'; ?>
<div class="card max-w-2xl mx-auto p-6 sm:p-8 md:p-10">
  <div class="card-header">
    <h1 class="card-title text-3xl font-bold">Ingreso de Proveedores</h1>
  </div>
	<div class="card-content">
    <form id="form1" name="form1" method="post" class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div class="grid gap-4">
        <div class="grid gap-2">
          <label for="textfield" class="text-sm font-medium">Nombre Empresa:</label>
        <input type="text" name="textfield" id="textfield">
        </div>
      </div>
      <div class="grid gap-2">
        
          <label for="textfield2">Dirección:</label>
          <textarea id="address" rows="3" placeholder="" class="textarea"></textarea>
      </div>
      <div class="grid grid-cols-2 gap-4">
        <label for="tel">Telefono:</label>
        <input type="tel" name="tel" id="tel">
      </div>
        
      <p>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email">
      </p>
      <p>
          <label for="textfield3">Servicios:</label>
        <input type="text" name="textfield3" id="textfield3">
      </p>
      <p>
        <input type="submit" name="submit" id="submit" value="Enviar">
        <input type="reset" name="reset" id="reset" value="Restablecer">
      </p>
    </form>
  </div>
    
    </div>
    <script>
        var idUsuario = localStorage.getItem("idUsuario");
        console.log(idUsuario);
    </script>
</body>
</html>

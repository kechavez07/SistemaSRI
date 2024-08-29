$(document).ready(function() {
    var usuario = JSON.parse(localStorage.getItem("usuario"));
    console.log(usuario);
    document.getElementById('admin').value = usuario.nombre + " " + usuario.apellido;
    let now = new Date();

// Obtener los componentes de la fecha y hora
    let day = String(now.getDate()).padStart(2, '0');
    let month = String(now.getMonth() + 1).padStart(2, '0'); // Los meses en JavaScript van de 0 a 11
    let year = String(now.getFullYear()).slice(-2); // Obtener los últimos dos dígitos del año
    let hours = String(now.getHours()).padStart(2, '0');
    let minutes = String(now.getMinutes()).padStart(2, '0');

    // Formatear la fecha como DD/MM/AA HORA:MINUTOS
    let formattedDateTime = `${day}/${month}/${year} ${hours}:${minutes}`;

    // Asignar el valor formateado al campo de entrada
    document.getElementById('fechaHoraActual').value = formattedDateTime;


    loadRoles();

    function loadRoles() {
        $.ajax({
            url: '../php/añadirUsuario.php', // Archivo PHP que devolverá los datos
            type: 'POST',
            data: {
                accion: 'roles'   
            },
            success: function(response) {
                var data = JSON.parse(response);
                
                if (Array.isArray(data) && data.length > 0) {
                    data.forEach(item => {
                        const opcion = document.createElement('option');
                        opcion.value = item.rol;
                        $('#listRol').append(opcion);
                    });
                } else {
                    $('#listRol').append('<p>No hay roles disponibles.</p>');
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
                alert("Error al cargar los roles");
            }
        });
    }
    


});

$('#ingresar').click(function() { 
    var usuario = JSON.parse(localStorage.getItem("usuario"));
    var bodeguero = usuario.id;
    var proveedor = $('#listProveedor').val();
    var fechaHora = $('#fechaHoraActual').val();
    var total = $('#total').val();
    var productos = JSON.parse(localStorage.getItem("productos"));

    if (productos.length == 0) {
        alert("No hay productos en la lista");
        return;
    }

    var productosJson = JSON.stringify(productos);

    $.ajax({
        url: '../php/compras.php',
        type: 'POST',
        data: {
            accion: 'ingresar',
            bodeguero: bodeguero,
            proveedor: proveedor,
            fechaHora: fechaHora,
            total: total,
            productos: productosJson
        },
        success: function(response) {
            console.log(response);
            if (response == 1) {
                alert("Compra ingresada correctamente");
                localStorage.removeItem("productos");
                window.location.href = "compras.html";
            } else {
                alert("Error al ingresar la compra");
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
            alert("Error al ingresar la compra");
        }
    });



});
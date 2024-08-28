$(document).ready(function() {
    var usuario = JSON.parse(localStorage.getItem("usuario"));
    console.log(usuario);
    document.getElementById('bodeguero').value = usuario.nombre + " " + usuario.apellido;
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


    loadProveedores();

    function loadProveedores() {
        $.ajax({
            url: '../php/compras.php', // Archivo PHP que devolverá los datos
            type: 'POST',
            data: {
                accion: 'proveedores'   
            },
            success: function(response) {
                var data = JSON.parse(response);
                
                if (Array.isArray(data) && data.length > 0) {
                    data.forEach(item => {
                        const opcion = document.createElement('option');
                        opcion.value = item.nombreEmpresa;
                        $('#listProveedor').append(opcion);
                    });
                } else {
                    $('#listProveedor').append('<p>No hay proveedores disponibles.</p>');
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
                alert("Error al cargar las categorías");
            }
        });
    }
    

});


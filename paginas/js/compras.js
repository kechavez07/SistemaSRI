
var listaProductos = [];
var proveedorID = null;
var usuario = JSON.parse(localStorage.getItem("usuario"));

$(document).on('ready',function(event) {
    event.preventDefault();
    inicio();
    loadProveedores();

    // Cargar productos y luego configurar el evento de clic
    loadProductos().then(productos => {
        $('#ingresar').click(function() {
            var nproducto = document.getElementById('producto').value; 
            var cantidad = document.getElementById('cantidad').value;
            var observacion = document.getElementById('observacion').value;
            var codigo = 0;
                
            productos.forEach(item => {
                if (item.nombreProducto == nproducto) {
                    codigo = item.codigo;
                    listaProductos.push({
                        idproducto: item.id, 
                        producto: nproducto,  
                        cantidad: cantidad,
                    });
                }
            });
    
            var fila = '<tr><td>' + codigo + '</td><td>' + nproducto + '</td><td>' + cantidad + '</td><td>' + observacion + '</td></tr>';
            $('#tablaProductos').append(fila);
            document.getElementById('producto').value = '';
            document.getElementById('cantidad').value = '';
            document.getElementById('observacion').value = '';
        });
    });



    function loadProductos() {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '../php/compras.php', // Archivo PHP que devolverá los datos
                type: 'POST',
                data: {
                    accion: 'productos'   
                },
                success: function(response) {
                    var data = JSON.parse(response);
                    
                    if (Array.isArray(data) && data.length > 0) {
                        data.forEach(item => {
                            const opcion = document.createElement('option');
                            opcion.value = item.nombreProducto;
                            $('#listProducto').append(opcion);
                        });
                        resolve(data);
                    } else {
                        $('#listProducto').append('<p>No hay proveedores disponibles.</p>');
                        resolve([]);
                    }
                },
                error: function(textStatus, errorThrown) {
                    console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
                    reject(errorThrown);
                }
            });
        });
    }

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
                        opcion.id = item.id;
                        opcion.value = item.nombreEmpresa;
                        $('#listProveedor').append(opcion);

                    });
                } else {
                    $('#listProveedor').append('<p>No hay proveedores disponibles.</p>');
                }
            },
            error: function( textStatus, errorThrown) {
                console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
            }
        });
    }

});


function guardar(){
        console.log('Enviando lista de productos:', listaProductos);
        $.ajax({
            url: '../php/compras.php',
            type: 'POST',
            data: {
                accion: 'compras',
                bodeguero: usuario.id,
                fechaHora: document.getElementById('fechaHoraActual').value,
                proveedor: proveedorID,
                repartidor: document.getElementById('repartidor').value + " " + document.getElementById('cedula').value,
                productos: JSON.stringify(listaProductos), 
            },
            success: function(response) {
                if(response == 'error'){
                    console.log('Error al enviar los productos');
                }
                console.log('Productos enviados correctamente');
                alert('Compra realizada con éxito');
            limpiar();
                
            }
        });
        
}


function inicio() {
    
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
}



  
document.getElementById('proveedor').addEventListener('input', function() {
    const proveedorInput = document.getElementById('proveedor');
    const listProveedor = document.getElementById('listProveedor');

    const currentValue = proveedorInput.value;

    const selectedOption = Array.from(listProveedor.options).find(option => option.value === currentValue);

    if (selectedOption) {
      proveedorID = selectedOption.getAttribute('id');
      console.log('ID del proveedor seleccionado:', proveedorID);
    } else {
      proveedorID = null;
    }
    
    
});

document.getElementById('reset').addEventListener('click', limpiar);

document.getElementById('repartidor').addEventListener('blur', function() {
    repartidorInput = document.getElementById('repartidor').value;
    const errorSpan =  document.getElementById('repartidor').nextElementSibling;

    if (repartidorInput == 0) {
        errorSpan.innerText = 'El campo no puede estar vacío';
        errorSpan.classList.add('error');
    }
    if (/\d/.test(repartidorInput)) {
        errorSpan.textContent = 'El campo no puede contener números';
        errorSpan.classList.add('error');
    } else {
        errorSpan.textContent = '';
        errorSpan.classList.remove('error');
        errorSpan.classList.add('bien');
    }


});

document.getElementById('cedula').addEventListener('blur', function() {
    cedulaInput = document.getElementById('cedula').value;
    const errorSpan =  document.getElementById('cedula').nextElementSibling;

    if (cedulaInput == 0) {
        errorSpan.innerText = 'El campo no puede estar vacío';
        errorSpan.classList.add('error');
    }
    if (!/\d/.test(cedulaInput)) {
        errorSpan.textContent = 'El campo debe contener solo números';
        errorSpan.classList.add('error');
    }
    if (cedulaInput.length != 10) {
        errorSpan.textContent = 'El campo debe contener 10 dígitos';
        errorSpan.classList.add('error');
    } else {
        errorSpan.textContent = '';
        errorSpan.classList.remove('error');
        errorSpan.classList.add('bien');
    }
});

function limpiar() {
    listaProductos = [];
    var table = document.getElementById('tablaProductos');
    var rowCount = table.rows.length;
    for (var i = rowCount - 1; i > 0; i--) {
        table.deleteRow(i);
    }
    document.getElementById('producto').value = '';
    document.getElementById('cantidad').value = '';
    document.getElementById('observacion').value = '';
    document.getElementById('repartidor').value = '';
    document.getElementById('cedula').value = '';
    document.getElementById('proveedor').value = '';
}
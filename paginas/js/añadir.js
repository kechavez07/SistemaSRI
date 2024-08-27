$(document).ready(function() {
    // Cargar las cartas cuando la página se haya cargado
    loadCategoria();

    function loadCategoria() {
        $.ajax({
            url: '../php/productoSelect.php', // Archivo PHP que devolverá los datos
            type: 'POST', 
            success: function(response) {
                var data = JSON.parse(response);
                
                if (Array.isArray(data) && data.length > 0) {
                    data.forEach(item => {
                        const opcion = document.createElement('option');
                        opcion.value = item.id;
                        opcion.name = item.categoria;
                        opcion.innerText = item.categoria;
                        document.getElementById('categoria').appendChild(opcion);
                        
                    });
                } else {
                    $('#card-container').append('<p>No hay categorias disponibles.</p>');
                }
            },
            error: function(textStatus, errorThrown) {
                console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
                alert("Error al cargar las categorías");
            }
        });
    }
    
    

});


$('#categoria').change(function() {
    var categoria = $('#categoria option:selected').text();
    console.log(categoria);
    $('#busCategoria').val(categoria);
});
$(document).ready(function() {
    // Cargar las cartas cuando la página se haya cargado
    loadCards();

    function loadCards() {
        var idUsuario = localStorage.getItem("idUsuario");
        //console.log(idUsuario);
        alert(idUsuario);
        $.ajax({
            url: 'php/permisos.php', // Archivo PHP que devolverá los datos
            type: 'POST', 
            data: {
                idUsuario: idUsuario
            },
            success: function(response) {
                
                var data = JSON.parse(response);
                console.log(typeof data );
                console.log(data);
                // Verificar si la respuesta es válida y contiene datos
                if (data.length > 0) {
                    data.forEach(item => {
                        // Crear la carta
                        const card = document.createElement('div');
                        card.classList.add('card');
                        card.addEventListener('click', () => {
                            window.location.href = item.link;
                        });

                        card.innerHTML = `
                            <h3>${item.title}</h3>
                        `;

                        // Agregar la carta al contenedor
                        document.getElementById('card-container').appendChild(card);
                    });
                } else {
                    $('#card-container').append('<p>No hay cartas disponibles.</p>');
                }
            },
            error: function(status, error) {
                console.error("Error en la solicitud AJAX: ", status, error);
                alert("Error al cargar las cartas");
            }
        });
    }
});
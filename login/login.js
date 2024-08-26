$(document).ready(function() {
    $('#loginForm').submit(function(event) {
        event.preventDefault(); 
        var username = $('#username').val();
        var password = $('#password').val();

        $.ajax({
            url: 'login/login.php',
            type: 'POST',
            data: {
                username: username,
                password: password
            },
            success: function(response) {
                // Parsear la respuesta como JSON
                var jsonResponse = JSON.parse(response);

                if(jsonResponse.status === "success") {
                    var idUsuario = jsonResponse.idUsuario;
                    localStorage.setItem("idUsuario", idUsuario);
                    window.location.href = "paginas/inicio.php";
                } else {
                    alert("Nombre de usuario o contraseña incorrectos");
                }
            },
            error: function() {
                alert("Error en la conexión con el servidor");
            }
        });
    });
});

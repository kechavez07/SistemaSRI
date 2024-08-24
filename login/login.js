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
                if(response === "success") {
                    console.log("si entra no funciona la url")
                    window.location.href = "paginas/inicio.html";
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
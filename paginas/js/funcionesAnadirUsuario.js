$(document).ready(function() {
    listar();
});

function guardar() {
    if ($('#id_p').val() == '') {
        var nombre = $('#nombre').val();
        var apellido = $('#apellido').val();
        var cedula = $('#cedula').val();
        var contrasena = $('#contrasena').val();
        var correo = $('#correo').val();
        var idrol = $('#rol').val();
        $.ajax({
            url: '../php/CRUD_Usuario.php',
            type: 'POST',
            data: {nombre: nombre, apellido: apellido, cedula: cedula, contrasena: contrasena, correo: correo, idrol: idrol, action: 'create'},
            success: function(data) {
                console.log(data);
                listar();
                clean();
            }
        })
        .done(function() {
            console.log("success");
        })
        .fail(function() {
            console.log("error");
        });
    } else {
        update();
    }
}


function edit_row(id) {
    $.ajax({
        url: '../php/CRUD_Usuario.php',
        type: 'POST',
        data: {action: "edit", id: id},
        success: function(datos) {
            console.log(datos);
            $('#id_p').val(datos.id);
            $('#nombre').val(datos.nombre);
            $('#apellido').val(datos.apellido);
            $('#cedula').val(datos.cedula);
            $('#contrasena').val(datos.contrasena);
            $('#correo').val(datos.correo);
            $('#rol').val(datos.idrol);
        }
    }).done(function() {
        console.log("success");
    }).fail(function() {
        console.log("error");
    });
}

function update() {
    if ($('#id_p').val() != '') {
        var id_p = $('#id_p').val();
        var nombre = $('#nombre').val();
        var apellido = $('#apellido').val();
        var cedula = $('#cedula').val();
        var contrasena = $('#contrasena').val();
        var correo = $('#correo').val();
        var idrol = $('#rol').val();
        $.ajax({
            url: 'crud_usuario.php',
            type: 'POST',
            data: {nombre: nombre, apellido: apellido, cedula: cedula, contrasena: contrasena, correo: correo, idrol: idrol, action: 'update', id_p: id_p},
            success: function(data) {
                console.log(data);
                listar();
                clean();
            }
        })
        .done(function() {
            console.log("success");
        })
        .fail(function() {
            console.log("error");
        });
    } else {
        console.log("Error");
    }
}

function clean() {
    $('#id_p').val("");
    $('#nombre').val("");
    $('#apellido').val("");
    $('#cedula').val("");
    $('#contrasena').val("");
    $('#correo').val("");
    $('#rol').val("");
}

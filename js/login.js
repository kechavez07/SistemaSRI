const username = document.querySelector('[name=username]');
const password = document.querySelector('[name=password]');

// const validacion = (mensaje,e) => {
//     const  campo= e.target;
//     const value = e.target.value;
//     if (value.trim().length == 0) {
//         campo.classList.add('campo-error');
//         campo.nextElementSibling.classList.add('error');
//         campo.nextElementSibling.innerText = mensaje;
//     }else {
//         campo.classList.remove('campo-error');
//         campo.nextElementSibling.classList.remove('error');
//         campo.nextElementSibling.innerText = "";
//     }
// }

const validacion = (mensaje, e) => {
    const campo = e.target;
    const value = e.target.value;

    if (value.trim().length == 0) {
        campo.classList.add('campo-error');
        campo.nextElementSibling.classList.add('error');
        campo.nextElementSibling.innerText = mensaje;
        return;
    }

    const sqlRegex = /[\'\";--]/;
    if (sqlRegex.test(value)) {
        campo.classList.add('campo-error');
        campo.nextElementSibling.classList.add('error');
        campo.nextElementSibling.innerText = "Caracteres no permitidos.";
        return;
    }

    campo.classList.remove('campo-error');
    campo.nextElementSibling.classList.remove('error');
    campo.nextElementSibling.innerText = "";
}

username.addEventListener('blur', (e) => validacion('Añadir el usuario',e));
password.addEventListener('blur', (e) => validacion('Añadir la contraseña',e));


document.addEventListener('DOMContentLoaded', function() {
    const categoriaSelect = document.getElementById('categoria');

    // Función para cargar las categorías
    function loadCategories() {
        fetch('productoSelect.php')
            .then(response => response.json())
            .then(data => {
                // Limpia el select antes de agregar nuevas opciones
                categoriaSelect.innerHTML = '';

                // Agrega las opciones al select
                data.forEach(category => {
                    const option = document.createElement('option');
                    option.value = category.IDCATEGORI; // Valor que se enviará cuando se seleccione la opción
                    option.textContent = category.NOMBRECATEGORIA; // Nombre que se mostrará en el select
                    categoriaSelect.appendChild(option);
                });
            })
            .catch(error => {
                console.error('Error al cargar las categorías:', error);
            });
    }

    // Llama a la función para cargar las categorías cuando el documento esté listo
    loadCategories();
});
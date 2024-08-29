const toggleButton = document.getElementById('toggle-menu');
        const sidebar = document.querySelector('.sidebar');

        toggleButton.addEventListener('click', function() {
            sidebar.classList.toggle('active');
        });
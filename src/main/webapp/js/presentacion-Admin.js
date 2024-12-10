// Función para abrir/cerrar sidebar
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    sidebar.classList.toggle('closed');
    body.classList.toggle('sidebar-closed');
}

// Cerrar sidebar en dispositivos móviles al hacer clic fuera
document.addEventListener('click', function(event) {
    const sidebar = document.getElementById('sidebar');
    const menuBtn = document.querySelector('.menu-btn');
    
    if (window.innerWidth <= 1024 && 
        !sidebar.contains(event.target) && 
        !menuBtn.contains(event.target) && 
        !sidebar.classList.contains('closed')) {
        toggleSidebar();
    }
});

// Ajustar sidebar al redimensionar la ventana
window.addEventListener('resize', function() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    if (window.innerWidth <= 1024) {
        sidebar.classList.add('closed');
        body.classList.add('sidebar-closed');
    } else {
        sidebar.classList.remove('closed');
        body.classList.remove('sidebar-closed');
    }
});
        function openAddPresentacionModal() {
            document.getElementById('addPresentacionModal').classList.remove('hidden');
        }

        function closeAddPresentacionModal() {
            document.getElementById('addPresentacionModal').classList.add('hidden');
        }

        function openEditPresentacionModal(idPresentacion, nombre, descripcion) {
            document.getElementById('editPresentacionId').value = idPresentacion;
            document.getElementById('editNombrePresentacion').value = nombre;
            document.getElementById('editDescripcionPresentacion').value = descripcion;
            document.getElementById('editPresentacionModal').classList.remove('hidden');
        }

        function closeEditPresentacionModal() {
            document.getElementById('editPresentacionModal').classList.add('hidden');
        }

let currenPresentacionId = null;

function openDeleteModal(presentacionId) {
    currenPresentacionId = presentacionId; // Guarda el ID de la categoría
    document.getElementById('deletePresentacionModal').classList.remove('hidden');
}

function closeDeleteModal() {
    currenPresentacionId = null; // Limpia el ID de la categoría
    document.getElementById('deletePresentacionModal').classList.add('hidden');
}

function confirmDelete() {
    if (currenPresentacionId) {
        // Redirigir al servlet con el ID de la categoría
        window.location.href = `EliminarPresentacion?idPresentacion=${currenPresentacionId}`;
    }
    closeDeleteModal();
}


 function showNotification(message, type) {
    const notification = document.createElement('div');
    notification.innerText = message;
    notification.style.position = 'fixed';
    notification.style.top = '70px';
    notification.style.right = '20px';
    notification.style.color = '#fff';
    notification.style.padding = '10px 20px';
    notification.style.borderRadius = '5px';
    notification.style.boxShadow = '0 2px 5px rgba(0, 0, 0, 0.3)';
    notification.style.zIndex = '1000';

    if (type === 'success') {
        notification.style.backgroundColor = '#4CAF50';
    } else if (type === 'error') {
        notification.style.backgroundColor = '#f44336';
    }

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.remove();
    }, 3000);
}
    
    
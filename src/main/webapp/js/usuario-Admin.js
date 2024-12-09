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

let currentUsuarioId = null;

function openDeleteModal(userId) {
    currentUsuarioId = userId; // Guarda el ID de la categoría
    document.getElementById('deleteUserModal').classList.remove('hidden');
}

function closeDeleteModal() {
    currentUsuarioId = null; // Limpia el ID de la categoría
    document.getElementById('deleteUserModal').classList.add('hidden');
}

function confirmDelete() {
    if (currentUsuarioId) {
        // Redirigir al servlet con el ID de la categoría
        window.location.href = `EliminarUsuario?idUsuario=${currentUsuarioId}`;
    }
    closeDeleteModal();
}
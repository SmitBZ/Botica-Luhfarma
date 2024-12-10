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

function toggleAddUserModal() {
    document.getElementById('addUserModal').classList.remove('hidden');
}

function toggleCloseAddUserModal() {
    document.getElementById('addUserModal').classList.add('hidden');
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


function openEditModal(ID, Nombre, Apellido, Correo, Telefono, Password, Rol){
    document.getElementById('editUsuario').value = ID;
    document.getElementById('editNombre').value = Nombre;
    document.getElementById('editApellido').value = Apellido;
    document.getElementById('editCorreo').value = Correo;
    document.getElementById('editTelefono').value = Telefono;
    document.getElementById('editPass').value = Password;
    document.getElementById('editRol').value = Rol;
    document.getElementById('editUserModal').classList.remove('hidden');
}

function closeEditModal() {
    document.getElementById('editUserModal').classList.add('hidden');
}
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

function openModal() {
    document.getElementById('proveedorModal').classList.add('show');
}

function closeModal() {
    document.getElementById('proveedorModal').classList.remove('show');
}


function openModal() {
    const modal = document.getElementById('proveedorModal');
    modal.classList.remove('hidden');
}

function closeModal() {
    const modal = document.getElementById('proveedorModal');
    modal.classList.add('hidden');
}

function openEditProveedor(idProveedor, nombre, ruc, correo, telefono, direccion, entidad){
    document.getElementById('editId').value = idProveedor;
    document.getElementById('editNombre').value = nombre;
    document.getElementById('editRuc').value = ruc;
    document.getElementById('editCorreo').value = correo;
    document.getElementById('editTelefono').value = telefono;
    document.getElementById('editDireccion').value = direccion;
    document.getElementById('editEntidad').value = entidad;
    document.getElementById('provedorEdit').classList.remove('hidden');
}

function closeEditProveedor() {
    document.getElementById('provedorEdit').classList.add('hidden');
}


let currentProveedorID = null;

function openDeleteModal(proveedorId) {
    currentProveedorID = proveedorId; // Guarda el ID de la categoría
    document.getElementById('deleteProveedorModal').classList.remove('hidden');
}

function closeDeleteModal() {
    currentProveedorID = null; // Limpia el ID de la categoría
    document.getElementById('deleteProveedorModal').classList.add('hidden');
}

function confirmDelete() {
    if (currentProveedorID) {
        // Redirigir al servlet con el ID de la categoría
        window.location.href = `EliminarProveedor?idProveedor=${currentProveedorID}`;
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
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
        // Variables globales
        let currentDeleteId = null;
        let sidebarVisible = true;

        // Funciones de Modal
        function openModal(modalId) {
            document.getElementById(modalId).classList.add('show');
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('show');
        }

        // Funciones de Proveedor
function editProveedor(button) {
    // Obtener datos del proveedor desde los atributos del botón
    const id = button.getAttribute('data-id');
    const nombre = button.getAttribute('data-nombre');
    const ruc = button.getAttribute('data-ruc');
    const correo = button.getAttribute('data-correo');
    const telefono = button.getAttribute('data-telefono');
    const direccion = button.getAttribute('data-direccion');
    const entidad = button.getAttribute('data-entidad');

    // Asignar datos a los campos del formulario del modal
    document.getElementById('txtNombre').value = nombre;
    document.getElementById('txtRuc').value = ruc;
    document.getElementById('txtCorreo').value = correo;
    document.getElementById('txtTelefono').value = telefono;
    document.getElementById('txtDireccion').value = direccion;
    document.getElementById('txtEntidad').value = entidad;

    // Cambiar el encabezado del modal para indicar que es edición
    document.querySelector('#proveedorModal h3').textContent = 'Editar Proveedor';

    // Abrir el modal
    openModal('proveedorModal');
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

        // Función para exportar a Excel
        function exportToExcel() {
            // Aquí iría la lógica para exportar a Excel
            alert('Exportando datos a Excel...');
        }
        
        
        
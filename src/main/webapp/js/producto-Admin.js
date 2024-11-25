// ================================
// Sidebar Functions
// ================================
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

// ================================
// Modal Functions
// ================================
function openModal(modalId) {
    document.getElementById(modalId).classList.remove('hidden');
    document.getElementById(modalId).classList.add('flex');
}

function closeModal(modalId) {
    document.getElementById(modalId).classList.add('hidden');
    document.getElementById(modalId).classList.remove('flex');
}

// ================================
// Product Form Handling
// ================================
document.getElementById('productForm').addEventListener('submit', function(e) {
    // e.preventDefault(); // Elimina esta línea
    closeModal('productModal');
    // Aquí puedes agregar alguna lógica de confirmación o notificación, si es necesario.
});


function editProduct(id) {
    openModal('productModal');
    document.getElementById('modalTitle').textContent = 'Editar Producto';
    // Lógica para cargar los datos del producto
}

let productToDelete = null;

function deleteProduct(id) {
    productToDelete = id;
    openModal('deleteModal');
}

function confirmDelete() {
    if (productToDelete) {
        // Lógica para eliminar el producto
        closeModal('deleteModal');
        // Refrescar la tabla o mostrar mensaje de éxito
        productToDelete = null;
    }
}

// ================================
// Search Function
// ================================
function searchProducts() {
    const searchTerm = document.querySelector('input[type="text"]').value.toLowerCase();
    const rows = document.querySelectorAll('tbody tr');
    
    rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(searchTerm) ? '' : 'none';
    });
}

// ================================
// Export Function
// ================================
function exportToExcel() {
    // Lógica para exportar a Excel
    alert('Exportando a Excel...');
}

// ================================
// Notifications
// ================================
function showNotification(message, type = 'success') {
    // Implementar sistema de notificaciones
}

// ================================
// Initialize
// ================================
document.addEventListener('DOMContentLoaded', function() {
    // Inicializar cualquier funcionalidad necesaria
});

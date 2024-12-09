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
function openModal() {
    const modal = document.getElementById('productModal');
    modal.classList.remove('hidden');
}
function closeModal() {
    const modal = document.getElementById('productModal');
    modal.classList.add('hidden');
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

let currentProductoID = null;

function openDeleteModal(productoId) {
    currentProductoID = productoId; // Guarda el ID de la categoría
    document.getElementById('deleteProductoModal').classList.remove('hidden');
}

function closeDeleteModal() {
    currentProductoID = null; // Limpia el ID de la categoría
    document.getElementById('deleteProductoModal').classList.add('hidden');
}

function confirmDelete() {
    if (currentProductoID) {
        // Redirigir al servlet con el ID de la categoría
        window.location.href = `EliminarProducto?idProducto=${currentProductoID}`;
    }
    closeDeleteModal();
}

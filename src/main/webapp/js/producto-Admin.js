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

function openEditModal(id, Nombre, Categoria, Precio, Cantidad, FechaP, FechaV, Presentacion, Almacen, Descripcion){
    document.getElementById('editProductoID').value = id;
    document.getElementById('editNombre').value = Nombre;
    document.getElementById('editCategoria').value = Categoria;
    document.getElementById('editPrecio').value = Precio;
    document.getElementById('editCantidad').value = Cantidad;
    document.getElementById('editFechaPr').value = FechaP;
    document.getElementById('editFechaVen').value = FechaV;
    document.getElementById('editPresentacion').value = Presentacion;
    document.getElementById('editAlmacen').value = Almacen;
    document.getElementById('editDescripcion').value = Descripcion;
    document.getElementById('editModal').classList.remove('hidden');
}


function closeEditModal(){
    document.getElementById('editModal').classList.add('hidden');
}


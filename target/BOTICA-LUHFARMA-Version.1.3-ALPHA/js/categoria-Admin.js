
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    sidebar.classList.toggle('closed');
    body.classList.toggle('sidebar-closed');
}

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
        function openAddWarehouseModal() {
            document.getElementById('addWarehouseModal').classList.remove('hidden');
        }

        function closeAddWarehouseModal() {
            document.getElementById('addWarehouseModal').classList.add('hidden');
        }
        function openAddModal() {
        document.getElementById('addCategoryModal').classList.remove('hidden');
    }

    function closeAddModal() {
        document.getElementById('addCategoryModal').classList.add('hidden');
    }

    function openEditModal(idCategoria, nombre, descripcion) {
        document.getElementById('editIdCategoria').value = idCategoria;
        document.getElementById('editCategoryName').value = nombre;
        document.getElementById('editCategoryDescription').value = descripcion;
        document.getElementById('editCategoryModal').classList.remove('hidden');
    }

    function closeEditModal() {
        document.getElementById('editCategoryModal').classList.add('hidden');
    }

let currentCategoryId = null;

function openDeleteModal(categoryId) {
    currentCategoryId = categoryId; // Guarda el ID de la categoría
    document.getElementById('deleteCategoryModal').classList.remove('hidden');
}

function closeDeleteModal() {
    currentCategoryId = null; // Limpia el ID de la categoría
    document.getElementById('deleteCategoryModal').classList.add('hidden');
}

function confirmDelete() {
    if (currentCategoryId) {
        // Redirigir al servlet con el ID de la categoría
        window.location.href = `EliminarCategoria?idCategoria=${currentCategoryId}`;
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
    
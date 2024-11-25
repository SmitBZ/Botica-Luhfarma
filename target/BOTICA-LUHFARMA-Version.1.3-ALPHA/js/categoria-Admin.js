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

    function openEditModal(categoryId) {
        // Aquí deberías cargar los datos de la categoría
        document.getElementById('editCategoryName').value = "Nombre Categoría";
        document.getElementById('editCategoryDescription').value = "Descripción de la categoría";
        document.getElementById('editCategoryModal').classList.remove('hidden');
    }

    function closeEditModal() {
        document.getElementById('editCategoryModal').classList.add('hidden');
    }

    function openDeleteModal(categoryId) {
        document.getElementById('deleteCategoryModal').classList.remove('hidden');
    }

    function closeDeleteModal() {
        document.getElementById('deleteCategoryModal').classList.add('hidden');
    }

    function confirmDelete() {
        // Lógica para eliminar la categoría
        closeDeleteModal();
    }

    
    
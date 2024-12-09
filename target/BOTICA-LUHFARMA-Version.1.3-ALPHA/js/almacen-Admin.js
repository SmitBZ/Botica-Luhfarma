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
        window.location.href = `EliminarAlmacen?idAlmacen=${currentCategoryId}`;
    }
    closeDeleteModal();
}


function validarCapacidad(event) {
    // Obtener el valor actual del campo
    let cap = event.target.value;
    
    // Remover cualquier carácter que no sea número
    let numeroLimpio = cap.replace(/\D/g, '');
    
    // Limitar a 8 dígitos (longitud del DNI en Perú)
    if (numeroLimpio.length > 5) {
        numeroLimpio = numeroLimpio.slice(0, 5);
    }
    
    // Actualizar el valor del campo
    event.target.value = numeroLimpio;
}

// Función para validar el formulario antes de enviarlo
function validarFormulario(event) {
    const capa = document.getElementById('txtCapacidad').value;
    

    if (capa.length !== 5) {
        alert('La capacidad debe ser un número positivo');
        event.preventDefault();
        return false;
    }
    
    return true;
}

// Agregar los event listeners cuando el documento esté cargado
document.addEventListener('DOMContentLoaded', function() {
    // Obtener referencias a los campos
    const capInput = document.getElementById('txtCapacidad');
    const formulario = document.querySelector('.signup-form');
    
    if (capInput) {
        capInput.addEventListener('input', validarCapacidad);
    }
    
    // Agregar validación al enviar el formulario
    if (formulario) {
        formulario.addEventListener('submit', validarFormulario);
    }
});
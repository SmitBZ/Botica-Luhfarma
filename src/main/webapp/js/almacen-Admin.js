
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


function openEditWarehouseModal(idAlmacen, nombre, capacidad, descripcion) {
    document.getElementById('editIdAlmacen').value = idAlmacen;
    document.getElementById('editNombre').value = nombre;
    document.getElementById('editCapacidad').value = capacidad;
    document.getElementById('editDescripcion').value = descripcion;
    document.getElementById('editWarehouseModal').classList.remove('hidden');
}

function closeEditWarehouseModal() {
    document.getElementById('editWarehouseModal').classList.add('hidden');
}

let currentCategoryId = null;

function openDeleteModal(categoryId) {
    currentCategoryId = categoryId;
    document.getElementById('deleteCategoryModal').classList.remove('hidden');
}

function closeDeleteModal() {
    currentCategoryId = null;
    document.getElementById('deleteCategoryModal').classList.add('hidden');
}

function confirmDelete() {
    if (currentCategoryId) {
        window.location.href = `EliminarAlmacen?idAlmacen=${currentCategoryId}`;
    }
    closeDeleteModal();
}

function validarCapacidad(event) {
    let cap = event.target.value;
    let numeroLimpio = cap.replace(/\D/g, '');
    
    if (numeroLimpio.length > 5) {
        numeroLimpio = numeroLimpio.slice(0, 5);
    }
    event.target.value = numeroLimpio;
}

function validarFormulario(event) {
    const capa = document.getElementById('txtCapacidad').value;
    
    if (capa.length !== 5) {
        alert('La capacidad debe ser un número positivo');
        event.preventDefault();
        return false;
    }
    return true;
}

document.addEventListener('DOMContentLoaded', function() {
    const capInput = document.getElementById('txtCapacidad');
    const formulario = document.querySelector('.signup-form');
    
    if (capInput) {
        capInput.addEventListener('input', validarCapacidad);
    }
    if (formulario) {
        formulario.addEventListener('submit', validarFormulario);
    }
});

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
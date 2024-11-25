// ================================
// Base de datos de productos
// ================================
const productosDB = {
    producto1: { 
        nombre: "Paracetamol",
        unidad: 1.50, 
        blister: 8.00, 
        caja: 15.00 
    },
    producto2: { 
        nombre: "Ibuprofeno",
        unidad: 2.00, 
        blister: 10.00, 
        caja: 20.00 
    },
    producto3: { 
        nombre: "Amoxicilina",
        unidad: 1.20, 
        blister: 6.00, 
        caja: 12.00 
    }
};

// ================================
// Elementos del DOM
// ================================
const elements = {
    codigoVenta: document.getElementById('codigo-venta'),
    articulo: document.getElementById('articulo'),
    unidad: document.getElementById('unidad'),
    cantidad: document.getElementById('cantidad'),
    precio: document.getElementById('precio'),
    agregar: document.getElementById('agregar'),
    productosLista: document.getElementById('productos-lista'),
    total: document.getElementById('total'),
    nuevaVenta: document.getElementById('nueva-venta'),
    confirmarVenta: document.getElementById('confirmar-venta')
};

// ================================
// Variables globales
// ================================
let total = 0;
let productos = [];

// ================================
// Funciones principales
// ================================

/**
 * Genera un código de venta único basado en la fecha y un número aleatorio.
 */
function generarCodigoVenta() {
    const fecha = new Date().toISOString().slice(2, 10).replace(/-/g, '');
    const aleatorio = Math.floor(1000 + Math.random() * 9000);
    elements.codigoVenta.value = `V${fecha}-${aleatorio}`;
}

/**
 * Actualiza el precio basado en el artículo y unidad seleccionados.
 */
function actualizarPrecio() {
    const articulo = elements.articulo.value;
    const unidad = elements.unidad.value;
    if (articulo && unidad) {
        const precio = productosDB[articulo][unidad];
        elements.precio.value = precio ? precio.toFixed(2) : '';
    }
}

/**
 * Actualiza el total de la venta sumando todos los subtotales de los productos.
 */
function actualizarTotal() {
    total = productos.reduce((sum, item) => sum + item.subtotal, 0);
    elements.total.textContent = `S/ ${total.toFixed(2)}`;
}

/**
 * Elimina un producto de la lista.
 * @param {number} index - Índice del producto a eliminar.
 */
function eliminarProducto(index) {
    productos.splice(index, 1);
    renderizarProductos();
    actualizarTotal();
}

/**
 * Renderiza la lista de productos en el DOM.
 */
function renderizarProductos() {
    elements.productosLista.innerHTML = productos.map((item, index) => `
        <div class="producto-item">
            <span>${item.cantidad}</span>
            <span>${productosDB[item.articulo].nombre} (${item.unidad})</span>
            <span>S/ ${item.subtotal.toFixed(2)}</span>
            <button onclick="eliminarProducto(${index})">×</button>
        </div>
    `).join('');
}

/**
 * Limpia el formulario de entrada.
 */
function limpiarFormulario() {
    elements.articulo.value = '';
    elements.unidad.value = 'unidad';
    elements.cantidad.value = '1';
    elements.precio.value = '';
}

// ================================
// Event Listeners
// ================================
elements.articulo.addEventListener('change', actualizarPrecio);
elements.unidad.addEventListener('change', actualizarPrecio);

elements.agregar.addEventListener('click', () => {
    const cantidad = parseInt(elements.cantidad.value);
    const precioUnitario = parseFloat(elements.precio.value);
    const articulo = elements.articulo.value;
    const unidad = elements.unidad.value;

    if (articulo && cantidad > 0 && precioUnitario > 0) {
        productos.push({
            articulo,
            unidad,
            cantidad,
            subtotal: cantidad * precioUnitario
        });

        renderizarProductos();
        actualizarTotal();
        limpiarFormulario();
    } else {
        alert('Por favor, complete todos los campos correctamente.');
    }
});

elements.nuevaVenta.addEventListener('click', () => {
    generarCodigoVenta();
    productos = [];
    total = 0;
    renderizarProductos();
    actualizarTotal();
    limpiarFormulario();
});

elements.confirmarVenta.addEventListener('click', () => {
    if (productos.length === 0) {
        alert('Agregue al menos un producto para confirmar la venta.');
        return;
    }
    
    alert(`Venta ${elements.codigoVenta.value} confirmada por un total de S/ ${total.toFixed(2)}`);
    elements.nuevaVenta.click();
});

// ================================
// Inicialización
// ================================
window.onload = () => {
    generarCodigoVenta();
    actualizarPrecio();
};

// ================================
// Funciones de Sidebar
// ================================
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    sidebar.classList.toggle('closed');
    body.classList.toggle('sidebar-closed');
}

// Cerrar sidebar en móviles al hacer clic fuera
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

// Ajustar sidebar al redimensionar ventana
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

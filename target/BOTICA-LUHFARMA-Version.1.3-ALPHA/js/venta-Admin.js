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



document.addEventListener("DOMContentLoaded", () => {
    const productosLista = document.getElementById("productos-lista");
    const totalSpan = document.getElementById("total");
    const agregarBtn = document.getElementById("agregar");

    let carrito = [];

    agregarBtn.addEventListener("click", (e) => {
        e.preventDefault();

        // Obtener valores de los campos
        const productoId = document.getElementById("txtProducto").value;
        const productoNombre = document.getElementById("txtProducto").selectedOptions[0].text;
        const presentacionId = document.getElementById("txtPresentacion").value;
        const presentacionNombre = document.getElementById("txtPresentacion").selectedOptions[0].text;
        const cantidad = parseInt(document.getElementById("txtCantidad").value);
        const precioUnitario = parseFloat(document.getElementById("txtPrecio").value);

        if (!productoId || !presentacionId || cantidad <= 0 || isNaN(precioUnitario)) {
            alert("Por favor, completa todos los campos correctamente.");
            return;
        }

        // Calcular subtotal
        const subtotal = cantidad * precioUnitario;

        // Agregar al carrito
        carrito.push({
            productoId,
            productoNombre,
            presentacionId,
            presentacionNombre,
            cantidad,
            precioUnitario,
            subtotal,
        });

        // Actualizar UI
        renderCarrito();
    });

    function renderCarrito() {
        productosLista.innerHTML = "";

        let total = 0;
        carrito.forEach((item, index) => {
            total += item.subtotal;

            const div = document.createElement("div");
            div.className = "producto-item flex justify-between p-2 border-b";
            div.innerHTML = `
                <div>
                    <span class="font-bold">${item.productoNombre}</span>
                    <span class="text-sm">(${item.presentacionNombre})</span>
                </div>
                <div class="flex items-center">
                    <span class="mr-4">Cantidad: ${item.cantidad}</span>
                    <span class="mr-4">Precio: S/ ${item.precioUnitario.toFixed(2)}</span>
                    <span class="font-bold">Subtotal: S/ ${item.subtotal.toFixed(2)}</span>
                    <button onclick="eliminarProducto(${index})" class="text-red-600 hover:text-red-800 font-bold text-lg bg-transparent border-2 border-red-600 rounded-full p-1 ml-4 transition-colors duration-200">
                    Eliminar
                    </button>
                </div>
            `;
            productosLista.appendChild(div);
        });

        totalSpan.textContent = `S/ ${total.toFixed(2)}`;
    }
    document.getElementById('confirmar-venta').addEventListener('click', function() {
        document.getElementById('formVenta').submit(); // Envía el formulario
    });
    window.eliminarProducto = (index) => {
        carrito.splice(index, 1);
        renderCarrito();
    };
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


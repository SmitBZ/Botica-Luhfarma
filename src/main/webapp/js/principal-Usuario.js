let cart = []; // Arreglo para almacenar los productos del carrito.

    // Función para añadir un producto al carrito.
    function addToCart(event) {
        const productCard = event.target.closest('.product-card'); // Selecciona la tarjeta del producto.
        const id = productCard.getAttribute('data-id');
        const nombre = productCard.getAttribute('data-nombre');
        const precio = parseFloat(productCard.getAttribute('data-precio'));
        const img = productCard.getAttribute('data-img');

        // Verifica si el producto ya está en el carrito.
        const existingProduct = cart.find(item => item.id === id);

        if (existingProduct) {
            existingProduct.quantity += 1; // Incrementa la cantidad si ya existe.
        } else {
            // Añade el producto al carrito.
            cart.push({ id, nombre, precio, img, quantity: 1 });
        }

        updateCartDisplay(); // Actualiza la visualización del carrito.
    }

    // Función para actualizar la visualización del carrito.
    function updateCartDisplay() {
        const cartItems = document.getElementById('cartItems');
        const cartTotal = document.getElementById('cartTotal');
        const cartCount = document.querySelector('.cart-count');

        // Limpia los elementos previos.
        cartItems.innerHTML = '';
        let total = 0;

        // Recorre los productos del carrito y genera su representación en HTML.
        cart.forEach(product => {
            const item = document.createElement('div');
            item.classList.add('cart-item');
            item.innerHTML = `
                <img src="${product.img}" alt="${product.nombre}" class="cart-item-img">
                <div class="cart-item-info">
                    <h4>${product.nombre}</h4>
                    <p>S/${product.precio.toFixed(2)}</p>
                    <p>Cantidad: ${product.quantity}</p>
                </div>
                <button class="remove-btn" onclick="removeFromCart('${product.id}')">Eliminar</button>
            `;
            cartItems.appendChild(item);
            total += product.precio * product.quantity;
        });

        // Actualiza el total y la cantidad de elementos en el carrito.
        cartTotal.textContent = `Total: S/${total.toFixed(2)}`;
        cartCount.textContent = cart.reduce((acc, item) => acc + item.quantity, 0);
    }

    // Función para eliminar un producto del carrito.
    function removeFromCart(productId) {
        cart = cart.filter(item => item.id !== productId); // Filtra el producto que se desea eliminar.
        updateCartDisplay(); // Actualiza la visualización del carrito.
    }

    // Abre el modal del carrito.
    function openCart() {
        document.getElementById('cartModal').style.display = 'block';
    }

    // Cierra el modal del carrito.
    function closeCart() {
        document.getElementById('cartModal').style.display = 'none';
    }

function checkout() {
    // Abre el modal de pago.
    document.getElementById('paymentModal').style.display = 'block';
}

// Confirma el pago y cierra el modal de pago.
/*function confirmPayment() {
    fetch('ConfirmarPago', { method: 'POST' })
        .then(response => response.text())
        .then(data => {
            alert(data); // Muestra el mensaje del servidor.
            document.getElementById('add-to-cart').style.display = 'none'; // Cierra el modal de pago.
            cart = []; // Limpia el carrito tras el pago.
            updateCartDisplay(); // Actualiza la visualización del carrito.
        })
        .catch(error => console.error('Error:', error));
}*/
function confirmPayment() {
    const modal = document.getElementById('paymentModal');
    const inputs = modal.querySelectorAll('input[type="hidden"]');

    if (!selectedProductId) {
        console.error('No product selected.');
        return;
    }

    const productData = cart.find(item => item.id === selectedProductId); // Obtiene el producto del carrito

    // Actualiza los valores del formulario con los datos del producto seleccionado
    inputs.forEach(input => {
        const name = input.getAttribute('name');
        if (productData && productData[name]) {
            input.value = productData[name];
        }
    });

    // Podrías manejar aquí la validación y mostrar el modal con los datos prellenados.
}


// Función donde el usuario selecciona un producto y procede a pagar
function proceedToPay(productId) {
    selectedProductId = productId; // Guarda el ID del producto seleccionado

    // Llama a la función para llenar los datos del form
    confirmPayment();

    // Muestra el modal
    const modal = document.getElementById('paymentModal');
    modal.style.display = 'block';

}


// Cierra el modal de pago.
function closePaymentModal() {
    document.getElementById('paymentModal').style.display = 'none';
    document.getElementById('cartModal').style.display = 'none';
}

function closeModalPago() {
    document.getElementById('paymentModal').style.display = 'none';
}
    

// Abrir el modal de inicio de sesión
function openLoginModal() {
    document.getElementById("login-modal").style.display = "flex";
    closeModal("signup-modal");
}

// Abrir el modal de registro
function openSignupModal() {
    document.getElementById("signup-modal").style.display = "flex";
    closeModal("login-modal");
}

// Cerrar un modal específico
function closeModal(modalId) {
    document.getElementById(modalId).style.display = "none";
}

// Cerrar el modal al hacer clic fuera del contenido
window.onclick = function(event) {
    if (event.target.classList.contains("modal")) {
        event.target.style.display = "none";
    }
}

// Función para mostrar el modal de mensaje con un texto específico
function mostrarMensaje(texto) {
    document.getElementById("mensajeTexto").innerText = texto;
    document.getElementById("modalMensaje").style.display = "flex";
}

// Función para cerrar el modal de mensaje
function cerrarModal() {
    document.getElementById("modalMensaje").style.display = "none";
}


// Mostrar detalles del producto en el modal
function showProductDetails(image) {
    const productCard = image.parentElement;
        const modal = document.getElementById('productModal');

        modal.setAttribute('data-id', productCard.getAttribute('data-id')); // Asigna el ID al modal
        document.getElementById('modalImage').src = productCard.dataset.img;
        document.getElementById('modalName').textContent = productCard.dataset.nombre;
        document.getElementById('modalPrice').textContent = `Precio: S/${parseFloat(productCard.dataset.precio).toFixed(2)}`;
        document.getElementById('modalCategory').textContent = productCard.dataset.categoria;
        document.getElementById('modalDescripcion').textContent = productCard.dataset.descripcion;

        modal.style.display = 'flex';
}

// Cerrar el modal
function closeDetalleModal() {
    const modal = document.getElementById('productModal');
    modal.style.display = 'none';
}

// Añadir al carrito desde el modal
function addToCartFromModal() {
    const modal = document.getElementById('productModal');
        
        // Obtener datos del modal
        const id = modal.getAttribute('data-id');
        const nombre = document.getElementById('modalName').textContent;
        const precio = parseFloat(document.getElementById('modalPrice').textContent.replace('Precio: S/', ''));
        const img = document.getElementById('modalImage').src;

        // Verifica si el producto ya está en el carrito
        const existingProduct = cart.find(item => item.id === id);

        if (existingProduct) {
            existingProduct.quantity += 1; // Incrementa la cantidad si ya existe
        } else {
            // Añade el producto al carrito con la presentación seleccionada
            cart.push({ id, nombre, precio, img, quantity: 1 });
        }

        updateCartDisplay(); // Actualiza la visualización del carrito
}

let selectedProductId = null; // Declara y asigna el id del producto seleccionado.

function proceedToPay(productId) {
    selectedProductId = productId; // Guarda el ID del producto seleccionado

    // Llame a la función para llenar los datos del formulario
    confirmPayment();

    // Muestra el modal
    const modal = document.getElementById('paymentModal');
    modal.style.display = 'block';
}




// Duración de visualización inicial (en milisegundos)
const displayDuration = 35000; // 15 segundos
// Intervalo de reaparición (en milisegundos)
const reappearanceInterval = 30000; // 30 segundos

// Elemento del encabezado
const topHeader = document.getElementById("topHeaderContent");

// Función para detener la animación y ocultar el encabezado
function stopAnimation() {
    topHeader.style.animation = "none"; // Detiene la animación
    topHeader.parentElement.style.display = "none"; // Oculta el encabezado
}

// Función para reiniciar la animación y mostrar el encabezado
function startAnimation() {
    topHeader.style.animation = "slide 10s linear infinite"; // Reinicia la animación
    topHeader.parentElement.style.display = "block"; // Muestra el encabezado
}

// Detener la animación después de `displayDuration`
setTimeout(() => {
    stopAnimation();
    // Reiniciar la animación cada `reappearanceInterval`
    setInterval(() => {
        startAnimation();
        setTimeout(stopAnimation, displayDuration); // Oculta de nuevo después de `displayDuration`
    }, reappearanceInterval);
}, displayDuration);

// Función para validar que solo se ingresen números en el teléfono
function validarTelefono(event) {
    // Obtener el valor actual del campo
    let telefono = event.target.value;
    
    // Remover cualquier carácter que no sea número
    let numeroLimpio = telefono.replace(/\D/g, '');
    
    // Limitar a 9 dígitos (número típico de teléfono en Perú)
    if (numeroLimpio.length > 9) {
        numeroLimpio = numeroLimpio.slice(0, 9);
    }
    
    // Actualizar el valor del campo
    event.target.value = numeroLimpio;
}

// Función para validar que solo se ingresen números en el DNI
function validarDNI(event) {
    // Obtener el valor actual del campo
    let dni = event.target.value;
    
    // Remover cualquier carácter que no sea número
    let numeroLimpio = dni.replace(/\D/g, '');
    
    // Limitar a 8 dígitos (longitud del DNI en Perú)
    if (numeroLimpio.length > 8) {
        numeroLimpio = numeroLimpio.slice(0, 8);
    }
    
    // Actualizar el valor del campo
    event.target.value = numeroLimpio;
}

// Función para validar el formulario antes de enviarlo
function validarFormulario(event) {
    const telefono = document.getElementById('txtTelefono').value;
    const dni = document.getElementById('txtDni').value;
    
    if (telefono.length !== 9) {
        alert('El número de teléfono debe tener 9 dígitos');
        event.preventDefault();
        return false;
    }
    
    if (dni.length !== 8) {
        alert('El DNI debe tener 8 dígitos');
        event.preventDefault();
        return false;
    }
    
    return true;
}

// Agregar los event listeners cuando el documento esté cargado
document.addEventListener('DOMContentLoaded', function() {
    // Obtener referencias a los campos
    const telefonoInput = document.getElementById('txtTelefono');
    const dniInput = document.getElementById('txtDni');
    const formulario = document.querySelector('.signup-form');
    
    // Agregar los event listeners para la validación en tiempo real
    if (telefonoInput) {
        telefonoInput.addEventListener('input', validarTelefono);
    }
    
    if (dniInput) {
        dniInput.addEventListener('input', validarDNI);
    }
    
    // Agregar validación al enviar el formulario
    if (formulario) {
        formulario.addEventListener('submit', validarFormulario);
    }
});

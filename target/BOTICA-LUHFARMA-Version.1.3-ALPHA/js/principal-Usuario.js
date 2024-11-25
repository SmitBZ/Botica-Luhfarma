const products = [
    { id: 1, name: 'Aspirina', category: 'medicamentos', price: 20, image: 'img/aspirina.avif' },
    { id: 2, name: 'Jabón Antibacterial', category: 'cuidado-personal', price: 15, image: 'img/jabon.png' },
    { id: 3, name: 'Crema Hidratante', category: 'dermocosmetica', price: 30, image: 'img/crema.avif' },
    { id: 4, name: 'Leche en Polvo', category: 'medicamentos', price: 40, image: 'img/leche.webp' },
    { id: 5, name: 'Suplemento Nutricional', category: 'nutricion', price: 25, image: 'img/suplemento.webp' },
    { id: 6, name: 'Shampu Tio Nacho', category: 'cuidado-personal' , price: 20, image : 'img/tio.webp'}
];

const cart = [];

function loadProducts(category) {
    const productsGrid = document.getElementById('productsGrid');
    productsGrid.innerHTML = '';

    const filteredProducts = category ? products.filter(p => p.category === category) : products;
    filteredProducts.forEach(product => {
        const productCard = document.createElement('div');
        productCard.className = 'product-card';
        productCard.innerHTML = `
            <img src="${product.image}" alt="${product.name}" class="product-image">
            <h4>${product.name}</h4>
            <p>S/${product.price.toFixed(2)}</p>
            <button class="add-to-cart-btn" onclick="addToCart(${product.id})">Añadir al carrito</button>
        `;
        productsGrid.appendChild(productCard);
    });
}

function addToCart(productId) {
    const product = products.find(p => p.id === productId);
    if (product) {
        cart.push(product);
        updateCart();
    }
}

function updateCart() {
    const cartItems = document.getElementById('cartItems');
    const cartTotal = document.getElementById('cartTotal');
    
    cartItems.innerHTML = '';
    let total = 0;

    cart.forEach((item, index) => {
        cartItems.innerHTML += `
            <div class="cart-item">
                <span>${item.name}</span>
                <span>S/${item.price.toFixed(2)}</span>
                <button onclick="removeFromCart(${index})">Eliminar</button>
            </div>
        `;
        total += item.price;
    });

    cartTotal.innerHTML = `Total: S/${total.toFixed(2)}`;
}

function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
}

function openCart() {
    document.getElementById('cartModal').style.display = 'block';
}

function closeCart() {
    document.getElementById('cartModal').style.display = 'none';
}

function checkout() {
    alert('Procediendo al pago...');
    closeCart();
}

function filterProducts(category) {
    loadProducts(category);
}
document.addEventListener('DOMContentLoaded', () => loadProducts());

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
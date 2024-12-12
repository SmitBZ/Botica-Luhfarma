<%@page import="model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/logo.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"/>
        <link rel="stylesheet" href="css/pricipal-Usuario.css"/>
        <title>BOTICA LUHFARMA</title>
    </head>
    <body>
        <div class="top-header">
            <div class="top-header-content" id="topHeaderContent">
                <span>Delivery Gratis en compras mayores a S/59</span>
                <span>Atención al cliente: 3309124</span>
                <span>Encuentranos en AV. Emancipacion N° 752 - Lima</span>
            </div>
        </div>
        
        <header class="main-header">
            <div class="header-content">
                <a href="principal.jsp" class="logo">LUHFARMA</a>
                <form class="search-bar">
                    <input type="text" class="search-input" placeholder="¿Que estas Buscando?">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </form>
                <div class="cart-icon">
                    <button class="cart-button" onclick="openCart()"><span class="cart-count">0 </span> Carrito</button>
                </div>
                <div class="cart-login">
                <% Usuario usuario = (Usuario) session.getAttribute("usuario");if (usuario != null) {String nombreUsuario = usuario.getNombre();%>
                    <div class="mt-auto pt-4 border-t">
                        <div class="flex items-center">
                            <img src="img/pr.webp" alt="Usuario" class="w-8 h-8 rounded-full">
                            <div class="ml-3">
                                <p class="text-sm font-medium text-gray-700"><%= nombreUsuario %></p>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/SalirSesion" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i></a>
                    </div>
                    <%}else{ %>
                    <button class="cart-button" onclick="openLoginModal()">
                        <i class="fas fa-user"></i>
                        Iniciar sesión
                    </button>
                    <% } %>
                </div>
            </div>
        </header>        
        <nav clas="nav-menu">
            <div class="menu-content">
                <ul class="menu-list">
                    <li><a href="#" onclick="filterProducts('medicamentos')">Medicamentos</a></li>
                    <li><a href="#" onclick="filterProducts('cuidado-personal')">Cuidado Personal</a></li>
                    <li><a href="#" onclick="filterProducts('dermocosmetica')">Dermocosmetica</a></li>
                    <li><a href="#" onclick="filterProducts('mama-bebe')">Mamá y Bebé</a></li>
                    <li><a href="#" onclick="filterProducts('nutricion')">Nutrición</a></li>
                </ul>
            </div>
        </nav>
        <main class="main-content">
            <section class="categories">
                <div class="category-card" onclick="filterProducts('ofertas')">
                    <h3>Ofertas</h3>
                    <p>Hasta 50% dcto</p>
                </div>
                <div class="category-card" onclick="filterProducts('medicamentos')">
                    <h3>Medicamentos</h3>
                    <p>Los mejores precios</p>
                </div>
                <div class="category-card" onclick="filterProducts('cuidado-personal')">
                    <h3>Cuidado Personal</h3>
                    <p>Todo para ti</p>
                </div>
            </section>
            <section class="products-grid" id="productsGrid">
            <%
                List<Producto> productos = (List<Producto>) request.getAttribute("aProduct");
                if (productos != null) {
                    for (Producto producto : productos) {
            %>
                <div class="product-card" data-id="<%= producto.getIdProducto() %>"
                    data-nombre="<%= producto.getNombre() %>"
                    data-precio="<%= producto.getPrecio() %>"
                    data-categoria="<%= producto.getCategoria() %>"
                    data-img="<%= producto.getImg() %>" 
                    data-descripcion="<%= producto.getDescripcion() %>">
                    <img src="<%= producto.getImg() %>" alt="<%= producto.getNombre() %>" class="product-image" onclick="showProductDetails(this)">
                    <h4><%= producto.getNombre() %></h4>
                    <p>S/<%= producto.getPrecio() %></p>
                    <button class="add-to-cart-btn" onclick="addToCart(event)">Añadir al carrito</button>
                </div>
            <%
                    }
                } else {
            %>
            <p>No hay productos disponibles.</p>
            <%
                }
            %>
            </section>
        </main>
            
            <!-- Modal para detalles del producto -->
        <div id="productModal" class="modal">
            <div class="modal-content">
                <span class="close-btn" onclick="closeDetalleModal()">&times;</span>
                <img id="modalImage" src="" alt="" class="modal-image">
                <h2 id="modalName"></h2>
                <p id="modalPrice"></p>
                <p id="modalCategory"></p>
                <p id="modalDescripcion"></p>
                <button class="add-to-cart-btn" onclick="addToCartFromModal()">Añadir al carrito</button>
            </div>
        </div>
            
        <div id="cartModal" class="modal">
            <div class="modal-content">
                <span class="close-modal" onclick="closeCart()">&times;</span>
                <h2>Tu Carrito</h2>
                <div id="cartItems"></div>
                <div id="cartTotal">
                    Total: S/0.00
                </div>
                <button class="add-to-cart" onclick="checkout()">Proceder al pago</button>
            </div>
        </div>
        
        
        <div id="paymentModal" class="modal">
            <form action="ConfirmarPago" method="post" enctype="multipart/form-data">
                <div class="modal-content">
                    <span class="close-modal" onclick="closeModalPago()">&times;</span>
                    <h3>Escanea el código QR con Yape para completar el pago:</h3>
                    <center>
                        <img src="img/qr.jpg" alt="Código QR para pago" style="width: 150px; margin-bottom: 50px;"/>
                    </center>
                   <!-- Input oculto para enviar datos desde el carrito -->
                    <input type="hidden" name="txtCodigo" id="txtCodigo" value=""required>
                    <input type="hidden" name="txtProducto" id="txtProducto" value="" required>
                    <input type="hidden" name="txtPresentacion" id="txtPresentacion" value="" required>
                    <input type="hidden" name="txtCantidad" id="txtCantidad" value="" required>
                    <input type="hidden" name="precioUnitario" id="precioUnitario" value="" required>
                    <input type="hidden" name="selectedProductId" id="selectedProductId" value="" required>

                    <div class="file-input-container">
                        <label for="txtImagen">Ingrese la captura del pago realizado</label>
                        <button class="file-input-button" type="button">Subir archivo</button>
                        <input type="file" name="comprobante" id="txtImagen">
                    </div>
                    <br><br>
                    <div>
                        <button id="confirmPaymentBtn" class="close-button" onclick="confirmPayment()">Ya pagué</button>
                    </div>
                </div>
            </form>
        </div>

                
        <div class="modal" id="login-modal">
            <div class="modal-content">
                <span class="close-modal" onclick="closeModal('login-modal')">&times;</span>
                <div class="modal-header">
                    <center><img src="img/logo.ico" alt="LUHFARMA" style="margin-bottom: 10px;" width="50"></center>
                    <h2>Iniciar sesión</h2>
                    <p>Accede a ofertas exclusivas</p>
                </div>
                <form class="login-fomr" method="post" action="IniciarSesion">
                    <div class="input-group">
                        <label for="email">Correo electronico</label>
                        <input type="email" id="txtCorreo" name="txtCorreo" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Contraseña</label>
                        <input type="password" id="txtPassword" name="txtPassword" required>
                    </div>
                    <button type="submit" class="login-btn">Iniciar sesión</button>
                </form>
                <div class="modal-footer">
                    <a href="#">¿Olvidaste tu contraseña?</a><br>
                    <a href="#" id="signup-link" onclick="openSignupModal()">Crear cuenta nueva</a> 
                </div>
            </div>
        </div>
                
        <div class="modal" id="signup-modal">
            <div class="modal-content">
                <span class="close-modal" onclick="closeModal('signup-modal')">&times;</span>
                <div class="modal-header">
                    <center><img src="img/logo.ico" alt="LUHFARMA" style="margin-bottom: 10px;" width="50"></center>
                    <h2>Registro de datos</h2>
                </div>
                <form class="signup-form" method="post" action="RegistrarCliente">
                    <div class="input-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" id="txtNombre" name="txtNombre" required placeholder="Ingrese su nombre completo">
                    </div>
                    <div class="input-group">
                        <label for="apellido">Apellido</label>
                        <input type="text" id="txtApellidos" name="txtApellidos" required placeholder="Ingrese su apellido completo">
                    </div>
                    <div class="input-group">
                        <label for="teléfono">Teléfono</label>
                        <input type="text" id="txtTelefono" name="txtTelefono" required pattern="[0-9]{9}" accesskey=""title="Debe ingresar un número de teléfono válido de 9 dígitos"placeholder="Ingrese su número de teléfono">
                    </div>
                    <div class="input-group">
                        <label for="dni">DNI</label>
                        <input type="text" id="txtDNI" name="txtDNI" required pattern="[0-9]{8}" title="Debe ingresar un DNI válido de 8 dígitos" maxlength="8" placeholder="Ingrese su DNI">
                    </div>
                    <div class="input-group">
                        <label for="direccion">Direccion</label>
                        <input type="text" id="txtDireccion" name="txtDireccion" required placeholder="Ingrese su direción">
                    </div>
                    <div class="input-group">
                        <label for="email">Correo electrónico</label>
                        <input type="email" id="txtCorreo" name="txtCorreo" required placeholder="Ingrese su correo">
                    </div>
                    <div class="input-group">
                        <label for="password">Contraseña</label>
                        <input type="password" id="txtPassword" name="txtPassword" required placeholder="Ingrese su contraseña">
                    </div>
                    <div class="input-group">
                        <label for="password">Verificacion de Contraseña</label>
                        <input type="password" id="txtVerificacion" name="txtVerificacion" required placeholder="Ingrese su contraseña nuevamente">
                    </div>
                    <button type="submit" class="register-btn">Registrarse</button>
                </form>
                <div class="modal-footer">
                    <a href="#" id="signup-link" onclick="openLoginModal()">Ya tienes cuenta. Inicia sesion aqui</a>
                </div>
            </div>
        </div>
                
        <div id="modalMensaje" class="modal">
            <div class="modal-content">
                <span class="close" onclick="cerrarModalMensaje()">&times;</span>
                <p id="mensajeTexto"></p>
            </div>
        </div>
                
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Acerca de LUHFARMA</h3>
                    <ul>
                        <li><a href="#">Quiénes Somos</a></li>
                        <li><a href="#">Trabaja con Nosotros</a></li>
                        <li><a href="#">Contáctanos</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Atención al Cliente</h3>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Políticas de Devolución</a></li>
                        <li><a href="#">Términos y Condiciones</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Síguenos</h3>
                    <ul class="social-media">
                    <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                </ul>
                </div>
            </div>
        </footer>

        <script src="js/principal-Usuario.js"></script>
        
        <script>
            window.onload = function(){
                <% if(request.getAttribute("mensaje") != null){ %>
                document.getElementById("modalMensaje").style.display = "block";
                document.getElementById("mensajeTexto").innerText = "<%= request.getAttribute("mensaje") %>";
                <% } %>
            };
            
            function cerrarModalMensaje() {
                document.getElementById("modalMensaje").style.display = "none";
            }
            function generateUniqueCode() {
                // Generar un código de venta único usando un prefijo y un número aleatorio
                const prefix = 'VTA-'; // Prefijo para el código de venta
                const randomNum = Math.floor(Math.random() * 1000000); // Genera un número aleatorio entre 0 y 1,000,000
                return prefix + randomNum; // Devuelve el código único
            }
        </script>
    </body>
</html>

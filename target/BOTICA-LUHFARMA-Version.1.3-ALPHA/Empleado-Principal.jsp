<!-- Encabezado del archivo JSP -->
<%@page import="model.Presentacion"%>
<%@page import="model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@ page session="true" %>

<%-- Este archivo est� dise�ado para la funcionalidad de ventas del empleado. Incluye carga de productos y presentaciones. --%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Uso de Tailwind CSS para estilos r�pidos y minimalistas -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <!-- Uso de Font Awesome para iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Hoja de estilos personalizada para el estilo de encabezado y el sidebar-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/venta-Employee.css">
    <!-- �cono de la p�gina -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon">
    <title>BOTICA LUHFARMA</title> 
</head>
<body>
    <%-- Secci�n de barra lateral para navegaci�n del empleado --%>
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="${pageContext.request.contextPath}/img/logo.ico" alt="Logo" class="w-12 h-12">
            <button class="close-btn" onclick="toggleSidebar()"><i class="fas fa-times"></i></button>
        </div>
        <nav class="nav-links flex flex-col space-y-2 p-4">
            <%-- Botones de navegaci�n --%>
            <a href="ListarReporteEmpleado" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-chart-bar mr-3"></i> Reportes
            </a>
            <a href="ListarInventarioEmpleado" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-box mr-3"></i> Inventario
            </a>
            <a href="ListarInventarioEmpleado" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-shopping-cart mr-3"></i> Ventas
            </a>
            
            <%-- Verificar si el usuario est� autenticado --%>
            <% 
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                if (usuario != null) {
                    String nombreUsuario = usuario.getNombre();
                    String correoUsuario = usuario.getCorreo(); 
            %>
            
            <%-- Aqui se mostrara los datos del empleado una vez aunteticado --%>
            <div class="mt-auto pt-4 border-t">
                <div class="flex items-center">
                    <img src="${pageContext.request.contextPath}/img/pr.webp" alt="Usuario" class="w-8 h-8 rounded-full">
                    <div class="ml-3">
                        <p class="text-sm font-medium text-gray-700"><%= nombreUsuario %></p>
                        <p class="text-xs text-gray-500"><%= correoUsuario %></p>
                    </div>
                </div>
            </div>
            <%-- Si el usuario no es encontrado, redirigira hacia el index o pagina principal --%>
            <% 
                } else {
                    response.sendRedirect("index.jsp");
                }
            %>
        </nav>
    </aside>
        
    <%-- Secci�n del encabezado de contenido --%>
    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <%-- Bot�n para mostrar/ocultar barra lateral --%>
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()">
            <i class="fas fa-bars"></i>
        </button>
        <%-- Enlace para cerrar sesi�n --%>
        <a href="index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600">
            <i class="fas fa-sign-out-alt mr-2"></i> Cerrar Sesi�n
        </a>
    </header>
    
    <br><br><br><br>
    <div class="container mx-auto p-4 grid grid-cols-2 gap-4">
        <%-- Formulario para gestionar la venta --%>
        <form id="formVenta" action="RegistrarVentaEmpleado" method="post">
            <div class="card bg-white shadow-md rounded-lg p-4 mb-4">
                <h2 class="text-lg font-bold">Nueva Venta</h2>
                <%-- Se genera c�digo autom�ticamente mediante el javascript--%>
                <div class="form-group">
                    <label for="txtProducto" class="block text-sm font-medium text-gray-700">
                        Codigo de Venta
                    </label>
                    <input type="text" id="txtCodigo" name="txtCodigo" readonly value="<%= request.getAttribute("codigoVenta") %>" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                </div>
                <%-- Selecci�n de producto --%>
                <div class="form-group">
                    <label for="txtProducto" class="block text-sm font-medium text-gray-700">
                        Art�culo
                    </label>
                    <select id="txtProducto" name="txtProducto" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                        <option value="">Seleccione un producto</option>
                        <% 
                            // Cargar lista de productos desde el servlet
                            List<Producto> aPr = (List<Producto>) request.getAttribute("pro"); 
                            if (aPr != null && !aPr.isEmpty()) {
                                for (Producto pr : aPr) { 
                        %>
                        <option value="<%= pr.getIdProducto() %>">
                            <%= pr.getNombre() %>
                        </option>
                        <% 
                                }
                            } else {
                            // Aviso si no hay productos disponibles
                        %>
                        <option disabled>
                            No hay productos registradas disponibles
                        </option>
                        <% 
                            } 
                        %>
                    </select>
                </div>
                    
                <%-- Selecci�n de presentaci�n de producto --%>
                <div class="grid grid-cols-2 gap-4">
                    <div class="form-group">
                        <label for="txtPresentacion" class="block text-sm font-medium text-gray-700">
                            Presentaci�n
                        </label>
                        <select id="txtPresentacion" name="txtPresentacion" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                            <option value="">Seleccione una presentaci�n</option>
                            <%  
                                // Cargar lista de presentaciones desde el servlet
                                List<Presentacion> pres = (List<Presentacion>) request.getAttribute("apres");
                                if (pres != null && !pres.isEmpty()) {
                                    for (Presentacion pr : pres) { 
                            %>
                            <option value="<%= pr.getIdPresentacion() %>">
                                <%= pr.getNombre() %>
                            </option>
                            <% 
                                    }
                                } else {
                                // Aviso si no hay productos disponibles
                            %>
                            <option disabled>
                                No hay presentaciones registradas disponibles
                            </option>
                            <% 
                                } 
                            %>
                        </select>
                    </div>
                    <%-- Seccion para agregar cantidad de produictos --%>
                    <div class="form-group">
                        <label for="txtCantidad" class="block text-sm font-medium text-gray-700">
                            Cantidad
                        </label>
                        <input type="text" id="txtCantidad" name="txtCantidad" min="1" value="1" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                    </div>
                </div>
                <%-- Secci�n para agregar el precio por producto seg�n sea el tipo de presentaci�n --%>
                <div class="form-group">
                    <label for="txtPrecio" class="block text-sm font-medium text-gray-700">
                        Precio Unitario
                    </label>
                    <input type="text" id="txtPrecio" name="precioUnitario" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                </div>
                <%-- Boton para agregar al carrito --%>
                <button id="agregar" class="mt-4 bg-blue-600 text-white p-2 rounded">
                    <i class="fas fa-plus"></i>
                    Agregar al Carrito
                </button>
            </div>
        </form>
                
        <%-- Secci�n de carrito de compras --%>
        <div class="card bg-white shadow-md rounded-lg p-4">
            <h2 class="text-lg font-bold">
                Detalle de Venta
            </h2>
            <div class="productos-lista" id="productos-lista">
            <%-- Aqu� se mostrar� la lista de productos a�adidos din�micamente --%>
            </div>
            <div class="total-section flex justify-between mt-4">
                <span class="font-medium">Total</span>
                <span id="total" class="font-bold">S/ 0.00</span>
            </div>
            <%-- Bot�n para confirmar venta --%>
            <button id="confirmar-venta" type="submit" class="mt-4 w-full bg-green-600 text-white p-2 rounded">
                <i class="fas fa-check"></i>
                Confirmar Venta
            </button>
        </div>
            
    <%-- JavaScript externo para funcionalidades din�micas --%>
    <script src="${pageContext.request.contextPath}/js/venta-Employee.js"></script>
    <% 
            String message = (String) request.getAttribute("message");
            String messageType = (String) request.getAttribute("messageType");
            if (message != null && messageType != null) { 
        %>
        <script>
            showNotification("<%= message %>", "<%= messageType %>");
        </script>
        <%
            } 
        %>
</body>
</html>

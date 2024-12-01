<%@page import="model.Inventario"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inventario-Admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon">
    <title>BOTICA LUHFARMA</title> 
</head>
<body>
    <body class="bg-gray-100 font-sans antialiased">
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="img/logo.ico" alt="Logo" class="w-12 h-12"><h2>LUHFARMA</h2>
            <button class="close-btn" onclick="toggleSidebar()"><i class="fas fa-times"></i></button>
        </div>
        <nav class="nav-links flex flex-col space-y-2 p-4">
            <a href="${pageContext.request.contextPath}/CantidadClientes" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-tachometer-alt w-5"></i>Dashboard</a>
            <a href="${pageContext.request.contextPath}/ListarProductos" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-capsules mr-3"></i>Productos</a>
            <a href="${pageContext.request.contextPath}/ListarUsuario" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-users-cog mr-3"></i>Usuarios</a>
            <a href="${pageContext.request.contextPath}/ListarReporte" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-chart-pie mr-3"></i>Reportes</a>
            <a href="${pageContext.request.contextPath}/ListarInventario" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-box mr-3"></i>Inventario</a>
            <a href="${pageContext.request.contextPath}/ListarVenta" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cash-register mr-3"></i>Ventas</a>
            <a href="${pageContext.request.contextPath}/ListarProveedor" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-truck-loading mr-3"></i>Proveedores</a>
            <a href="${pageContext.request.contextPath}/Compra" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-credit-card mr-3"></i>Compra</a>
            <a href="${pageContext.request.contextPath}/ListarAlmacen" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-warehouse mr-3"></i>Almacen</a>
            <a href="${pageContext.request.contextPath}/ListarCategoria" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Categoria</a>
            <a href="${pageContext.request.contextPath}/ListarPresentaciones" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-boxes mr-3"></i>Presentacion de Producto</a>
            <% Usuario usuario = (Usuario) session.getAttribute("usuario");if (usuario != null) {String nombreUsuario = usuario.getNombre();String correoUsuario = usuario.getCorreo();%>
            <div class="mt-auto pt-4 border-t">
                <div class="flex items-center">
                    <img src="${pageContext.request.contextPath}/img/pr.webp" alt="Usuario" class="w-8 h-8 rounded-full">
                        <div class="ml-3">
                            <p class="text-sm font-medium text-gray-700"><%= nombreUsuario %></p>
                            <p class="text-xs text-gray-500"><%= correoUsuario %></p>
                        </div>
                </div>
            </div>
            <% } else {response.sendRedirect("Usuario-Principal.jsp");}%>
        </nav>
    </aside>
    <br><br><br><br>
    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
        <a href="index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i>Cerrar sesión</a>
    </header>
    
    
    
     <div class="container">
        <div class="filters">
            <div class="filter-item">
                <div class="filter-title">Filtrar por:</div>
                <select id="filter-by" onchange="filterProducts()">
                    <option value="todo">Todo</option>
                    <option value="medicamentos">Medicamentos</option>
                    <option value="salud sexual">Salud sexual</option>
                </select>
            </div>
            <div class="filter-item">
                <div class="filter-title">Estado:</div>
                <select id="status" onchange="filterProducts()">
                    <option value="todos">Filtrar</option>
                    <option value="en-stock">En Stock</option>
                    <option value="sin-stock">Sin Stock</option>
                </select>
            </div>
            <div class="filter-item">
                <div class="filter-title">Buscar:</div>
                <div class="search-bar">
                    <input type="text" id="search-input" 
                           placeholder="Buscar producto por nombre..." 
                           oninput="filterProducts()">
                    <button><i class="fas fa-search"></i></button>
                </div>
            </div>
        </div>

        <div class="products-grid">
            <% List<Inventario> inV = (List<Inventario>) request.getAttribute("aInv");%>
            <% if (inV != null && !inV.isEmpty()) { 
                for (Inventario inr : inV) { %>
                <div class="product-card">
                    <div class="product-header">
                        <h3><%= inr.getProducto() %></h3>
                        <p>Estado: <span class="status en-stock"><%= inr.getEstadoStock() %></span></p>
                    </div>
                    <button class="more-options" onclick="toggleDetails(this)">
                        <span>Más detalles</span>
                        <i class="fas fa-chevron-down"></i>
                    </button>
                    <div class="product-details">
                        <div class="detail-item">
                            <i class="fas fa-tag"></i>
                            <span>Categoria: <%= inr.getCategoria()%></span>
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-dollar-sign"></i>
                            <span>Precio: S/. <%= inr.getPrecio() %></span>
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-calendar"></i>
                            <span>Fecha de Vencimiento: <%= inr.getFechaVencimiento() %></span>
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-info-circle"></i>
                            <span>Descripción: <%= inr.getDescripcion() %></span>
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-box"></i>
                            <span>Presentación: <%= inr.getPresentacion() %></span>
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-warehouse"></i>
                            <span>Cantidad en Stock: <%= inr.getCantidadEnStock() %></span>
                        </div>
                    </div>
                </div>
            <% } } else { %>
                <div class="empty-message">
                    <h2>Ningún producto registrado</h2>
                </div>
            <% } %>
        </div>
     </div>
    <script src="${pageContext.request.contextPath}/js/inventario-Admin.js"></script>
</body>
</html>


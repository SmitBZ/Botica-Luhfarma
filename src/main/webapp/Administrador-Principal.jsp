<%@ page session="true" %>
<%@page import="model.Usuario"%>
<%@page session="true" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <!-- Agrega esto dentro de la etiqueta <head> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/principal-Admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon"> 
    <title>BOTICA LUHFARMA</title>
</head>
<body class="bg-gray-100 font-sans antialiased">
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="${pageContext.request.contextPath}/img/logo.ico" alt="Logo" class="w-12 h-12"><h2>LUHFARMA</h2>
            <button class="close-btn" onclick="toggleSidebar()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <nav class="nav-links flex flex-col space-y-2 p-4">
            <a href="${pageContext.request.contextPath}/CantidadClientes" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-tachometer-alt w-5"></i>Dashboard</a>
            <a href="${pageContext.request.contextPath}/ListarProductos" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-pills mr-3"></i>Productos</a>
            <a href="${pageContext.request.contextPath}/ListarUsuario" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-users mr-3"></i>Usuarios</a>
            <a href="${pageContext.request.contextPath}/Administrador-Reporte.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-chart-line mr-3"></i>Reportes</a>
            <a href="${pageContext.request.contextPath}/ListarInventario" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Inventario</a>
            <a href="${pageContext.request.contextPath}/ListarVenta" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-shopping-cart mr-3"></i>Ventas</a>
            <a href="${pageContext.request.contextPath}/ListarProveedor" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-truck mr-3"></i>Proveedores</a>
            <a href="${pageContext.request.contextPath}/Compra" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-credit-card mr-3"></i>Compra</a>
            <a href="${pageContext.request.contextPath}/ListarAlmacen" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-warehouse mr-3"></i>Almacen</a>
            <a href="${pageContext.request.contextPath}/ListarCategoria" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Categoria</a>
            <a href="${pageContext.request.contextPath}/ListarPresentaciones" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Presentacion de Producto</a>
            
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
        <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i>Cerrar Sesión</a>
    </header>
    <main class="container mx-auto p-6">
        <section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <div class="stats-card bg-white rounded-xl shadow-sm p-6">
                <div class="flex items-center justify-between mb-4">
                    <div class="w-12 h-12 bg-blue-50 rounded-lg flex items-center justify-center"><i class="fas fa-box text-blue-600"></i></div>
                    <span class="text-sm font-medium text-green-600">+12.5%</span>
                </div>
                <h3 class="text-2xl font-semibold text-gray-800">167</h3>
                <p class="text-sm text-gray-500">Productos en Stock</p>
            </div>

            <div class="stats-card bg-white rounded-xl shadow-sm p-6">
                <div class="flex items-center justify-between mb-4">
                    <div class="w-12 h-12 bg-green-50 rounded-lg flex items-center justify-center"><i class="fas fa-dollar-sign text-green-600"></i></div>
                    <span class="text-sm font-medium text-green-600">+8.2%</span>
                </div>
                <h3 class="text-2xl font-semibold text-gray-800">$12,435</h3>
                <p class="text-sm text-gray-500">Ventas del Mes</p>
            </div>

            <div class="stats-card bg-white rounded-xl shadow-sm p-6">
                <div class="flex items-center justify-between mb-4">
                    <div class="w-12 h-12 bg-purple-50 rounded-lg flex items-center justify-center">
                        <i class="fas fa-users text-purple-600"></i>
                    </div>
                    <span class="text-sm font-medium text-green-600">+4.5%</span>
                </div>
                <h3 class="text-2xl font-semibold text-gray-800">${numClientes}</h3>
                <p class="text-sm text-gray-500">Clientes Nuevos</p>
            </div>


            <div class="stats-card bg-white rounded-xl shadow-sm p-6">
                <div class="flex items-center justify-between mb-4">
                    <div class="w-12 h-12 bg-red-50 rounded-lg flex items-center justify-center"><i class="fas fa-exclamation-triangle text-red-600"></i></div>
                    <span class="text-sm font-medium text-red-600">+2.3%</span>
                </div>
                <h3 class="text-2xl font-semibold text-gray-800">23</h3>
                <p class="text-sm text-gray-500">Productos por Vencer</p>
            </div>
        </section>

        <section class="cards-grid grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-4">
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/frasco-de-pastillas.gif" alt="Productos" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">PRODUCTOS</span>
            </div>
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/usuario.gif" alt="Usuarios" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">USUARIOS</span>
            </div>
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/estadisticas.gif" alt="Reportes" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">REPORTES</span>
            </div>
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/inventario.gif" alt="Inventario" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">INVENTARIO</span>
            </div>
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/flujo-de-ventas.gif" alt="Ventas" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">VENTAS</span>
            </div>
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/arquitectura-empresarial.gif" alt="Proveedores" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">PROVEEDORES</span>
            </div>
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/camion-de-reparto.gif" alt="Proveedores" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">COMPRA</span>
            </div>
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/deposito.gif" alt="Proveedores" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">ALMACEN</span>
            </div>
            <div class="card bg-white rounded-lg shadow-md p-4 text-center">
                <img src="${pageContext.request.contextPath}/img/categoria.gif" alt="Proveedores" class="mx-auto mb-2 w-12 h-12">
                <span class="text-gray-700 font-medium">CATEGORIA</span>
            </div>    
        </section>
    </main>

    <script src="${pageContext.request.contextPath}/js/principal-Admin.js"></script>
</body>
</html>

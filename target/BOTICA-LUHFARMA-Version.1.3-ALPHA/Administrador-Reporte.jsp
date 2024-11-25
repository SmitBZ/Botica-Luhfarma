<%@ page session="true" %>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reporte-Admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon"> 
    <title>BOTICA LUHFARMA</title>
</head>
<body>
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="../img/logo.ico" alt="Logo" class="w-12 h-12"><h2>LUHFARMA</h2>
            <button class="close-btn" onclick="toggleSidebar()"><i class="fas fa-times"></i></button>
        </div>
<nav class="nav-links flex flex-col space-y-2 p-4">
            <a href="${pageContext.request.contextPath}/CantidadClientes" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-tachometer-alt w-5"></i>Dashboard</a>
            <a href="${pageContext.request.contextPath}/Administrador-Producto.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-pills mr-3"></i>Productos</a>
            <a href="${pageContext.request.contextPath}/ListarUsuarios" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-users mr-3"></i>Usuarios</a>
            <a href="${pageContext.request.contextPath}/Administrador-Reporte.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-chart-line mr-3"></i>Reportes</a>
            <a href="${pageContext.request.contextPath}/Administrador-Inventario.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Inventario</a>
            <a href="${pageContext.request.contextPath}/Administrador-Venta.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-shopping-cart mr-3"></i>Ventas</a>
            <a href="${pageContext.request.contextPath}/ListarProveedor" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-truck mr-3"></i>Proveedores</a>
            <a href="${pageContext.request.contextPath}/Compra" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-credit-card mr-3"></i>Compra</a>
            <a href="${pageContext.request.contextPath}/ListarAlmacen" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-warehouse mr-3"></i>Almacen</a>
            <a href="${pageContext.request.contextPath}/Administrador-Categorias" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Categoria</a>
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
                    
    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
        <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i> Cerrar Sesión</a>
    </header>
    <br><br><br><br><br>
    <div class="container">
        <div class="titulo">
            <h1>Reporte de Ventas de Medicamentos</h1>
            <p>Resumen del mes: Octubre 2024</p>
        </div>
        <div class="stats-container">
            <div class="stat-card">
                <h3>Ventas Totales</h3>
                <p>$258,432</p>
            </div>
            <div class="stat-card">
                <h3>Medicamentos Vendidos</h3>
                <p>1,543</p>
            </div>
            <div class="stat-card">
                <h3>Clientes Atendidos</h3>
                <p>856</p>
            </div>
            <div class="stat-card">
                <h3>Ganancia Neta</h3>
                <p>$86,144</p>
            </div>
        </div>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Medicamento</th>
                        <th>Categoría</th>
                        <th>Unidades Vendidas</th>
                        <th>Precio Unitario</th>
                        <th>Total</th>
                        <th>Estado de Stock</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Paracetamol 500mg</td>
                        <td>Analgésicos</td>
                        <td>450</td>
                        <td>$5.99</td>
                        <td>$2,695.50</td>
                        <td><span class="status status-high">Alto</span></td>
                    </tr>
                    <tr>
                        <td>Amoxicilina 250mg</td>
                        <td>Antibióticos</td>
                        <td>320</td>
                        <td>$12.50</td>
                        <td>$4,000.00</td>
                        <td><span class="status status-medium">Medio</span></td>
                    </tr>
                    <tr>
                        <td>Omeprazol 20mg</td>
                        <td>Antiácidos</td>
                        <td>280</td>
                        <td>$8.75</td>
                        <td>$2,450.00</td>
                        <td><span class="status status-low">Bajo</span></td>
                    </tr>
                    <tr>
                        <td>Loratadina 10mg</td>
                        <td>Antialérgicos</td>
                        <td>195</td>
                        <td>$6.25</td>
                        <td>$1,218.75</td>
                        <td><span class="status status-high">Alto</span></td>
                    </tr>
                    <tr>
                        <td>Ibuprofeno 400mg</td>
                        <td>Antiinflamatorios</td>
                        <td>298</td>
                        <td>$7.50</td>
                        <td>$2,235.00</td>
                        <td><span class="status status-medium">Medio</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/js/reporte-Admin.js"></script>
</body>
</html>
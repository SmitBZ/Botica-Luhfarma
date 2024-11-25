<%@page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOTICA LUHFARMA</title>
    <link rel="icon" href="../img/logo.ico" type="image/x-icon"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="../css/reporte-Employee.css" rel="stylesheet">
</head>
<body>
        <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="../img/logo.ico" alt="Logo" class="w-12 h-12">
            <button class="close-btn" onclick="toggleSidebar()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <nav class="nav-links flex flex-col space-y-2 p-4">
            <a href="reporte.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-chart-bar mr-3"></i> Reportes
            </a>
            <a href="inventario.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-box mr-3"></i> Inventario
            </a>
            <a href="principal.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-shopping-cart mr-3"></i> Ventas
            </a>
<%@ page session="true" %>
<% 
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario != null) {
        String nombreUsuario = usuario.getNombre();
        String correoUsuario = usuario.getCorreo();
%>
<div class="mt-auto pt-4 border-t">
    <div class="flex items-center">
        <img src="${pageContext.request.contextPath}/img/pr.webp" alt="Usuario" class="w-8 h-8 rounded-full">
        <div class="ml-3">
            <p class="text-sm font-medium text-gray-700"><%= nombreUsuario %></p>
            <p class="text-xs text-gray-500"><%= correoUsuario %></p>
        </div>
    </div>
</div>
<% 
    } else {
        response.sendRedirect("login.jsp"); // Si no hay usuario en la sesión, redirigir al login
    }
%>
        </nav>
    </aside>

    <!-- Header -->
    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()">
            <i class="fas fa-bars"></i>
        </button>
        <a href="../index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600">
            <i class="fas fa-sign-out-alt mr-2"></i> Cerrar Sesión
        </a>
    </header>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="container">
        
        <div class="grid">
            <div class="sales-list">
                <h2>Ventas por Fecha</h2>
                <div class="sale-item" onclick="showDetails(1)">
                    <div class="sale-header">
                        <div>
                            <strong>28/10/2024</strong>
                            <div>Juan Pérez</div>
                        </div>
                        <div>S/. 156.50</div>
                    </div>
                </div>
                <div class="sale-item" onclick="showDetails(2)">
                    <div class="sale-header">
                        <div>
                            <strong>29/10/2024</strong>
                            <div>María García</div>
                        </div>
                        <div>S/. 245.75</div>
                    </div>
                </div>
            </div>

            <div class="sales-details">
                <h2>Detalles de Venta</h2>
                <div id="saleDetails">
                    <p class="empty-state">Seleccione una venta para ver sus detalles</p>
                </div>
            </div>
        </div>
    </main>
    <script src="../js/reporte-Employee.js"></script>
</body>
</html>
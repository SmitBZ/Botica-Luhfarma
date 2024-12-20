<%@page import="model.Categoria"%>
<%@page import="model.Categoria"%>
<%@page import="model.Usuario"%>
<%@page import="model.Inventario"%>
<%@page import="java.util.List"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inventario-Employee.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon">
    <title>BOTICA LUHFARMA</title>
</head>
<body>
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="${pageContext.request.contextPath}/img/logo.ico" alt="Logo" class="w-12 h-12">
            <button class="close-btn" onclick="toggleSidebar()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <nav class="nav-links flex flex-col space-y-2 p-4">
            <a href="ListarReporteEmpleado" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-chart-bar mr-3"></i> Reportes
            </a>
            <a href="ListarInventarioEmpleado" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-box mr-3"></i> Inventario
            </a>
            <a href="Empleado-Principal.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600">
                <i class="fas fa-shopping-cart mr-3"></i> Ventas
            </a>
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
                        <p class="text-sm font-medium text-gray-700">
                            <%= nombreUsuario %>
                        </p>
                        <p class="text-xs text-gray-500">
                            <%= correoUsuario %>
                        </p>
                    </div>
                </div>
            </div>
            <% 
                } else {
                    response.sendRedirect("index.jsp");
                }
            %>
        </nav>
    </aside>

    <!-- Header -->
    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()">
            <i class="fas fa-bars"></i>
        </button>
        <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600">
            <i class="fas fa-sign-out-alt mr-2"></i> Cerrar Sesi�n
        </a>
    </header>
    <br><br><br><br><br>
    
    <div class="container">
        <div class="filters">
            <form method="post" action="ListarInventarioEmpleado">
                <div class="filter-item">
                    <div class="filter-title">
                        Filtrar por:
                    </div>
                    <select id="filter-by" name="txtCategoria">
                        <option value="Todo">
                            Todo
                        </option>
                        <% 
                            List<Categoria> aLista = (List<Categoria>) request.getAttribute("aLista"); 
                            if (aLista != null && !aLista.isEmpty()) {
                                for (Categoria ct : aLista) {
                        %>
                        <option value="<%= ct.getNombre() %>"><%= ct.getNombre() %></option>
                        <% 
                                }
                            } else { 
                        %>
                        <option disabled>
                            No hay categor�as registradas disponibles
                        </option>
                        <% 
                            } 
                        %>
                    </select>
                </div>
                <div class="filter-item">
                    <div class="filter-title">
                        Estado:
                    </div>
                    <select id="status"  name="txtEstado">
                        <option value="todos">
                            Filtrar
                        </option>
                        <option value="En Stock">
                            En Stock
                        </option>
                        <option value="Sin Stock">
                            Sin Stock
                        </option>
                    </select>
                </div>
                <div class="filter-item">
                    <div class="filter-title">
                        Buscar:
                    </div>
                    <div class="search-bar">
                        <input type="text" id="search-input" name="txtNombre"placeholder="Buscar producto por nombre...">
                        <button>
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <div class="products-grid">
            <% 
                List<Inventario> inV = (List<Inventario>) request.getAttribute("aInv");
                if (inV != null && !inV.isEmpty()) { 
                    for (Inventario inr : inV) { 
            %>
            <div class="product-card">
                <div class="product-header">
                    <h3><%= inr.getProducto() %></h3>
                    <p>
                        Estado: 
                        <span class="status en-stock">
                            <%= inr.getEstadoStock() %>
                        </span>
                    </p>
                </div>
                <button class="more-options" onclick="toggleDetails(this)">
                    <span>M�s detalles</span>
                    <i class="fas fa-chevron-down"></i>
                </button>
                <div class="product-details">
                    <div class="detail-item">
                        <i class="fas fa-tag"></i>
                        <span>
                            Categoria: <%= inr.getCategoria() %>
                        </span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-dollar-sign"></i>
                        <span>
                            Precio: S/. <%= inr.getPrecio() %>
                        </span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-calendar"></i>
                        <span>
                            Fecha de Vencimiento: <%= inr.getFechaVencimiento() %>
                        </span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-info-circle"></i>
                        <span>
                            Descripci�n: <%= inr.getDescripcion() %>
                        </span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-box"></i>
                        <span>
                            Presentaci�n: <%= inr.getPresentacion() %>
                        </span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-warehouse"></i>
                        <span>
                            Cantidad en Stock: <%= inr.getCantidadEnStock() %>
                        </span>
                    </div>
                </div>
            </div>
            <% 
                    } 
                } else { 
            %>
            <div class="empty-message">
                <h2>Ning�n producto registrado</h2>
            </div>
            <% 
                } 
            %>
        </div>
    </div>
        
    <script src="${pageContext.request.contextPath}/js/inventario-Employee.js"></script>
</body>
</html>
<%@page import="model.Reporte"%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOTICA LUHFARMA</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/reporte-Employee.css" rel="stylesheet">
</head>
<body>
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="${pageContext.request.contextPath}/img/logo.ico" alt="Logo" class="w-12 h-12">
            <button class="close-btn" onclick="toggleSidebar()"><i class="fas fa-times"></i></button>
        </div>
        <nav class="nav-links flex flex-col space-y-2 p-4">
            <a href="ListarReporteEmpleado" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-chart-bar mr-3"></i> Reportes</a>
            <a href="ListarInventarioEmpleado" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-box mr-3"></i> Inventario</a>
            <a href="Empleado-Principal.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-shopping-cart mr-3"></i> Ventas</a>
            <% Usuario usuario = (Usuario) session.getAttribute("usuario");%>
            <%if (usuario != null) {%>
            <%String nombreUsuario = usuario.getNombre();
            String correoUsuario = usuario.getCorreo();%>
            <div class="mt-auto pt-4 border-t">
                <div class="flex items-center">
                    <img src="${pageContext.request.contextPath}/img/pr.webp" alt="Usuario" class="w-8 h-8 rounded-full">
                    <div class="ml-3">
                        <p class="text-sm font-medium text-gray-700"><%= nombreUsuario %></p>
                        <p class="text-xs text-gray-500"><%= correoUsuario %></p>
                    </div>
                </div>
            </div>
            <% } else {
                    response.sendRedirect("index.jsp"); // Si no hay usuario en la sesión, redirigir al login
                }
            %>
        </nav>
    </aside>

    <!-- Header -->
    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()">
            <i class="fas fa-bars"></i>
        </button>
        <a href="index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600">
            <i class="fas fa-sign-out-alt mr-2"></i> Cerrar Sesión
        </a>
    </header>
    <br><br>
<div class="container">        
        <div class="mb-6">
    <form action="${pageContext.request.contextPath}/ReporteBuscar" method="get" class="flex items-center justify-center space-x-4">
        <!-- Campo de fecha de inicio -->
        <div class="relative">
            <label for="fechaInicio" class="block text-gray-700">Fecha Inicio:</label>
            <input type="date" name="fechaInicio" id="fechaInicio" class="p-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300">
        </div>

        <!-- Campo de fecha de fin -->
        <div class="relative">
            <label for="fechaFin" class="block text-gray-700">Fecha Fin:</label>
            <input type="date" name="fechaFin" id="fechaFin" class="p-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300">
        </div>

        <!-- Campo de ID de Cliente -->
        <div class="relative">
            <label for="idCliente" class="block text-gray-700">ID Cliente:</label>
            <input type="number" name="idCliente" id="idCliente" placeholder="ID Cliente" class="p-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300">
        </div>

        <!-- Botón de búsqueda -->
        <button type="submit" class="bg-blue-600 text-white py-2 px-6 rounded-full hover:bg-blue-700 focus:outline-none transition duration-300">
            Buscar
        </button>
    </form>
</div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Modalidad</th>
                        <th>Estado</th>
                        <th>Medicamento</th>
                        <th>Categoría</th>
                        <th>Tipo de Presentacion</th>
                        <th>Unidades Vendidas</th>
                        <th>Precio Unitario</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            List<Reporte> ListaRe = (List<Reporte>) request.getAttribute("aLista");
                            if(ListaRe != null && !ListaRe.isEmpty()){
                                for(Reporte rp : ListaRe){
                            
                        %>
                        <td><%= rp.getFecha() %></td>
                        <td><%= rp.getCliente() %></span></td>
                        <td><span class="status status-high"><%= rp.getEstado() %></span></td>
                        <td><%= rp.getMedicamento() %></td>
                        <td><%= rp.getCategoria() %></td>
                        <td><%= rp.getPresentacion() %></td>
                        <td><%= rp.getUnidadesVendidas() %></td>
                        <td><%= rp.getPrecioUnitario() %></td>
                        <td><%= rp.getTotalVenta() %></td>
                    </tr>
                    <%      }
                        } else {
                    %>
                        <td colspan="9" class="text-gray-600 hover:text-gray-800"><center>No hay reporte registrado</center></td>
                    <% 
                        } 
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/reporte-Employee.js"></script>
</body>
</html>
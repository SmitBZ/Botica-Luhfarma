<%@page import="model.Almacen"%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@page session="true" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/almacen-Admin.css">
        <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon"> 
        <title>BOTICA LUHFARMA</title>
    </head>

    <body class="bg-gray-100 font-sans antialiased">
        <!-- Sidebar -->
        <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
            <div class="sidebar-header flex items-center justify-between p-4">
                <img src="${pageContext.request.contextPath}/img/logo.ico" alt="Logo" class="w-12 h-12"><h2>LUHFARMA</h2>
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
        
        <br><br><br><br>
    
        <!-- Header -->
        <header class="header flex items-center justify-between p-4 bg-white shadow-md">
            <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
            <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i>Cerrar Sesión</a>
        </header>
    
        <!-- Content -->
        <div class="container mx-auto px-4 py-8">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-gray-800">Almacenes</h1>
                <button onclick="openAddWarehouseModal()" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-lg flex items-center"><i class="fas fa-plus mr-2"></i> Agregar Almacén</button>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <% List<Almacen> aLista = (List<Almacen>) request.getAttribute("aLista"); if (aLista != null && !aLista.isEmpty()) {for (Almacen almacen : aLista) {%>
                <div class="bg-white shadow-md rounded-lg p-6 hover:shadow-xl transition-shadow">
                    <div class="flex justify-between items-center mb-4"><h2 class="text-xl font-semibold text-gray-800"><%= almacen.getNombre() %></h2></div>
                    <div class="space-y-2">
                        <p class="text-gray-600"><i class="fas fa-cube mr-2"></i>Capacidad: <%= almacen.getCapacidad() %> m²</p>
                        <p class="text-gray-600"><i class="fas fa-cube mr-2"></i>Descripcion: <%= almacen.getDescripcion() %></p>
                    </div>
                    <div class="mt-4 flex justify-between">
                        <button class="text-blue-500 hover:text-blue-700"><i class="fas fa-edit mr-1"></i>Editar</button>
                        <button class="text-red-500 hover:text-red-700" onclick="openDeleteModal(<%= almacen.getIdAlmacen() %>)"><i class="fas fa-trash-alt mr-1"></i>Eliminar</button>
                    </div>
                </div>
                <% }} else { %><p class="text-gray-500">No hay almacenes disponibles.</p><% } %>
            </div>
        </div>
        
        <!-- Boton para agregar almacén -->    
        <div id="addWarehouseModal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center">
            <div class="bg-white rounded-lg shadow-xl p-6 w-96">
                <div class="flex justify-between items-center mb-4">
                    <h2 class="text-xl font-semibold text-gray-800">Agregar Nuevo Almacén</h2>
                    <button onclick="closeAddWarehouseModal()" class="text-gray-600 hover:text-gray-900"><i class="fas fa-times"></i></button>
                </div>
                <form id="addWarehouseForm" class="space-y-4" method="post" action="${pageContext.request.contextPath}/RegistrarAlmacen">
                    <div>
                        <label for="warehouseName" class="block text-sm font-medium text-gray-700">Nombre del Almacén</label>
                        <input type="text" id="txtNombre" name="txtNombre" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200">
                    </div>
                    <div>
                        <label for="warehouseCapacity" class="block text-sm font-medium text-gray-700">Capacidad (m²)</label>
                        <input type="text" id="txtCapacidad" name="txtCapacidad" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200">
                    </div>
                    <div>
                        <label for="warehouseCapacity" class="block text-sm font-medium text-gray-700">Discripcion</label>
                        <textarea id="txtDescripcion" name="txtDescripcion" rows="2" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200"></textarea>
                    </div>
                    <div class="flex justify-end space-x-2 pt-4">
                        <button type="button" onclick="closeAddWarehouseModal()" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300">Cancelar</button>
                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
         
        <div id="deleteCategoryModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
            <div class="bg-white rounded-lg p-6 w-96">
                <h2 class="text-xl font-bold mb-4 text-red-600">Eliminar Almacen</h2>
                <p class="mb-4">¿Está seguro de que desea eliminar el Almacen Seleccionado?</p>
                <div class="flex justify-end space-x-2">
                    <button onclick="closeDeleteModal()" class="bg-gray-500 text-white px-4 py-2 rounded">Cancelar</button>
                    <button onclick="confirmDelete()" class="bg-red-500 text-white px-4 py-2 rounded">Eliminar</button>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/almacen-Admin.js"></script>
    </body>
</html>

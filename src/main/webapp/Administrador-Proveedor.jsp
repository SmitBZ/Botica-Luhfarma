<%@page import="model.Usuario"%>
<%@ page session="true" %>
<%@page import="java.util.List"%>
<%@page import="model.Proveedor"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/proveedor-Admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon">
    <title>BOTICA LUHFARMA</title>
</head>
<body class="bg-gray-100">
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="${pageContext.request.contextPath}/img/logo.ico" alt="Logo" class="w-12 h-12"><h2>LUHFARMA</h2>
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
                    
    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
        <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i>Cerrar Sesión</a>
    </header>
    

    <main class="main-content">
        <div class="bg-white rounded-lg shadow-sm">
            <div class="p-4 flex justify-between items-center border-b">
                <h2 class="text-xl font-bold text-gray-800">Gestión de Proveedores</h2>
                <button onclick="openModal('proveedorModal')" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 flex items-center"><i class="fas fa-plus mr-2"></i>Nuevo Proveedor</button>
            </div>
        
            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">#</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Empresa</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">RUC</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Telefono</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Direccion</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Entidad</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <%List<Proveedor> lista = (List<Proveedor>) request.getAttribute("aLista");if(lista != null && !lista.isEmpty()){for (Proveedor proveedor : lista) {%>
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap"><%= proveedor.getIdProveedor() %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= proveedor.getNombre() %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= proveedor.getRuc() %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= proveedor.getCorreo() %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= proveedor.getTelefono() %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= proveedor.getDireccion() %></td>
                        <td class="px-6 py-4 whitespace-nowrap"><%= proveedor.getEntidad() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                            <div class="flex space-x-2">
                                <button class="text-blue-600 hover:text-blue-900" onclick="editProveedor(this)" data-id="<%= proveedor.getIdProveedor() %>"data-nombre="<%= proveedor.getNombre() %>"data-ruc="<%= proveedor.getRuc() %>"data-correo="<%= proveedor.getCorreo() %>"data-telefono="<%= proveedor.getTelefono() %>"data-direccion="<%= proveedor.getDireccion() %>"data-entidad="<%= proveedor.getEntidad() %>"><i class="fas fa-edit"></i></button>
                                <button class="text-red-600 hover:text-red-900" onclick="openDeleteModal(<%= proveedor.getIdProveedor() %>)"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                        <%}}else{%><td colspan="8" class="px-6 py-4 whitespace-nowrap"><center>Ningun proveedor registrado</center></td><%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    
    <div id="proveedorModal" class="modal">
        <div class="modal-content">
            <div class="p-6">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-bold text-gray-900">Nuevo Proveedor</h3>
                    <button onclick="closeModal('proveedorModal')" class="text-gray-500 hover:text-gray-700"><i class="fas fa-times"></i></button>
                </div>
                <form id="proveedorForm" method="post" action="${pageContext.request.contextPath}/RegistrarProveedor">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Nombre</label>
                            <input type="text" name="txtNombre" id="txtNombre" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Dirección</label>
                            <input type="text" name="txtDireccion" id="txtDireccion" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                            <input type="email" name="txtCorreo" id="txtCorreo" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Teléfono</label>
                            <input type="tel" name="txtTelefono" id="txtTelefono"class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">RUC</label>
                            <input type="text" name="txtRuc" id="txtRuc" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Entidad</label>
                            <select name="txtEntidad" id="txtEntidad"class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                                <option value="Publica">Publica</option>
                                <option value="Privada">Privada</option>
                            </select>
                        </div>
                    </div>
                    <div class="mt-6 flex justify-end space-x-3">
                        <button type="button" onclick="closeModal('proveedorModal')" class="px-4 py-2 border rounded-lg text-gray-700 hover:bg-gray-50">Cancelar</button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
                    
                    
    <div id="deleteProveedorModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
            <div class="bg-white rounded-lg p-6 w-96">
                <h2 class="text-xl font-bold mb-4 text-red-600">Eliminar Proveedor</h2>
                <p class="mb-4">¿Está seguro de que desea eliminar el proveedor Seleccionado?</p>
                <div class="flex justify-end space-x-2">
                    <button onclick="closeDeleteModal()" class="bg-gray-500 text-white px-4 py-2 rounded">Cancelar</button>
                    <button onclick="confirmDelete()" class="bg-red-500 text-white px-4 py-2 rounded">Eliminar</button>
                </div>
            </div>
    </div>
                    
    <script src="${pageContext.request.contextPath}/js/proveedor-Admin.js"></script>
</body>
</html>
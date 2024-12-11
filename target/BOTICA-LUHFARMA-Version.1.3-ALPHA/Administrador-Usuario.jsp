<%@ page session="true" %>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usuario-Admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon">
    <title>BOTICA LUHFARMA</title>
</head>
<body>
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

    <header class="header">
        <button class="menu-btn" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
        <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i>Cerrar Sesión</a>
    </header>
    <br><br><br><br><br>
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <div class="flex items-center mb-6">
                <form action="${pageContext.request.contextPath}/ListarUsuario" method="post" class="flex items-center space-x-2 w-full">
                    <div class="relative flex items-center space-x-2">
                        <select name="txtRol" class="p-2 border-2 border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300" style="max-width: 120px;">
                            <option value="" selected>Seleccionar rol</option>
                            <option value="cliente">Cliente</option>
                            <option value="administrador">Administrador</option>
                            <option value="empleado">Empleado</option>
                        </select>
                        <div class="relative">
                            <input type="text" name="txtNombre" placeholder="Buscar por nombre" class="p-2 pl-4 pr-10 border-2 border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300" style="max-width: 250px;"/>
                            <button type="submit" class="absolute right-0 top-1/2 transform -translate-y-1/2 px-3 py-1 text-gray-500">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <div class="relative flex items-center space-x-2">
                    <form method="post" action="ExportarUsuarios">
                        <button class="btn btn-success"><i class="fas fa-file-excel mr-2"></i>Exportar a Excel</button>
                    </form>
                    <button class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-2 rounded-md flex items-center transition duration-300" onclick="toggleAddUserModal()">
                        <i class="fas fa-user-plus mr-2"></i>Agregar Usuario
                    </button>
                </div>
            </div>
            <br>
            <div class="overflow-x-auto">
                <table class="min-w-full bg-white">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Codigo</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rol</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nombre</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Apellido</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Correo</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Telefono</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Contraseña</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Aciones</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <%
                            List<Usuario> lista = (List<Usuario>) request.getAttribute("aLista");
                            if (lista != null && !lista.isEmpty()) {
                                for (Usuario us : lista) {
                        %>
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= us.getIdUsuario() %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= us.getRol() %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= us.getNombre() %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= us.getApellido() %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= us.getCorreo() %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= us.getTelefono() %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= us.getContraseña()%></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium space-x-2">
                                <button class="text-blue-500 hover:text-blue-700" onclick="openEditModal('<%= us.getIdUsuario() %>', '<%= us.getNombre() %>', '<%= us.getApellido() %>', '<%= us.getCorreo() %>', '<%= us.getTelefono() %>', '<%= us.getContraseña() %>','<%= us.getRol() %>')"><i class="fas fa-edit mr-1"></i></button>
                                <button class="text-red-500 hover:text-red-700" onclick="openDeleteModal(<%= us.getIdUsuario() %>)"><i class="fas fa-trash-alt mr-1"></i></button>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="8" class="text-center text-gray-500">No hay usuarios disponibles.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div id="addUserModal" class="modal hidden fixed inset-0 bg-gray-500 bg-opacity-50 flex justify-center items-center">
        <div class="modal-content bg-white rounded-lg p-8 w-full max-w-2xl">
            <span class="close float-right cursor-pointer" onclick="toggleCloseAddUserModal()">&times;</span>
            <h2 class="text-2xl font-bold mb-6">Agregar Usuario</h2>
            <form action="${pageContext.request.contextPath}/RegistrarUsuario" method="post">
                <input type="hidden" name="action" value="add">
                <div class="grid grid-cols-2 gap-6">
                    <div>
                        <label for="nombre" class="block text-gray-700 font-medium mb-2">Nombre:</label>
                        <input type="text" name="txtNombre" id="txtNombre" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="apellido" class="block text-gray-700 font-medium mb-2">Apellido:</label>
                        <input type="text" name="txtApellido" id="txtApellido" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="email" class="block text-gray-700 font-medium mb-2">Email:</label>
                        <input type="email" name="txtCo" id="txtCo" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="telefono" class="block text-gray-700 font-medium mb-2">Teléfono:</label>
                        <input type="text" name="txtTelefono" id="txtTelefono" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="contraseña" class="block text-gray-700 font-medium mb-2">Contraseña:</label>
                        <input type="password" name="txtPass" id="txtPass" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="rol" class="block text-gray-700 font-medium mb-2">Rol:</label>
                        <select name="txtRol" id="txtRol" class="border rounded w-full py-3 px-4" required>
                            <option value="empleado">empleado</option>
                            <option value="administrador">administrador</option>
                        </select>
                    </div>
                </div>
                <div class="mt-6 text-right">
                    <button type="submit" class="bg-blue-600 text-white px-6 py-3 rounded hover:bg-blue-700">Agregar Usuario</button>
                </div>
            </form>
        </div>
    </div>
                
    <div id="editUserModal" class="modal hidden fixed inset-0 bg-gray-500 bg-opacity-50 flex justify-center items-center">
        <div class="modal-content bg-white rounded-lg p-8 w-full max-w-2xl">
            <span class="close float-right cursor-pointer" onclick="closeEditModal()">&times;</span>
            <h2 class="text-2xl font-bold mb-6">Agregar Usuario</h2>
            <form action="${pageContext.request.contextPath}/EditarUsuario" method="post">
                <input type="hidden" name="action" value="add">
                <div class="grid grid-cols-2 gap-6">
                    <input type="hidden" id="editUsuario" name="idUsuario">
                    <div>
                        <label for="nombre" class="block text-gray-700 font-medium mb-2">Nombre:</label>
                        <input type="text" name="nombre" id="editNombre" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="apellido" class="block text-gray-700 font-medium mb-2">Apellido:</label>
                        <input type="text" name="apellido" id="editApellido" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="email" class="block text-gray-700 font-medium mb-2">Email:</label>
                        <input type="email" name="correo" id="editCorreo" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="telefono" class="block text-gray-700 font-medium mb-2">Teléfono:</label>
                        <input type="text" name="telefono" id="editTelefono" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="contraseña" class="block text-gray-700 font-medium mb-2">Contraseña:</label>
                        <input type="password" name="password" id="editPass" class="border rounded w-full py-3 px-4" required>
                    </div>
                    <div>
                        <label for="rol" class="block text-gray-700 font-medium mb-2">Rol:</label>
                        <select name="rol" id="editRol" class="border rounded w-full py-3 px-4" required>
                            <option value="empleado">empleado</option>
                            <option value="administrador">administrador</option>
                        </select>
                    </div>
                </div>
                <div class="mt-6 text-right">
                    <button type="submit" class="bg-red-600 text-white px-6 py-3 rounded hover:bg-blue-700" onclick="closeEditModal()">Cancelar</button>
                    <button type="submit" class="bg-green-600 text-white px-6 py-3 rounded hover:bg-blue-700">Editar</button>
                </div>
            </form>
        </div>
    </div>
            
    <div id="deleteUserModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
            <div class="bg-white rounded-lg p-6 w-96">
                <h2 class="text-xl font-bold mb-4 text-red-600">Eliminar Usuario</h2>
                <p class="mb-4">¿Está seguro de que desea eliminar el usuario seleccionado?</p>
                <div class="flex justify-end space-x-2">
                    <button onclick="closeDeleteModal()" class="bg-gray-500 text-white px-4 py-2 rounded">Cancelar</button>
                    <button onclick="confirmDelete()" class="bg-red-500 text-white px-4 py-2 rounded">Eliminar</button>
                </div>
            </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/usuario-Admin.js"></script>
    
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
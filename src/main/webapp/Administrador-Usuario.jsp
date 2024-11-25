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

    <header class="header">
        <button class="menu-btn" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
        <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i>Cerrar Sesión</a>
    </header>
    <br><br><br><br><br>
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-gray-800">Lista de Usuarios</h1>
                <button class="bg-blue-600 text-white px-4 py-2 rounded-lg flex items-center hover:bg-blue-700 transition" onclick="document.getElementById('addUserModal').style.display='flex'"><i class="fas fa-user-plus mr-2"></i>Agregar Usuario</button>
            </div>
            <div class="flex space-x-2 justify-end">
                    <button class="bg-gray-100 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-200"><i class="fas fa-file-export mr-2"></i>Exportar</button>
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
                                
                                <form action="${pageContext.request.contextPath}/RegistrarUsuario" method="post" class="inline-block">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="id" value="<%= usuario.getIdUsuario() %>">
                                    <button type="button" onclick="openEditModal(<%= usuario.getIdUsuario() %>)" class="text-blue-600 hover:text-blue-900"><i class="fas fa-edit"></i></button>
                                </form>
                                
                                <form action="${pageContext.request.contextPath}/EliminarUsuario" method="post" class="inline-block" onsubmit="return confirm('¿Está seguro de eliminar este usuario?');">
                                    <input type="hidden" name="id" value="<%= usuario.getIdUsuario() %>">
                                    <button type="submit" class="text-red-600 hover:text-red-900"><i class="fas fa-trash"></i></button>
                                </form>
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

    <div id="addUserModal" class="modal fixed inset-0 bg-gray-800 bg-opacity-50 flex justify-center items-center" style="display: none;">
        <div class="modal-content bg-white rounded-lg p-6">
            <span class="close" onclick="document.getElementById('addUserModal').style.display='none'">&times;</span>
            <h2 class="text-xl font-bold mb-4">Agregar Usuario</h2>
            <form action="${pageContext.request.contextPath}/RegistrarUsuario" method="post">
                <input type="hidden" name="action" value="add">
                <div class="mb-4">
                    <label for="nombre" class="block text-gray-700">Nombre:</label>
                    <input type="text" name="txtNombre" id="txtNombre" class="border rounded w-full py-2 px-3" required>
                </div>
                <div class="mb-4">
                    <label for="apellido" class="block text-gray-700">Apellido:</label>
                    <input type="text" name="txtApellido" id="txtApellido" class="border rounded w-full py-2 px-3" required>
                </div>
                <div class="mb-4">
                    <label for="email" class="block text-gray-700">Email:</label>
                    <input type="email" name="txtCo" id="txtCo" class="border rounded w-full py-2 px-3" required>
                </div>
                <div class="mb-4">
                    <label for="telefono" class="block text-gray-700">Teléfono:</label>
                    <input type="text" name="txtTelefono" id="txtTelefono" class="border rounded w-full py-2 px-3" required>
                </div>
                <div class="mb-4">
                    <label for="contraseña" class="block text-gray-700">Contraseña:</label>
                    <input type="password" name="txtPass" id="txtPass" class="border rounded w-full py-2 px-3" required>
                </div>
                <div class="mb-4">
                    <label for="rol" class="block text-gray-700">Rol:</label>
                    <select name="txtRol" id="txtRol" class="border rounded w-full py-2 px-3" required>
                        <option value="empleado">empleado</option>
                        <option value="administrador">administrador</option>
                    </select>
                </div>
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded">Agregar Usuario</button>
            </form>
        </div>
    </div>
                
    <script src="${pageContext.request.contextPath}/js/usuario-Admin.js"></script>
</body>
</html>
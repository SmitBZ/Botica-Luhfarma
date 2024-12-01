<%@page import="model.Categoria"%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/principal-Admin.css">
        <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon"> 
        <title>BOTICA LUHFARMA</title>
    </head>
    
    <body class="bg-gray-100 font-sans antialiased">
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
            
        <br><br><br><br>
        
        <header class="header flex items-center justify-between p-4 bg-white shadow-md">
            <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
            <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i>Cerrar Sesión</a>
        </header>
    
        <div class="container mx-auto px-4 py-8">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold">Gestión de Categorías</h1>
                <button onclick="openAddModal()" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 font-bold py-2 px-4 rounded-lg flex items-center"><i class="fas fa-plus mr-2"></i>Agregar Categoría</button>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-4">
                <% List<Categoria> aLista = (List<Categoria>) request.getAttribute("aLista"); if (aLista != null && !aLista.isEmpty()) {for (Categoria ct : aLista) {%>
                <div class="bg-white shadow-md rounded-lg p-4 relative">
                    <h3 class="font-semibold mb-2"><%= ct.getNombre() %></h3>
                    <p class="text-gray-600 text-sm mb-4"><%= ct.getDescripcion() %></p>
                    <div class="flex justify-end space-x-2">
                        <button onclick="openEditModal(2)" class="text-blue-500 hover:text-blue-700"><i class="fas fa-edit"></i></button>
                        <button class="text-red-500 hover:text-red-700" onclick="openDeleteModal(<%= ct.getIdCategoria() %>)"><i class="fas fa-trash-alt mr-1"></i>Eliminar</button>
                    </div>
                </div>
                <% }} else { %><p class="text-gray-500">No hay categorias registradas disponibles.</p><% } %>
            </div>
        </div>

        <div id="addCategoryModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
            <div class="bg-white rounded-lg p-6 w-96">
                <h2 class="text-xl font-bold mb-4">Agregar Categoría</h2>
                <form id="addCategoryForm" method="post" action="${pageContext.request.contextPath}/RegistrarCategoria">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Nombre</label>
                        <input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700" id="txtNombre" name="txtNombre" required>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Descripción</label>
                        <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700" rows="3" id="txtDescripcion" name="txtDescripcion"></textarea>
                    </div>
                    <div class="flex justify-end space-x-2">
                        <button type="button" onclick="closeAddModal()" class="bg-gray-500 text-white px-4 py-2 rounded">Cancelar</button>
                        <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
        <div id="editCategoryModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
            <div class="bg-white rounded-lg p-6 w-96">
                <h2 class="text-xl font-bold mb-4">Editar Categoría</h2>
                <form id="editCategoryForm">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Nombre</label>
                        <input type="text" id="editCategoryName" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700" required>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Descripción</label>
                        <textarea id="editCategoryDescription" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700" rows="3"></textarea>
                    </div>
                    <div class="flex justify-end space-x-2">
                        <button type="button" onclick="closeEditModal()" class="bg-gray-500 text-white px-4 py-2 rounded">Cancelar</button>
                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
        <div id="deleteCategoryModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
            <div class="bg-white rounded-lg p-6 w-96">
                <h2 class="text-xl font-bold mb-4 text-red-600">Eliminar Categoría</h2>
                <p class="mb-4">¿Está seguro de que desea eliminar esta categoría?</p>
                <div class="flex justify-end space-x-2">
                    <button onclick="closeDeleteModal()" class="bg-gray-500 text-white px-4 py-2 rounded">Cancelar</button>
                    <button onclick="confirmDelete()" class="bg-red-500 text-white px-4 py-2 rounded">Eliminar</button>
                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/js/categoria-Admin.js"></script>
    </body>
</html>

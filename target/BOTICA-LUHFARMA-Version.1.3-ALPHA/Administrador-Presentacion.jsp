<%-- 
    Document   : Administrador-Presentacion
    Created on : 22 nov. 2024, 4:02:53 p. m.
    Author     : Smit
--%>

<%@page import="model.Presentacion"%>
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
                <a href="${pageContext.request.contextPath}/Administrador-Producto.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-pills mr-3"></i>Productos</a>
                <a href="${pageContext.request.contextPath}/ListarUsuarios" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-users mr-3"></i>Usuarios</a>
                <a href="${pageContext.request.contextPath}/Administrador-Reporte.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-chart-line mr-3"></i>Reportes</a>
                <a href="${pageContext.request.contextPath}/Administrador-Inventario.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Inventario</a>
                <a href="${pageContext.request.contextPath}/Administrador-Venta.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-shopping-cart mr-3"></i>Ventas</a>
                <a href="${pageContext.request.contextPath}/ListarProveedor" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-truck mr-3"></i>Proveedores</a>
                <a href="${pageContext.request.contextPath}/Compra" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-credit-card mr-3"></i>Compra</a>
                <a href="${pageContext.request.contextPath}/ListarAlmacen" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-warehouse mr-3"></i>Almacen</a>
                <a href="${pageContext.request.contextPath}/AdministradorCategorias" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Categoria</a>
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
        <%-- Add this after the </header> tag and before the closing </body> tag --%>
    <div class="container mx-auto px-4 py-8">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold text-gray-800">Presentaciones</h1>
        <button onclick="openAddPresentacionModal()" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded inline-flex items-center">
            <i class="fas fa-plus mr-2"></i> Agregar Presentación
        </button>
    </div>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <% List<Presentacion> pres = (List<Presentacion>) request.getAttribute("aPres");if (pres != null && !pres.isEmpty()) {for (Presentacion pr : pres) { %>
            <div class="bg-white shadow-md rounded-lg p-6">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-semibold text-gray-800"><%= pr.getNombre() %></h3>
                    <p class="text-gray-600"><%= pr.getDescripcion() %></p>
                    <div class="flex space-x-2">
                        <button class="text-blue-500 hover:text-blue-600">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button class="text-red-500 hover:text-red-600">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
        <% } } else { %>
        <div class="col-span-full text-center py-8">
            <p class="text-gray-500">No hay presentaciones registradas</p>
        </div>
        <% } %>
</div>

     

    <%-- Modal para Agregar Presentación --%>
    <div id="addPresentacionModal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center">
        <div class="bg-white rounded-lg shadow-xl p-6 w-96">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-bold text-gray-800">Agregar Presentación</h2>
                <button onclick="closeAddPresentacionModal()" class="text-gray-600 hover:text-gray-900">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/RegistrarPresentacion" method="post">
                <div class="mb-4">
                    <label for="nombrePresentacion" class="block text-gray-700 font-bold mb-2">Nombre</label>
                    <input type="text" id="txtNombre" name="txtNombre" required 
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div class="mb-4">
                    <label for="descripcionPresentacion" class="block text-gray-700 font-bold mb-2">Descripción (Opcional)</label>
                    <textarea id="txtDescripcion" name="txtDescripcion" 
                              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                </div>
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="closeAddPresentacionModal()" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded">
                        Cancelar
                    </button>
                    <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                        Guardar
                    </button>
                </div>
            </form>
        </div>
    </div>

    <%-- Modal para Editar Presentación --%>
    <div id="editPresentacionModal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center">
        <div class="bg-white rounded-lg shadow-xl p-6 w-96">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-bold text-gray-800">Editar Presentación</h2>
                <button onclick="closeEditPresentacionModal()" class="text-gray-600 hover:text-gray-900">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/EditarPresentacion" method="post">
                <input type="hidden" id="editPresentacionId" name="presentacionId">
                <div class="mb-4">
                    <label for="editNombrePresentacion" class="block text-gray-700 font-bold mb-2">Nombre</label>
                    <input type="text" id="editNombrePresentacion" name="nombrePresentacion" required 
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div class="mb-4">
                    <label for="editDescripcionPresentacion" class="block text-gray-700 font-bold mb-2">Descripción (Opcional)</label>
                    <textarea id="editDescripcionPresentacion" name="descripcionPresentacion" 
                              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                </div>
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="closeEditPresentacionModal()" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded">
                        Cancelar
                    </button>
                    <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                        Guardar Cambios
                    </button>
                </div>
            </form>
        </div>
    </div>

    <%-- Modal para Confirmar Eliminación --%>
    <div id="deletePresentacionModal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center">
        <div class="bg-white rounded-lg shadow-xl p-6 w-96">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-bold text-red-600">Confirmar Eliminación</h2>
                <button onclick="closeDeletePresentacionModal()" class="text-gray-600 hover:text-gray-900">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <p class="text-gray-700 mb-4">¿Está seguro que desea eliminar esta presentación?</p>
            <form action="${pageContext.request.contextPath}/EliminarPresentacion" method="post">
                <input type="hidden" id="deletePresentacionId" name="presentacionId">
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="closeDeletePresentacionModal()" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded">
                        Cancelar
                    </button>
                    <button type="submit" class="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded">
                        Eliminar
                    </button>
                </div>
            </form>
        </div>
    </div>

    <%-- JavaScript para Modales --%>
    <script src="${pageContext.request.contextPath}/js/presentacion-Admin.js"></script>
</div>

    </body>
</html>


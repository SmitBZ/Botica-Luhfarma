<%@page import="model.Presentacion"%>
<%@page import="model.Producto"%>
<%@page import="model.Almacen"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
<%@page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/producto-Admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon"> 
    <title>BOTICA LUHFARMA</title>
</head>
<body class="bg-gray-100">
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="${pageContext.request.contextPath}/img/logo.ico" alt="Logo" class="w-12 h-12"><h2>LUHFARMA</h2>
            <button class="close-btn" onclick="toggleSidebar()">
                <i class="fas fa-times"></i>
            </button>
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
    <br>
        <div class="table-container">
            <div class="p-4 flex justify-between items-center border-b">
                <h2 class="text-xl font-bold text-gray-800">Lista de Productos</h2>
            </div>
            <div class="p-4 flex justify-between items-center">
                <form method="post" action="ListarProductos">
                    <div class="flex space-x-2">
                        <input type="text"  name="txtNombre" placeholder="Buscar productos..." class="px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <button class="btn btn-primary"><i class="fas fa-search mr-2"></i>Buscar</button>
                    </div>
                </form>
                <div class="flex space-x-2">
                    <button class="btn btn-primary" onclick="openModal()"><i class="fas fa-plus mr-2"></i>Nuevo Producto</button>
                </div>
            </div>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Descripcion</th>
                            <th>Fecha de Produccion</th>
                            <th>Fecha de Caducidad</th>
                            <th>Categoría</th>
                            <th>Almacen</th>
                            <th>Presentacion</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <% List<Producto> aPr = (List<Producto>) request.getAttribute("aPrd"); if (aPr != null && !aPr.isEmpty()) {for (Producto pr : aPr) {%>
                            <td><%=pr.getIdProducto()%></td>
                            <td class="flex items-center space-x-2">
                                <img src="<%=pr.getImg()%>" alt="Producto" class="w-8 h-8 rounded">
                                <span><%=pr.getNombre()%></span>
                            </td>
                            <td>S/ <%= pr.getPrecio()%></td>
                            <td><%=pr.getDescripcion()%></td>
                            <td><%= pr.getFechaP()%></td>
                            <td><%=pr.getFechaV()%></td>
                            <td><%=pr.getCategoria()%></td>
                            <td><%=pr.getAlmacen()%></td>
                            <td><%=pr.getPresentacion()%></td>
                            <td class="flex space-x-2">
                                <button class="text-blue-600 hover:text-blue-800"><i class="fas fa-edit"></i></button>
                                <button class="text-red-600 hover:text-red-900" onclick="openDeleteModal(<%= pr.getIdProducto() %>)"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        <% }} else { %><td colspan="10" class="text-gray-600 hover:text-gray-800"><center>Ningun producto registrado</center></td><% } %>
                        
                    </tbody>
                </table>
            </div>
        </div>
    
    <div id="productModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden flex items-center justify-center">
        <div class="bg-white rounded-lg shadow-xl p-6 w-full max-w-2xl">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-bold text-gray-800" id="modalTitle">Nuevo Producto</h3>
                <button onclick="closeModal()" class="text-gray-500 hover:text-gray-700">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form id="productForm" class="space-y-4" method="post" action="${pageContext.request.contextPath}/RegistrarProducto" enctype="multipart/form-data">
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Nombre del Producto</label>
                        <input type="text" name="txtNombre" id="txtNombre" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Categoría</label>
                        <select name="txtCategoria" id="txtCategoria" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                            <option value="">Seleccionar categoría</option>
                            <% List<Categoria> aLista = (List<Categoria>) request.getAttribute("aLista"); if (aLista != null && !aLista.isEmpty()) {for (Categoria ct : aLista) {%>
                            <option value="<%= ct.getIdCategoria() %>"><%= ct.getNombre() %></option>
                            <% }} else { %><option disabled>No hay categorías registradas disponibles</option><% } %>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Precio</label>
                        <div class="mt-1 relative rounded-md shadow-sm">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <span class="text-gray-500 sm:text-sm">S/</span>
                            </div>
                            <input type="text" name="txtPrecio" id="txtPrecio" step="0.01" class="pl-8 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                        </div>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Cantidad en Inventario</label>
                        <input type="text" name="txtCantidad" id="txtCantidad" min="1" value="1" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Fecha de Producción</label>
                        <input type="date" name="txtFechaProdu" id="txtFechaProdu" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Fecha de Vencimiento</label>
                        <input type="date" name="txtFechaVen" id="txtFechaVen" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Tipo de Presentación</label>
                    <select name="txtPresentacion" id="txtPresentacion" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                        <option value="">Seleccionar presentación</option>
                        <% List<Presentacion> pres = (List<Presentacion>) request.getAttribute("aPres");if (pres != null && !pres.isEmpty()) {for (Presentacion pr : pres) { %>
                        <option value="<%= pr.getIdPresentacion() %>"><%= pr.getNombre() %></option>
                        <% }} else { %><option disabled>No hay presentaciones registradas disponibles</option><% } %>
                    </select>
                </div>
                <div>
                <label class="block text-sm font-medium text-gray-700">Almacén</label>
                <select name="txtAlmacen" id="txtAlmacen" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                    <option value="">Seleccionar almacén</option>
                    <% List<Almacen> almacen = (List<Almacen>) request.getAttribute("aLm"); if (almacen != null && !almacen.isEmpty()) {for (Almacen al : almacen) {%>
                    <option value="<%= al.getIdAlmacen() %>"><%= al.getNombre() %></option>
                    <% }} else { %><option disabled>No hay almacenes registradas disponibles</option><% } %>
                </select>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Imagen del Producto</label>
                    <input type="file" name="txtImagen" id="txtImagen" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Descripción</label>
                    <textarea name="txtDescripcion" id="txtDescripcion" rows="3" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"></textarea>
                </div>
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="closeModal()" class="px-4 py-2 border rounded-md text-gray-700 hover:bg-gray-50">Cancelar</button>
                    <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">Guardar Producto</button>
                </div>
            </form>
        </div>
    </div>
    
    <div id="deleteProductoModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
            <div class="bg-white rounded-lg p-6 w-96">
                <h2 class="text-xl font-bold mb-4 text-red-600">Eliminar producto</h2>
                <p class="mb-4">¿Está seguro de que desea eliminar el producto seleccionado?</p>
                <div class="flex justify-end space-x-2">
                    <button onclick="closeDeleteModal()" class="bg-gray-500 text-white px-4 py-2 rounded">Cancelar</button>
                    <button onclick="confirmDelete()" class="bg-red-500 text-white px-4 py-2 rounded">Eliminar</button>
                </div>
            </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/producto-Admin.js"></script>
</body>
</html>
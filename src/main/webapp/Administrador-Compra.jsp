<%@page import="model.Inventario"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inventario-Admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico" type="image/x-icon">
    <title>BOTICA LUHFARMA</title> 
</head>
<body>
    <body class="bg-gray-100 font-sans antialiased">
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="img/logo.ico" alt="Logo" class="w-12 h-12"><h2>LUHFARMA</h2>
            <button class="close-btn" onclick="toggleSidebar()"><i class="fas fa-times"></i></button>
        </div>
        <nav class="nav-links flex flex-col space-y-2 p-4">
            <a href="${pageContext.request.contextPath}/CantidadClientes" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-chart-line w-5"></i>Dashboard</a>
            <a href="${pageContext.request.contextPath}/Vista-Administrador/producto.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-pills mr-3"></i>Productos</a>
            <a href="${pageContext.request.contextPath}/ListarUsuarios" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-users mr-3"></i>Usuarios</a>
            <a href="${pageContext.request.contextPath}/Vista-Administrador/reporte.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-chart-bar mr-3"></i>Reportes</a>
            <a href="${pageContext.request.contextPath}/Vista-Administrador/inventario.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-box mr-3"></i>Inventario</a>
            <a href="${pageContext.request.contextPath}/Vista-Administrador/venta.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-shopping-cart mr-3"></i>Ventas</a>
            <a href="${pageContext.request.contextPath}/Vista-Administrador/proveedor.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-truck mr-3"></i>Proveedores</a>
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
                    response.sendRedirect("index.jsp"); // Si no hay usuario en la sesión, redirigir al login
                }
            %>
        </nav>
    </aside>
    <br><br><br><br>
    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
        <a href="index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i>Cerrar sesión</a>
    </header>

    <div class="container mx-auto px-4 py-8">
    <h2 class="text-2xl font-bold mb-6 text-center">Registro de Compra a Proveedor</h2>
    
    <form id="compraForm" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="proveedor">Proveedor</label>
                <select id="proveedor" class="shadow border rounded w-full py-2 px-3" required>
                    <option value="">Seleccione Proveedor</option>
                    <!-- Cargar proveedores dinámicamente -->
                </select>
            </div>
            
            <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="comprobante">Comprobante</label>
                <input type="text" id="comprobante" class="shadow border rounded w-full py-2 px-3" placeholder="Número de comprobante" required>
            </div>
            
            <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="fecha_pago">Fecha de Pago</label>
                <input type="date" id="fecha_pago" class="shadow border rounded w-full py-2 px-3" required>
            </div>
            
            <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="tipo_pago">Tipo de Pago</label>
                <select id="tipo_pago" class="shadow border rounded w-full py-2 px-3" required>
                    <option value="">Seleccione Tipo de Pago</option>
                    <!-- Cargar tipos de pago dinámicamente -->
                </select>
            </div>
        </div>

        <div class="mt-6">
            <h3 class="text-xl font-semibold mb-4">Detalle de Productos</h3>
            
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-4">
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="producto">Producto</label>
                    <select id="producto" class="shadow border rounded w-full py-2 px-3">
                        <option value="">Seleccione Producto</option>
                        <!-- Cargar productos dinámicamente -->
                    </select>
                </div>
                
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="cantidad">Cantidad</label>
                    <input type="number" id="cantidad" min="1" class="shadow border rounded w-full py-2 px-3">
                </div>
                
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="precio">Precio Unitario</label>
                    <input type="number" step="0.01" id="precio" min="0" class="shadow border rounded w-full py-2 px-3">
                </div>
                
                <div class="flex items-end">
                    <button type="button" onclick="agregarProducto()" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                        Agregar
                    </button>
                </div>
            </div>

            <table id="tablaProductos" class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="border p-2">Producto</th>
                        <th class="border p-2">Cantidad</th>
                        <th class="border p-2">Precio Unitario</th>
                        <th class="border p-2">Subtotal</th>
                        <th class="border p-2">Acciones</th>
                    </tr>
                </thead>
                <tbody id="listaProductos">
                    <!-- Productos se agregarán dinámicamente aquí -->
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3" class="text-right font-bold p-2">Total:</td>
                        <td id="totalCompra" class="font-bold p-2">0.00</td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div class="mt-4 text-right">
            <button type="button" onclick="finalizarCompra()" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                Registrar Compra
            </button>
        </div>
    </form>
</div>

<script>
    let productosCompra = [];

    function agregarProducto() {
        const producto = document.getElementById('producto');
        const cantidad = document.getElementById('cantidad');
        const precio = document.getElementById('precio');

        if (!producto.value || !cantidad.value || !precio.value) {
            alert('Por favor complete todos los campos del producto');
            return;
        }

        const nuevoProducto = {
            idProducto: producto.value,
            producto: producto.options[producto.selectedIndex].text,
            cantidad: cantidad.value,
            precioUnitario: parseFloat(precio.value),
            subtotal: parseFloat(cantidad.value) * parseFloat(precio.value)
        };

        productosCompra.push(nuevoProducto);
        actualizarTabla();

        // Limpiar campos
        producto.selectedIndex = 0;
        cantidad.value = '';
        precio.value = '';
    }

    function actualizarTabla() {
        const tabla = document.getElementById('listaProductos');
        const totalCompra = document.getElementById('totalCompra');
        tabla.innerHTML = '';
        let total = 0;

        productosCompra.forEach((producto, index) => {
            const fila = `
                <tr>
                    <td class="border p-2">${producto.producto}</td>
                    <td class="border p-2">${producto.cantidad}</td>
                    <td class="border p-2">${producto.precioUnitario.toFixed(2)}</td>
                    <td class="border p-2">${producto.subtotal.toFixed(2)}</td>
                    <td class="border p-2">
                        <button onclick="eliminarProducto(${index})" class="text-red-500 hover:text-red-700">
                            Eliminar
                        </button>
                    </td>
                </tr>
            `;
            tabla.innerHTML += fila;
            total += producto.subtotal;
        });

        totalCompra.textContent = total.toFixed(2);
    }

    function eliminarProducto(index) {
        productosCompra.splice(index, 1);
        actualizarTabla();
    }

    function finalizarCompra() {
        const proveedor = document.getElementById('proveedor');
        const comprobante = document.getElementById('comprobante');
        const fechaPago = document.getElementById('fecha_pago');
        const tipoPago = document.getElementById('tipo_pago');

        if (productosCompra.length === 0) {
            alert('No hay productos para comprar');
            return;
        }

        if (!proveedor.value || !comprobante.value || !fechaPago.value || !tipoPago.value) {
            alert('Por favor complete todos los campos del formulario');
            return;
        }

        const datosCompra = {
            idProveedor: proveedor.value,
            comprobante: comprobante.value,
            fechaPago: fechaPago.value,
            idTipoPago: tipoPago.value,
            productos: productosCompra
        };

        // Aquí implementarías la llamada AJAX para enviar los datos al servidor
        console.log('Datos de la compra:', datosCompra);
        alert('Compra registrada');

        // Limpiar formulario
        proveedor.selectedIndex = 0;
        comprobante.value = '';
        fechaPago.value = '';
        tipoPago.selectedIndex = 0;
        productosCompra = [];
        actualizarTabla();
    }
</script>
</body>
</html>



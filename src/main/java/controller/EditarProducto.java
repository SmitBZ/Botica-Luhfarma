package controller;

import dao.ProductoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDate;
import model.Producto;

/**
 *
 * @author Smit
 */
@WebServlet(name = "EditarProducto", urlPatterns = {"/EditarProducto"})
public class EditarProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProducto = request.getParameter("idProducto");
        String nombre = request.getParameter("nombre");
        String precioStr = request.getParameter("precio");
        String descripcion = request.getParameter("descripcion");
        String fechaProdStr = request.getParameter("fechaProd");
        String fechaVenStr = request.getParameter("fechaVen");
        String categoriaStr = request.getParameter("categoria");
        String presentacionStr = request.getParameter("presentacion");
        String almacenStr = request.getParameter("almacen");
        String cantidadStr = request.getParameter("cantidad");

        if (nombre == null || precioStr == null || descripcion == null || fechaProdStr == null || fechaVenStr == null ||
            categoriaStr == null || presentacionStr == null || almacenStr == null || cantidadStr == null || idProducto == null) {
            throw new IllegalArgumentException("Todos los campos son obligatorios.");
        }

        // Obtener la nueva imagen si se ha cargado
        String rutaImagen = guardarImagen(request.getPart("imagen"));

        // Convertir los datos de entrada a los tipos correspondientes
        double precio = Double.parseDouble(precioStr);
        int stock = Integer.parseInt(cantidadStr);
        LocalDate fechaProduccion = LocalDate.parse(fechaProdStr);
        LocalDate fechaVencimiento = LocalDate.parse(fechaVenStr);

        // Crear un objeto Producto con los nuevos valores
        Producto producto = new Producto();
        producto.setIdProducto(Integer.parseInt(idProducto));
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setDescripcion(descripcion);
        producto.setFechaP(fechaProduccion);
        producto.setFechaV(fechaVencimiento);
        producto.setImg(rutaImagen);
        producto.setCategoria(categoriaStr);
        producto.setPresentacion(presentacionStr);
        producto.setAlmacen(almacenStr);
        producto.setStock(stock);

        // Llamar al DAO para actualizar el producto
        ProductoDAO productoDAO = new ProductoDAO();
        boolean actualizado = productoDAO.Editar(producto);

        // Redirigir con mensaje de éxito o error
        if (actualizado) {
            request.setAttribute("message", "Producto actualizado correctamente");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("ListarProductos").forward(request, response);
        } else {
            request.setAttribute("message", "No se pudo actualizar el producto. Intente nuevamente.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("ListarProductos").forward(request, response);
        }
    }
    
     private String guardarImagen(Part filePart) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String imgPath = getServletContext().getRealPath("/img");
            File imgDir = new File(imgPath);
            if (!imgDir.exists()) {
                imgDir.mkdirs();
            }

            String fileName = filePart.getSubmittedFileName();
            String filePath = imgPath + File.separator + fileName;
            filePart.write(filePath);

            // Ruta relativa para la base de datos
            return "img/" + fileName;
        }
        return null;
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

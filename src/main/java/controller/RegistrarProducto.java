package controller;

import dao.ProductoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
@WebServlet(name = "RegistrarProducto", urlPatterns = {"/RegistrarProducto"})
@MultipartConfig
public class RegistrarProducto extends HttpServlet {

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
        String nombre = request.getParameter("txtNombre");
        String precioStr = request.getParameter("txtPrecio");
        String descripcion = request.getParameter("txtDescripcion");
        String fechaProduStr = request.getParameter("txtFechaProdu");
        String fechaCaduStr = request.getParameter("txtFechaVen");
        String almacenStr = request.getParameter("txtAlmacen");
        String categoriaStr = request.getParameter("txtCategoria");
        String presentacionStr = request.getParameter("txtPresentacion");
        String stockStr = request.getParameter("txtCantidad");
        if (nombre == null || precioStr == null || descripcion == null ||
            fechaProduStr == null || fechaCaduStr == null ||
            almacenStr == null || categoriaStr == null || presentacionStr == null || stockStr == null) {
            throw new IllegalArgumentException("Todos los campos son obligatorios.");
        }

        String rutaImagen = guardarImagen(request.getPart("txtImagen"));

            // Validaciones y conversiones
        double precio = Double.parseDouble(precioStr);
        int stock = Integer.parseInt(stockStr);
        LocalDate fechaprodu = LocalDate.parse(fechaProduStr);
        LocalDate fechacadu = LocalDate.parse(fechaCaduStr);

            // Creación de producto
        Producto producto = new Producto();
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setDescripcion(descripcion);
        producto.setFechaP(fechaprodu);
        producto.setFechaV(fechacadu);
        producto.setImg(rutaImagen);
        producto.setAlmacen(almacenStr);
        producto.setCategoria(categoriaStr);
        producto.setPresentacion(presentacionStr);
        producto.setStock(stock);

            // Registro en la base de datos
        ProductoDAO productoDAO = new ProductoDAO();
        boolean registrado = productoDAO.Registrar(producto);

        if (registrado) {
            request.setAttribute("message", "Se agrego correctamente el producto");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("ListarProductos").forward(request, response);
        } else {
            request.setAttribute("message", "No se pudo agregar el producto. Inténtelo de nuevo.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("ListarProductos").forward(request, response);
        }
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

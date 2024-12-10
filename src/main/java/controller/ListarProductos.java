package controller;

import dao.AlmacenDAO;
import dao.CategoriaDAO;
import dao.PresentacionDAO;
import dao.ProductoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Almacen;
import model.Categoria;
import model.Presentacion;
import model.Producto;

/**
 *
 * @author Smit
 */
@WebServlet(name = "ListarProductos", urlPatterns = {"/ListarProductos"})
public class ListarProductos extends HttpServlet {

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
        String nombreProducto = request.getParameter("txtNombre");

        //Lista de Categorias
        CategoriaDAO alm = new CategoriaDAO();
        List<Categoria> Lista = alm.Mostrar();
        
        //Lista de Almacenes
        AlmacenDAO alr = new AlmacenDAO();
        List<Almacen> Almacen = alr.Mostrar();
        
        // Lista de Categoría Presentación
        PresentacionDAO dao = new PresentacionDAO();
        List<Presentacion> Presentacion = dao.Mostrar();
        
        //Lista de Productos
        ProductoDAO prd = new ProductoDAO();
        List<Producto> Producto;
        
        if (nombreProducto != null && !nombreProducto.trim().isEmpty()) {
            Producto = prd.MostrarProducto(nombreProducto);
        } else {
            Producto = prd.MostrarProducto(null);
        }
        
        String message = (String) request.getAttribute("message");
        String messageType = (String) request.getAttribute("messageType");
        if (message != null && messageType != null) {
            request.setAttribute("message", message);
            request.setAttribute("messageType", messageType);
        }

        request.setAttribute("aPres", Presentacion);
        request.setAttribute("aLista", Lista);
        request.setAttribute("aLm", Almacen);
        request.setAttribute("aPrd", Producto);
        request.getRequestDispatcher("Administrador-Producto.jsp").forward(request, response);
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

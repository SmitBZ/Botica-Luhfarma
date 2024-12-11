package controller;

import dao.PresentacionDAO;
import dao.ProductoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Presentacion;
import model.Producto;

/**
 *
 * @author Smit
 */
@WebServlet(name = "ListarVentaEmpleado", urlPatterns = {"/ListarVentaEmpleado"})
public class ListarVentaEmpleado extends HttpServlet {

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
        String codigoVenta = "VEN-" + System.currentTimeMillis();
        request.setAttribute("codigoVenta", codigoVenta);

        //Lista de Productos
        ProductoDAO prd = new ProductoDAO();
        List<Producto> Producto = prd.Mostrar();
        
        //Lista de Categoria Presentacion
        PresentacionDAO dao = new PresentacionDAO();
        List<Presentacion> Presentacion = dao.Mostrar();
        
        String message = (String) request.getAttribute("message");
        String messageType = (String) request.getAttribute("messageType");
        if (message != null && messageType != null) {
            request.setAttribute("message", message);
            request.setAttribute("messageType", messageType);
        }

        request.setAttribute("apres", Presentacion);
        request.setAttribute("pro", Producto);
        request.getRequestDispatcher("Empleado-Principal.jsp").forward(request, response);
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

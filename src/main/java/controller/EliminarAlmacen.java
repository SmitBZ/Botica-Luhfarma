package controller;

import dao.AlmacenDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Smit
 */
@WebServlet(name = "EliminarAlmacen", urlPatterns = {"/EliminarAlmacen"})
public class EliminarAlmacen extends HttpServlet {

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
        String idAlmacenParam = request.getParameter("idAlmacen");
        int idAlmacen;
        
        try {
            idAlmacen = Integer.parseInt(idAlmacenParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de almacén no válido");
            return;
        }

        AlmacenDAO almacenDAO = new AlmacenDAO();
        boolean eliminado = almacenDAO.Eliminar(idAlmacen);

        if (eliminado) {
            request.setAttribute("message", "Se elimino correctamente el almacén.");
            request.setAttribute("messageType", "success"); // Indica que es un mensaje de éxito
            request.getRequestDispatcher("ListarAlmacen").forward(request, response);
        } else {
            request.setAttribute("message", "No se pudo eliminar el almacén. Inténtelo de nuevo.");
            request.setAttribute("messageType", "error"); // Indica que es un mensaje de error
            request.getRequestDispatcher("ListarAlmacen").forward(request, response);
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

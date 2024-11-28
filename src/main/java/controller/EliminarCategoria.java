package controller;

import dao.CategoriaDAO;
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
@WebServlet(name = "<button class=\"text-red-500 hover:text-red-700\" onclick=\"openDeleteModal(<%= almacen.getIdAlmacen() %>)\"><i class=\"fas fa-trash-alt mr-1\"></i>Eliminar</button>", urlPatterns = {"/EliminarCategoria"})
public class EliminarCategoria extends HttpServlet {

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
        String idACategoriaParam = request.getParameter("idCategoria");
        int idCategoria;
        
        try {
            idCategoria = Integer.parseInt(idACategoriaParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de almacén no válido");
            return;
        }

        CategoriaDAO categoriaDao = new CategoriaDAO();
        boolean eliminado = categoriaDao.Eliminar(idCategoria);

        if (eliminado) {
            response.sendRedirect(request.getContextPath() + "/ListarCategoria?success=Eliminado");
        } else {
            response.sendRedirect(request.getContextPath() + "/ListarCategoria?error=NoSePudoEliminar");
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

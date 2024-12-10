package controller;

import dao.PresentacionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Presentacion;

/**
 *
 * @author Smit
 */
@WebServlet(name = "EditarPresentacion", urlPatterns = {"/EditarPresentacion"})
public class EditarPresentacion extends HttpServlet {

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
        int idPresentacion = Integer.parseInt(request.getParameter("idPresentacion"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        
        Presentacion prt = new Presentacion();
        prt.setIdPresentacion(idPresentacion);
        prt.setNombre(nombre);
        prt.setDescripcion(descripcion);
        
        PresentacionDAO prDao= new PresentacionDAO();
        boolean exitoso = prDao.Editar(prt);
        
        if (exitoso) {
            request.setAttribute("message", "Se editó correctamente la presentación.");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("ListarPresentaciones").forward(request, response);
        } else {
            request.setAttribute("message", "No se pudo editar la presentación. Inténtelo de nuevo.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("ListarPresentaciones").forward(request, response);
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

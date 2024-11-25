package controller;

import dao.CategoriaDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Categoria;

/**
 *
 * @author Smit
 */
@WebServlet(name = "RegistrarCategoria", urlPatterns = {"/RegistrarCategoria"})
public class RegistrarCategoria extends HttpServlet {

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
        String Nombre = request.getParameter("txtNombre");
        String Descripcion = request.getParameter("txtDescripcion");
        
        if (Nombre.isEmpty() || Descripcion.isEmpty()) {
            request.setAttribute("mensaje", "Todos los campos son requeridos.");
            request.getRequestDispatcher("Administrador-Categorias.jsp").forward(request, response);
            return;
        }

        CategoriaDAO ctd = new CategoriaDAO();
        Categoria ct = new Categoria();
    
        ct.setNombre(Nombre);
        ct.setDescripcion(Descripcion);
    
        boolean yaRegistrado = ctd.Registrar(ct);
    
        if (yaRegistrado) {
        // Redirigir con mensaje de éxito
            request.setAttribute("mensaje", "El almacén fue registrado exitosamente.");
            request.getRequestDispatcher("ListarCategoria").forward(request, response);
        } else {
        // Error al registrar el almacén
            request.setAttribute("mensaje", "Hubo un error al registrar el almacén.");
            request.getRequestDispatcher("ListarCategoria").forward(request, response);
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

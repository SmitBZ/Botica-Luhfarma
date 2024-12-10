package controller;

import dao.AlmacenDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Almacen;

/**
 *
 * @author Smit
 */
@WebServlet(name = "RegistrarAlmacen", urlPatterns = {"/RegistrarAlmacen"})
public class RegistrarAlmacen extends HttpServlet {

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
        String Capacidad = request.getParameter("txtCapacidad");

        if (Nombre.isEmpty() || Descripcion.isEmpty() || Capacidad.isEmpty()) {
            request.setAttribute("mensaje", "Todos los campos son requeridos.");
            request.getRequestDispatcher("Administrador-Almacenes.jsp").forward(request, response);
            return;
        }

        AlmacenDAO amd = new AlmacenDAO();
        Almacen am = new Almacen();
    
        am.setNombre(Nombre);
        am.setDescripcion(Descripcion);
        am.setCapacidad(Capacidad);
    
        boolean yaRegistrado = amd.Registrar(am);
    
        if (yaRegistrado) {
            request.setAttribute("message", "Se agrego correctamente el almacén");
            request.setAttribute("messageType", "success"); // Indica que es un mensaje de éxito
            request.getRequestDispatcher("ListarAlmacen").forward(request, response);
        } else {
            request.setAttribute("message", "No se pudo agregar el almacén. Inténtelo de nuevo.");
            request.setAttribute("messageType", "error");
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

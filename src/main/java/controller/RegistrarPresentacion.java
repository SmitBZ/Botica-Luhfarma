package controller;

import dao.PresentacionDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "RegistrarPresentacion", urlPatterns = {"/RegistrarPresentacion"})
public class RegistrarPresentacion extends HttpServlet {

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
        String descripcion = request.getParameter("txtDescripcion");

        // Validar los datos ingresados
        if (nombre == null || nombre.isEmpty() || descripcion == null || descripcion.isEmpty()) {
            request.setAttribute("mensaje", "Todos los campos son requeridos.");
            request.getRequestDispatcher("Administrador-Presentacion.jsp").forward(request, response);
            return;
        }

        // Crear una instancia del objeto Presentacion y asignar los valores
         PresentacionDAO dao = new PresentacionDAO();
        Presentacion presentacion = new Presentacion();
        presentacion.setNombre(nombre);
        presentacion.setDescripcion(descripcion);

        // Llamar al DAO para registrar la presentación
        boolean registrado = dao.Registrar(presentacion);

        // Redirigir según el resultado
        if (registrado) {
            request.setAttribute("mensaje", "La presentación fue registrada exitosamente.");
            request.getRequestDispatcher("ListarPresentaciones").forward(request, response);
        } else {
            request.setAttribute("mensaje", "Hubo un error al registrar la presentación.");
            request.getRequestDispatcher("Administrador-Presentaciones.jsp").forward(request, response);
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

package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author Smit
 */
@WebServlet(name = "RegistrarUsuario", urlPatterns = {"/RegistrarUsuario"})
public class RegistrarUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String Nombre = request.getParameter("txtNombre");
        String Apellido = request.getParameter("txtApellido");
        String Correo = request.getParameter("txtCo");        
        String Telefono = request.getParameter("txtTelefono");
        String Contraseña = request.getParameter("txtPass");
        String Rol = request.getParameter("txtRol");

        if (Nombre.isEmpty() || Apellido.isEmpty()|| Correo.isEmpty() || Contraseña.isEmpty() || Rol.isEmpty()) {
            request.getRequestDispatcher("Administrador-Usuario.jsp").forward(request, response);
            return;
        }

        UsuarioDAO US = new UsuarioDAO();
        Usuario us = new Usuario();
        us.setNombre(Nombre);
        us.setApellido(Apellido);
        us.setTelefono(Telefono);
        us.setCorreo(Correo);
        us.setContraseña(Contraseña);
        us.setRol(Rol);

        boolean yaRegistrado = US.RegistrarUsuario(us);
        if (!yaRegistrado) {
            request.setAttribute("message", "Se agrego correctamente el usuario.");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("ListarUsuario").forward(request, response);
        } else {
            request.setAttribute("message", "No se pudo agregar el usuario. Inténtelo de nuevo.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("ListarUsuario").forward(request, response);
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

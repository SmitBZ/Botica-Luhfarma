package controller;

import dao.UsuarioDAO;
import java.io.IOException;
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
@WebServlet(name = "RegistrarCliente", urlPatterns = {"/RegistrarCliente"})
public class RegistrarCliente extends HttpServlet {

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
        String Apellido = request.getParameter("txtApellidos");
        String Correo = request.getParameter("txtCorreo");
        String Telefono = request.getParameter("txtTelefono");
        String DNI = request.getParameter("txtDNI");
        String Direccion = request.getParameter("txtDireccion");
        String Contraseña = request.getParameter("txtPassword");
        String Verificacion = request.getParameter("txtVerificacion");
        String Rol = "cliente";
        String Estado = "Activo";
        
        if(Nombre.isEmpty() || Apellido.isEmpty() || Correo.isEmpty() || Telefono.isEmpty() || DNI.isEmpty() || Direccion.isEmpty() || Contraseña.isEmpty() || Verificacion.isEmpty() || Rol.isEmpty() || Estado.isEmpty()){
            request.setAttribute("mensaje", "Todos los campos son obligatorios");
            request.getRequestDispatcher("Usuario-Principal.jsp").forward(request, response);
            return;
        }
        
        if(!Contraseña.equals(Verificacion)){
            request.setAttribute("mensaje", "Las contraseñas no coinciden");
            request.getRequestDispatcher("Usuario-Principal.jsp").forward(request, response);
            return;
        }
        
        UsuarioDAO usd = new UsuarioDAO();
        Usuario us = new Usuario();
        us.setNombre(Nombre);
        us.setApellido(Apellido);
        us.setTelefono(Telefono);
        us.setDni(DNI);
        us.setDireccion(Direccion);
        us.setCorreo(Correo);
        us.setContraseña(Contraseña);
        us.setRol(Rol);
        us.setEstado(Estado);
        
        String nombreUsuario = usd.RegistrarCliente(us);
        
        if(nombreUsuario != null){
            request.setAttribute("nombreUsuario", nombreUsuario);
            request.setAttribute("mensaje", "Registro exitoso" + "!");
            request.getRequestDispatcher("Usuario-Principal.jsp").forward(request, response);
        }else{
            request.setAttribute("mensaje", "El correo ya está registrado");
            request.getRequestDispatcher("Usuario-Principal.jsp").forward(request, response);
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

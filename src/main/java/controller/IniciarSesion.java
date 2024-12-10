package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author Smit
 */
@WebServlet(name = "IniciarSesion", urlPatterns = {"/IniciarSesion"})
public class IniciarSesion extends HttpServlet {

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
        String Correo = request.getParameter("txtCorreo");
        String Contraseña = request.getParameter("txtPassword");
        
        if(Correo.isEmpty() || Contraseña.isEmpty()){
            request.setAttribute("error", "Los campos no pueden estar vacíos");
            request.getRequestDispatcher("principal.jsp").forward(request, response);
            return;
        }
        
        UsuarioDAO usd = new UsuarioDAO();
        Usuario us = new Usuario();
        us.setCorreo(Correo);
        us.setContraseña(Contraseña);
        us = usd.Autenticar(us);
        
        if(us != null){
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(15 * 60);
            session.setAttribute("usuario", us);
            switch (us.getRol()) {
                case "cliente" -> response.sendRedirect("Usuario-Principal.jsp");
                case "administrador" -> response.sendRedirect("CantidadClientes");
                case "empleado" -> response.sendRedirect("ListarVentaEmpleado");
                default -> {
                    request.setAttribute("error", "Correo o contraseña incorrects");
                    request.getRequestDispatcher("Usuario-Principal.jsp").forward(request, response);
                }
            }
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

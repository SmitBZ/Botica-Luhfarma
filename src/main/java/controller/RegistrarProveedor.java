package controller;

import dao.ProveedorDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Proveedor;

/**
 *
 * @author Smit
 */
@WebServlet(name = "RegistrarProveedor", urlPatterns = {"/RegistrarProveedor"})
public class RegistrarProveedor extends HttpServlet {

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
        String Direccion = request.getParameter("txtDireccion");
        String Email = request.getParameter("txtCorreo");
        String Telefono = request.getParameter("txtTelefono");
        String RUC = request.getParameter("txtRuc");
        String Entidad = request.getParameter("txtEntidad");
        
        if(Nombre.isEmpty() || Direccion.isEmpty() || Email.isEmpty() || Telefono.isEmpty() || RUC.isEmpty() || Entidad.isEmpty()){
            request.getRequestDispatcher("proveedor.jsp").forward(request, response);
            return;
        }
        
        ProveedorDAO prd = new ProveedorDAO();
        Proveedor pr = new Proveedor();
        pr.setNombre(Nombre);
        pr.setDireccion(Direccion);
        pr.setCorreo(Email);
        pr.setTelefono(Telefono);
        pr.setRuc(RUC);
        pr.setEntidad(Entidad);
        
        boolean registrado = prd.Registrar(pr);
        
        if(registrado){
            request.setAttribute("mensaje", "El proveedor fue registrado exitosamente");
            request.getRequestDispatcher("ListarProveedor").forward(request, response);
        }else{
            request.setAttribute("mensaje", "El proveedor ya está registradoo o hubo un error.");
            request.getRequestDispatcher("ListarProveedor").forward(request, response);
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

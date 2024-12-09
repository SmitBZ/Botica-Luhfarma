package controller;

import dao.CategoriaDAO;
import dao.InventarioDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Categoria;
import model.Inventario;

/**
 *
 * @author Smit
 */
@WebServlet(name = "ListarInventarioEmpleado", urlPatterns = {"/ListarInventarioEmpleado"})
public class ListarInventarioEmpleado extends HttpServlet {

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
        String categoria = request.getParameter("txtCategoria");
        String estadoStock = request.getParameter("txtEstado");
        String nombreProducto = request.getParameter("txtNombre");

        if (categoria == null || categoria.isEmpty() || categoria.equals("todo")) {
            categoria = "Todo";
        }
        if (estadoStock != null && estadoStock.isEmpty()) {
            estadoStock = null;
        }
        if (nombreProducto != null && nombreProducto.isEmpty()) {
            nombreProducto = null;
        }

        InventarioDAO dao = new InventarioDAO();
        List<Inventario> inV = dao.MostrarBusqueda(categoria, estadoStock, nombreProducto);

        CategoriaDAO categoriaDAO = new CategoriaDAO();
        List<Categoria> aLista = categoriaDAO.Mostrar();

        request.setAttribute("aInv", inV);
        request.setAttribute("aLista", aLista); // Pasar la lista de categorías a la vista JSP

        request.getRequestDispatcher("Empleado-Inventario.jsp").forward(request, response);
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

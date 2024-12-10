package controller;

import dao.VentaDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Venta;

/**
 *
 * @author Smit
 */
@WebServlet(name = "RegistrarVenta", urlPatterns = {"/RegistrarVenta"})
public class RegistrarVenta extends HttpServlet {

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
        int cliente = 0; // cliente o venta local
        int modalidad = 1; //al ser local, la venta es presencial
        String codigoVenta = request.getParameter("txtCodigo");
        String idProductoStr = request.getParameter("txtProducto");
        String idPresentacionStr = request.getParameter("txtPresentacion");
        String cantidadStr = request.getParameter("txtCantidad");
        String precioUnitarioStr = request.getParameter("precioUnitario");

        if (codigoVenta == null || idProductoStr == null || idPresentacionStr == null || 
            cantidadStr == null || precioUnitarioStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros faltantes o inválidos.");
            return;
        }

        try {
            int idProducto = Integer.parseInt(idProductoStr);
            int idPresentacion = Integer.parseInt(idPresentacionStr);
            int cantidad = Integer.parseInt(cantidadStr);
            double precioUnitario = Double.parseDouble(precioUnitarioStr);

            Venta venta = new Venta();
            venta.setIdCliente(cliente);
            venta.setIdModalidad(modalidad);
            venta.setCodigoVenta(codigoVenta);
            venta.setProductoID(idProducto);
            venta.setPresentacionID(idPresentacion);
            venta.setCantidad(cantidad);
            venta.setPrecioUnitario(precioUnitario);

            VentaDAO ventaDAO = new VentaDAO();
            if (ventaDAO.registrarVenta(venta)) {
                response.sendRedirect("ListarVenta");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo registrar la venta.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de parámetros inválido.");
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

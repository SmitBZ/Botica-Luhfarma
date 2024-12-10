package controller;

import dao.ReporteDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Reporte;

/**
 *
 * @author Smit
 */
@WebServlet(name = "ListarReporteEmpleado", urlPatterns = {"/ListarReporteEmpleado"})
public class ListarReporteEmpleado extends HttpServlet {

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
        String fechaInicio = request.getParameter("txtFechaInicio");
        String fechaFin = request.getParameter("txtFechaFin");
        String modalidadVenta = request.getParameter("txtModalidad");

        if (fechaInicio != null && fechaInicio.trim().isEmpty()) {
            fechaInicio = null;
        }
        if (fechaFin != null && fechaFin.trim().isEmpty()) {
            fechaFin = null;
        }
        if (modalidadVenta != null && modalidadVenta.trim().isEmpty()) {
            modalidadVenta = null;
        }

        ReporteDAO rptDAO = new ReporteDAO();
        List<Reporte> lista = rptDAO.MostrarReportes(fechaInicio, fechaFin, modalidadVenta);

        request.setAttribute("aLista", lista);
        request.getRequestDispatcher("Empleado-Reporte.jsp").forward(request, response);
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

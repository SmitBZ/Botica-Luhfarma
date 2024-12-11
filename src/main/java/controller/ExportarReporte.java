package controller;

import dao.ReporteDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;
import model.Producto;
import model.Reporte;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Smit
 */
@WebServlet(name = "ExportarReporte", urlPatterns = {"/ExportarReporte"})
public class ExportarReporte extends HttpServlet {

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
        ReporteDAO prd = new ReporteDAO();
        List<Reporte> reporte = prd.MostrarReportes(null, null, null);
        
        if (reporte == null || reporte.isEmpty()) {
            response.getWriter().write("No hay reporte para exportar.");
            return;
        }
        
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Reportes");
        
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("FECHA");
        headerRow.createCell(1).setCellValue("MODALIDAD");
        headerRow.createCell(2).setCellValue("ESTADO");
        headerRow.createCell(3).setCellValue("MEDICAMENTO");
        headerRow.createCell(4).setCellValue("CATEGORIA");
        headerRow.createCell(5).setCellValue("TIPO DE PRESENTACION");
        headerRow.createCell(6).setCellValue("UNIDADES VENDIDAS");
        headerRow.createCell(7).setCellValue("PRECIO UNITARIO");
        headerRow.createCell(8).setCellValue("TOTAL");
        
        int rowNum = 1;
        
        for (Reporte rp : reporte) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(rp.getFecha());
            row.createCell(1).setCellValue(rp.getCliente());
            row.createCell(2).setCellValue(rp.getEstado());
            row.createCell(3).setCellValue(rp.getMedicamento());
            row.createCell(4).setCellValue(rp.getCategoria());
            row.createCell(5).setCellValue(rp.getPresentacion());
            row.createCell(6).setCellValue(rp.getUnidadesVendidas());
            row.createCell(7).setCellValue(rp.getPrecioUnitario());
            row.createCell(8).setCellValue(rp.getTotalVenta());
        }
        
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=\"reporte.xlsx\"");

        // Escribir el archivo Excel en el flujo de salida
        try (OutputStream os = response.getOutputStream()) {
            workbook.write(os);
            workbook.close();
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

package controller;

import dao.ProveedorDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;
import model.Proveedor;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Smit
 */
@WebServlet(name = "ExportarProveedores", urlPatterns = {"/ExportarProveedores"})
public class ExportarProveedores extends HttpServlet {

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
        ProveedorDAO prd = new ProveedorDAO();
        List<Proveedor> provedor = prd.MostrarProveedor(null);
        
        if (provedor == null || provedor.isEmpty()) {
            response.getWriter().write("No hay provedor para exportar.");
            return;
        }
        
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Proveedores");
        
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Nombre");
        headerRow.createCell(2).setCellValue("RUC");
        headerRow.createCell(3).setCellValue("CORREO");
        headerRow.createCell(4).setCellValue("TELEFONO");
        headerRow.createCell(5).setCellValue("DIRECCIÓN");
        headerRow.createCell(6).setCellValue("ENTIDAD");
        
        int rowNum = 1;
        
        for (Proveedor pr : provedor) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(pr.getIdProveedor());
            row.createCell(1).setCellValue(pr.getNombre());
            row.createCell(2).setCellValue(pr.getRuc());
            row.createCell(3).setCellValue(pr.getCorreo());
            row.createCell(4).setCellValue(pr.getTelefono());
            row.createCell(5).setCellValue(pr.getDireccion());
            row.createCell(6).setCellValue(pr.getEntidad());
        }
        
        // Enviar el archivo al cliente
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=\"proveedor.xlsx\"");
        
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

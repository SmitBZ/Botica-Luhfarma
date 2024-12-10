package controller;

import dao.ProveedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Producto;
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
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("Proveedores");
        
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Nombre");
        headerRow.createCell(2).setCellValue("Precio");
        headerRow.createCell(3).setCellValue("Descripción");
        headerRow.createCell(4).setCellValue("Fecha de Producción");
        headerRow.createCell(5).setCellValue("Fecha de Caducidad");
        headerRow.createCell(6).setCellValue("Categoría");
        headerRow.createCell(7).setCellValue("Almacén");
        headerRow.createCell(8).setCellValue("Presentación");
        
        // Llenar los datos
        for (int i = 0; i < provedor.size(); i++) {
            Row row = sheet.createRow(i + 1);
            Proveedor proveedor = provedor.get(i);
            row.createCell(0).setCellValue(proveedor.getIdProveedor());
            row.createCell(1).setCellValue(proveedor.getNombre());
            row.createCell(2).setCellValue(proveedor.getRuc());
            row.createCell(3).setCellValue(proveedor.getCorreo());
            row.createCell(4).setCellValue(proveedor.getTelefono());
            row.createCell(5).setCellValue(proveedor.getDireccion());
            row.createCell(6).setCellValue(proveedor.getEntidad());
        }
        
        // Enviar el archivo al cliente
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment;filename=proveedores.xlsx");
        wb.write(response.getOutputStream());
        wb.close();
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

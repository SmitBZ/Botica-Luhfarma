package controller;

import dao.ProductoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;
import model.Producto;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Smit
 */
@WebServlet(name = "ExportarProductos", urlPatterns = {"/ExportarProductos"})
public class ExportarProductos extends HttpServlet {

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
        ProductoDAO prd = new ProductoDAO();
        List<Producto> productos = prd.MostrarProducto(null);
        
        if (productos == null || productos.isEmpty()) {
            response.getWriter().write("No hay productos para exportar.");
            return;
        }

        // Crear un libro de Excel
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Productos");

        // Crear fila de encabezados
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

        // Agregar los productos al archivo Excel
        int rowNum = 1;
        for (Producto pr : productos) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(pr.getIdProducto());
            row.createCell(1).setCellValue(pr.getNombre());
            row.createCell(2).setCellValue(pr.getPrecio());
            row.createCell(3).setCellValue(pr.getDescripcion());
            row.createCell(4).setCellValue(pr.getFechaP());
            row.createCell(5).setCellValue(pr.getFechaV());
            row.createCell(6).setCellValue(pr.getCategoria());
            row.createCell(7).setCellValue(pr.getAlmacen());
            row.createCell(8).setCellValue(pr.getPresentacion());
        }

        // Configurar la respuesta para la descarga del archivo Excel
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=\"productos.xlsx\"");

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

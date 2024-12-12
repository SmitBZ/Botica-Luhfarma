package controller;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import dao.VentaDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.OutputStream;
import model.Venta;

/**
 *
 * @author Smit
 */
@WebServlet(name = "ConfirmarPago", urlPatterns = {"/ConfirmarPago"})
@MultipartConfig
public class ConfirmarPago extends HttpServlet {

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
        
        String codigoVenta = request.getParameter("txtCodigo");
        String idProductoStr = request.getParameter("txtProducto");
        String idPresentacionStr = request.getParameter("txtPresentacion");
        String cantidadStr = request.getParameter("txtCantidad");
        String precioUnitarioStr = request.getParameter("precioUnitario");

        // Validar los parámetros
        if (codigoVenta == null || idProductoStr == null || idPresentacionStr == null || 
            cantidadStr == null || precioUnitarioStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros faltantes o inválidos.");
            return;
        }

        try {
            int idProducto = Integer.parseInt(idProductoStr);
            int idPresentacion = Integer.parseInt(idPresentacionStr);
            int cantidad;
            cantidad = Integer.parseInt(cantidadStr);
            double precioUnitario = Double.parseDouble(precioUnitarioStr);
            double total = cantidad * precioUnitario;
            String comprobantePart = guardarImagen(request.getPart("comprobante"));
            Venta ven = new Venta();
            // Registrar la venta en la base de datos
            VentaDAO ventaDAO = new VentaDAO();
            ven.setCodigoVenta(codigoVenta);
            ven.setIdCliente(2);
            ven.setIdModalidad(2);
            ven.setProductoID(idProducto);
            ven.setPresentacionID(idPresentacion);
            ven.setCantidad(cantidad);
            ven.setPrecioUnitario(precioUnitario);
            ven.setComprobante(comprobantePart);
            
            
            boolean registroExitoso = ventaDAO.VentaUsuario(ven);
            if (registroExitoso) {
                // Generar el PDF de reporte
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=ticket_" + codigoVenta + ".pdf");

                try (OutputStream out = response.getOutputStream()) {
                    PdfWriter writer = new PdfWriter(out);
                    PdfDocument pdf = new PdfDocument(writer);
                    try (Document document = new Document(pdf)) {
                        PdfFont boldFont = PdfFontFactory.createFont(com.itextpdf.io.font.constants.StandardFonts.HELVETICA_BOLD);
                        document.add(new Paragraph("Botica Luhfarma").setFont(boldFont).setFontSize(14).setTextAlignment(com.itextpdf.layout.properties.TextAlignment.CENTER));
                        document.add(new Paragraph("Código de Venta: " + codigoVenta));
                        document.add(new Paragraph("Cantidad: " + cantidad));
                        document.add(new Paragraph("Producto ID: " + idProducto));
                        document.add(new Paragraph("Total: S/ " + total));
                        document.add(new Paragraph("¡Gracias por su compra!"));
                    }
                }
            } else {
                request.setAttribute("message", "No se pudo registrar la venta.");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de parámetros inválido.");
        }
    }

    
    private String guardarImagen(Part filePart) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String imgPath = getServletContext().getRealPath("/pagos");
            File imgDir = new File(imgPath);
            if (!imgDir.exists()) {
                imgDir.mkdirs();
            }

            String fileName = filePart.getSubmittedFileName();
            String filePath = imgPath + File.separator + fileName;
            filePart.write(filePath);

            // Ruta relativa para la base de datos
            return "img/" + fileName;
        }
        return null;
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

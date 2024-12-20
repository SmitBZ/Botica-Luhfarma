package controller;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import dao.VentaDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import model.Venta;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.TextAlignment;


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
     rotected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cliente = 0; // cliente o venta local
        int modalidad = 1; //al ser local, la venta es presencial
        String codigoVenta = request.getParameter("txtCodigo");
        String idProductoStr = request.getParameter("txtProducto");
        String idPresent*/
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
        double total = cantidad * precioUnitario;

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
            // Código para generar el PDF aquí.
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=ticket_" + codigoVenta + ".pdf");

            try (OutputStream out = response.getOutputStream()) {
                PdfWriter writer = new PdfWriter(out);
                PdfDocument pdf = new PdfDocument(writer);
                try (Document document = new Document(pdf)) {
                    // Generar el contenido del PDF
                    PdfFont boldFont = PdfFontFactory.createFont(StandardFonts.TIMES_BOLD);

                    Image img = new Image(ImageDataFactory.create("C:\\Users\\Smit1\\OneDrive\\Documentos\\Proyectos\\BOTICA  LUHFARMA\\CODIGO\\BOTICA-LUHFARMA\\src\\main\\webapp\\img\\logo.png"));
                    img.setWidth(120);  // Ajusta el tamaño al requerimiento
                    img.setHorizontalAlignment(HorizontalAlignment.CENTER); // Centrar la imagen
                    document.add(img);
                    document.add(new Paragraph("Botica Luhfarma").setFont(boldFont).setFontSize(14).setTextAlignment(TextAlignment.CENTER));
                    document.add(new Paragraph("RUC: 10464257140").setTextAlignment(TextAlignment.CENTER));
                    document.add(new Paragraph("Av. Emancipación N° 752 - Lima, Perú").setTextAlignment(TextAlignment.CENTER));
                    document.add(new Paragraph("---------------------------------------------------------------------").setTextAlignment(TextAlignment.CENTER));

                    document.add(new Paragraph("Código de Venta: " + codigoVenta).setTextAlignment(TextAlignment.CENTER));
                    document.add(new Paragraph("Fecha: " + java.time.LocalDate.now()).setTextAlignment(TextAlignment.CENTER));
                    document.add(new Paragraph("---------------------------------------------------------------------").setTextAlignment(TextAlignment.CENTER));
                    document.add(new Paragraph("Cant.   Producto      P.U.     Total").setTextAlignment(TextAlignment.CENTER));

                    document.add(new Paragraph(String.format("%-7d %-12s %-7.2f %.2f",cantidad, "Producto", precioUnitario, total)).setTextAlignment(TextAlignment.CENTER));

                    document.add(new Paragraph("-----------------------------------------------------------------------").setTextAlignment(TextAlignment.CENTER));
                    document.add(new Paragraph(String.format("Total a pagar: S/ %.2f", total)).setFont(boldFont).setTextAlignment(TextAlignment.CENTER));

                    document.add(new Paragraph("Gracias por su compra").setTextAlignment(TextAlignment.CENTER));
                    document.add(new Paragraph("¡Vuelva pronto!").setTextAlignment(TextAlignment.CENTER));
                    
                }
                response.flushBuffer(); // Asegurar que el PDF se envíe correctamente
            } catch (Exception e) {
                System.out.print(e);
            }
        } else {
            request.setAttribute("message", "No se pudo registrar la venta. Inténtelo de nuevo.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("ListarVenta").forward(request, response);
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

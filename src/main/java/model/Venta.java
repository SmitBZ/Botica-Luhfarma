package model;

/**
 *
 * @author Smit
 */
public class Venta {
     private int idCliente;
    private int idModalidad;
    private String codigoVenta;
    private int productoID;
    private int presentacionID;
    private int cantidad;
    private double precioUnitario;
    private String comprobante;

    // Constructor vacío
    public Venta() {
    }

    // Constructor con parámetros
    public Venta(int idCliente, int idModalidad, String codigoVenta, int productoID, int presentacionID, int cantidad, double precioUnitario, String comprobante) {
        this.idCliente = idCliente;
        this.idModalidad = idModalidad;
        this.codigoVenta = codigoVenta;
        this.productoID = productoID;
        this.presentacionID = presentacionID;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.comprobante = comprobante;
    }

    // Getters y Setters
    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdModalidad() {
        return idModalidad;
    }

    public void setIdModalidad(int idModalidad) {
        this.idModalidad = idModalidad;
    }

    public String getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(String codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public int getProductoID() {
        return productoID;
    }

    public void setProductoID(int productoID) {
        this.productoID = productoID;
    }

    public int getPresentacionID() {
        return presentacionID;
    }

    public void setPresentacionID(int presentacionID) {
        this.presentacionID = presentacionID;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public String getComprobante() {
        return comprobante;
    }

    public void setComprobante(String comprobante) {
        this.comprobante = comprobante;
    }
}

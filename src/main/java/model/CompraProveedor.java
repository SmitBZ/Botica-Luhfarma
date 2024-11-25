package model;

/**
 *
 * @author Smit
 */
public class CompraProveedor {
    private int idProvedorDetalle;
    private String Descripcion;
    private int Catntidad;
    private double Precio;
    private int idVenta;
    private int idProducto;
    private String TipoPago;

    public CompraProveedor() {
    }

    public CompraProveedor(int idProvedorDetalle, String Descripcion, int Catntidad, double Precio, int idVenta, int idProducto, String TipoPago) {
        this.idProvedorDetalle = idProvedorDetalle;
        this.Descripcion = Descripcion;
        this.Catntidad = Catntidad;
        this.Precio = Precio;
        this.idVenta = idVenta;
        this.idProducto = idProducto;
        this.TipoPago = TipoPago;
    }

    public int getIdProvedorDetalle() {
        return idProvedorDetalle;
    }

    public void setIdProvedorDetalle(int idProvedorDetalle) {
        this.idProvedorDetalle = idProvedorDetalle;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getCatntidad() {
        return Catntidad;
    }

    public void setCatntidad(int Catntidad) {
        this.Catntidad = Catntidad;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getTipoPago() {
        return TipoPago;
    }

    public void setTipoPago(String TipoPago) {
        this.TipoPago = TipoPago;
    }
}

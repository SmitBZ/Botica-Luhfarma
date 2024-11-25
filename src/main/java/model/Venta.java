package model;

import java.sql.Date;

/**
 *
 * @author Smit
 */
public class Venta {
    private int idVenta;
    private String Nombre;
    private double Precio;
    private Date Fecha;
    private String Comprobante;
    private String Proveedor;

    public Venta() {
    }

    public Venta(int idVenta, String Nombre, double Precio, Date Fecha, String Comprobante, String Proveedor) {
        this.idVenta = idVenta;
        this.Nombre = Nombre;
        this.Precio = Precio;
        this.Fecha = Fecha;
        this.Comprobante = Comprobante;
        this.Proveedor = Proveedor;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    public String getComprobante() {
        return Comprobante;
    }

    public void setComprobante(String Comprobante) {
        this.Comprobante = Comprobante;
    }

    public String getProveedor() {
        return Proveedor;
    }

    public void setProveedor(String Proveedor) {
        this.Proveedor = Proveedor;
    }
}

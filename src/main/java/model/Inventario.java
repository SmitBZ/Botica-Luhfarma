package model;

import java.sql.Date;

/**
 *
 * @author Smit
 */
public class Inventario {
    private String producto;
    private double precio;
    private String descripcion;
    private Date fechaVencimiento;
    private String presentacion;
    private int cantidadExistente;
    private int cantidadEnStock;
    private String estadoStock;
    private String categoria;

    public Inventario() {
    }

    public Inventario(String producto, double precio, String descripcion, Date fechaVencimiento, String presentacion, int cantidadExistente, int cantidadEnStock, String estadoStock, String categoria) {
        this.producto = producto;
        this.precio = precio;
        this.descripcion = descripcion;
        this.fechaVencimiento = fechaVencimiento;
        this.presentacion = presentacion;
        this.cantidadExistente = cantidadExistente;
        this.cantidadEnStock = cantidadEnStock;
        this.estadoStock = estadoStock;
        this.categoria = categoria;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public String getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }

    public int getCantidadExistente() {
        return cantidadExistente;
    }

    public void setCantidadExistente(int cantidadExistente) {
        this.cantidadExistente = cantidadExistente;
    }

    public int getCantidadEnStock() {
        return cantidadEnStock;
    }

    public void setCantidadEnStock(int cantidadEnStock) {
        this.cantidadEnStock = cantidadEnStock;
    }

    public String getEstadoStock() {
        return estadoStock;
    }

    public void setEstadoStock(String estadoStock) {
        this.estadoStock = estadoStock;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}

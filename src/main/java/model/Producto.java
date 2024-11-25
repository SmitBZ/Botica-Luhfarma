package model;

import java.time.LocalDate;

/**
 *
 * @author Smit
 */
public class Producto {
    private int idProducto;
    private String Nombre;
    private double Precio;
    private String Descripcion;
    private LocalDate FechaP;
    private LocalDate FechaV;
    private String Img;
    private String Almacen;
    private String Categoria;
    private String Presentacion;
    
    //Variables para el parametro
    private int Stock;

    public Producto() {
    }

    public Producto(int idProducto, String Nombre, double Precio, String Descripcion, LocalDate FechaP, LocalDate FechaV, String Img, String Almacen, String Categoria, String Presentacion, int Stock) {
        this.idProducto = idProducto;
        this.Nombre = Nombre;
        this.Precio = Precio;
        this.Descripcion = Descripcion;
        this.FechaP = FechaP;
        this.FechaV = FechaV;
        this.Img = Img;
        this.Almacen = Almacen;
        this.Categoria = Categoria;
        this.Presentacion = Presentacion;
        this.Stock = Stock;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
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

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public LocalDate getFechaP() {
        return FechaP;
    }

    public void setFechaP(LocalDate FechaP) {
        this.FechaP = FechaP;
    }

    public LocalDate getFechaV() {
        return FechaV;
    }

    public void setFechaV(LocalDate FechaV) {
        this.FechaV = FechaV;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }

    public String getAlmacen() {
        return Almacen;
    }

    public void setAlmacen(String Almacen) {
        this.Almacen = Almacen;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

    public String getPresentacion() {
        return Presentacion;
    }

    public void setPresentacion(String Presentacion) {
        this.Presentacion = Presentacion;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }    
}

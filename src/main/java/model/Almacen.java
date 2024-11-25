package model;

/**
 *
 * @author Smit
 */
public class Almacen {
    private int idAlmacen;
    private String nombre;
    private String descripcion;
    private String capacidad;

    public Almacen() {}

    public Almacen(int idAlmacen, String nombre, String descripcion, String capacidad) {
        this.idAlmacen = idAlmacen;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.capacidad = capacidad;
    }

    public int getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(int idAlmacen) {
        this.idAlmacen = idAlmacen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(String capacidad) {
        this.capacidad = capacidad;
    }
}

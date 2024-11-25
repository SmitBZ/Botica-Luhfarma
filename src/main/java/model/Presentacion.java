package model;

/**
 *
 * @author SmitBZ
 */
public class Presentacion {
    private int idPresentacion;
    private String Nombre;
    private String Descripcion;

    public Presentacion() {
    }

    public Presentacion(int idPresentacion, String Nombre, String Descripcion) {
        this.idPresentacion = idPresentacion;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
    }

    public int getIdPresentacion() {
        return idPresentacion;
    }

    public void setIdPresentacion(int idPresentacion) {
        this.idPresentacion = idPresentacion;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
}


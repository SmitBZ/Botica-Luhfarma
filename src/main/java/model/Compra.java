package model;

import java.sql.Date;

/**
 *
 * @author Smit
 */
public class Compra {
    private int idCompra;
    private String Nombre;
    private String Comprobante;
    private Date Fecha;
    private String Estado;
    private int Cliente;
    private int Modalidad;

    public Compra() {
    }

    public Compra(int idCompra, String Nombre, String Comprobante, Date Fecha, String Estado, int Cliente, int Modalidad) {
        this.idCompra = idCompra;
        this.Nombre = Nombre;
        this.Comprobante = Comprobante;
        this.Fecha = Fecha;
        this.Estado = Estado;
        this.Cliente = Cliente;
        this.Modalidad = Modalidad;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getComprobante() {
        return Comprobante;
    }

    public void setComprobante(String Comprobante) {
        this.Comprobante = Comprobante;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public int getCliente() {
        return Cliente;
    }

    public void setCliente(int Cliente) {
        this.Cliente = Cliente;
    }

    public int getModalidad() {
        return Modalidad;
    }

    public void setModalidad(int Modalidad) {
        this.Modalidad = Modalidad;
    }
}

package model;

import java.sql.Date;
import java.time.LocalDate;
/**
 *
 * @author Smit
 */
public class Reporte {
    private int idVenta;
    private LocalDate fecha;
    private String cliente;
    private String estado;
    private int unidadesVendidas;
    private String medicamento;
    private String categoria;
    private String presentacion;
    private double precioUnitario;
    private double totalVenta;

    public Reporte() {
    }

    public Reporte(int idVenta, LocalDate fecha, String cliente, String estado, int unidadesVendidas, String medicamento, String categoria, String presentacion, double precioUnitario, double totalVenta) {
        this.idVenta = idVenta;
        this.fecha = fecha;
        this.cliente = cliente;
        this.estado = estado;
        this.unidadesVendidas = unidadesVendidas;
        this.medicamento = medicamento;
        this.categoria = categoria;
        this.presentacion = presentacion;
        this.precioUnitario = precioUnitario;
        this.totalVenta = totalVenta;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getUnidadesVendidas() {
        return unidadesVendidas;
    }

    public void setUnidadesVendidas(int unidadesVendidas) {
        this.unidadesVendidas = unidadesVendidas;
    }

    public String getMedicamento() {
        return medicamento;
    }

    public void setMedicamento(String medicamento) {
        this.medicamento = medicamento;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public double getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(double totalVenta) {
        this.totalVenta = totalVenta;
    }
}

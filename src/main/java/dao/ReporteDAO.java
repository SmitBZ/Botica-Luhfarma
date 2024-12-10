package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Reporte;
import util.Conexion;

/**
 *
 * @author Smit
 */
public class ReporteDAO {
    private String Consulta;
    
    public List<Reporte> MostrarReportes(String fechaInicio, String fechaFin, String modalidadVenta) {
        List<Reporte> reportes = new ArrayList<>();
    
        Consulta = "CALL sp_Filtrar_Reporte(?, ?, ?)";

        try{
            Connection cn = Conexion.getConnection();
            PreparedStatement  cst = cn.prepareStatement(Consulta);
        
            cst.setString(1, fechaInicio);
            cst.setString(2, fechaFin);
            cst.setString(3, modalidadVenta);

            ResultSet rs = cst.executeQuery();
            while (rs.next()) {
                Reporte rpt = new Reporte();
                rpt.setIdVenta(rs.getInt("ID_Venta"));
                rpt.setFecha(rs.getDate("Fecha").toLocalDate());
                rpt.setCliente(rs.getString("Modalidad"));
                rpt.setEstado(rs.getString("Estado"));
                rpt.setUnidadesVendidas(rs.getInt("Unidades_Vendidas"));
                rpt.setMedicamento(rs.getString("Medicamento"));
                rpt.setCategoria(rs.getString("Categoria"));
                rpt.setPresentacion(rs.getString("Presentacion"));
                rpt.setPrecioUnitario(rs.getDouble("Precio_Unitario"));
                rpt.setTotalVenta(rs.getDouble("Total_Venta"));
                
                reportes.add(rpt);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return reportes;
    }

}

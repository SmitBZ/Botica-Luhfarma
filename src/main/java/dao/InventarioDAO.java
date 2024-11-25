package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Inventario;
import util.Conexion;

/**
 *
 * @author Smit
 */
public class InventarioDAO {
    private String consulta;
    
    public List<Inventario> Mostrar() {
        consulta = "call sp_Listar_Inventario();";
        List<Inventario> lista = new ArrayList<>();
        
        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);
            ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                Inventario inventario = new Inventario();
                    inventario.setProducto(rs.getString("Producto"));
                    inventario.setPrecio(rs.getDouble("Precio"));
                    inventario.setDescripcion(rs.getString("Descripcion"));
                    inventario.setFechaVencimiento(rs.getDate("FechaVencimiento"));
                    inventario.setPresentacion(rs.getString("Presentacion"));
                    inventario.setCantidadExistente(rs.getInt("CantidadExistente"));
                    inventario.setCantidadEnStock(rs.getInt("CantidadEnStock"));
                    inventario.setEstadoStock(rs.getString("EstadoStock"));
                    inventario.setCategoria(rs.getString("Categoria"));

                lista.add(inventario);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        }
        return lista;
    }
}

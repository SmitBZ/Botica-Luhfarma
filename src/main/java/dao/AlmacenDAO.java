package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Almacen;
import util.Conexion;

/**
 *
 * @author Smit
 */
public class AlmacenDAO {
    private String Consulta;
    
    public boolean Registrar(Almacen ct){
        Consulta = "call sp_Agregar_Almacen(?,?,?);";
        boolean exitoso = false;
        
        try{
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(Consulta);
            
            cst.setString(1, ct.getNombre());
            cst.setString(2, ct.getDescripcion());
            cst.setString(3, ct.getCapacidad());
            
            cst.execute();
            exitoso = true;
        }catch(SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
    
    public boolean Editar(Almacen ct) {
        Consulta = "call sp_Editar_Almacen(?,?,?);";
        boolean exitoso = false;

        try (Connection cn = Conexion.getConnection();
             CallableStatement cst = cn.prepareCall(Consulta)) {
            
            cst.setInt(1, ct.getIdAlmacen());
            cst.setString(2, ct.getNombre());
            cst.setString(3, ct.getDescripcion());
            cst.setString(4, ct.getCapacidad());
            
            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
    
    public boolean Eliminar(int idAlmacen) {
        Consulta = "call sp_Eliminar_Almacen(?);";
        boolean exitoso = false;

        try (Connection cn = Conexion.getConnection();
             CallableStatement cst = cn.prepareCall(Consulta)) {
            
            cst.setInt(1, idAlmacen);
            
            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
    
    public List<Almacen> Mostrar() {
        Consulta = "call sp_Listar_Almacen();";
        List<Almacen> lista = new ArrayList<>();

        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(Consulta);
            ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                Almacen almacen = new Almacen();
                almacen.setIdAlmacen(rs.getInt("idAlmacen"));
                almacen.setNombre(rs.getString("nombre"));
                almacen.setDescripcion(rs.getString("descripcion"));
                almacen.setCapacidad(rs.getString("capacidad"));
                lista.add(almacen);
            }
        } catch (SQLException e) {
            System.out.print(e);
        }
        return lista;
    }
}

package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Categoria;
import util.Conexion;

/**
 *
 * @author Smit
 */
public class CategoriaDAO {
    private String Consulta;
    
    public boolean Registrar(Categoria ct){
        Consulta = "call sp_Agregar_Categoria(?,?);";
        boolean exitoso = false;
        
        try{
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(Consulta);
            
            cst.setString(1, ct.getNombre());
            cst.setString(2, ct.getDescripcion());
            
            cst.execute();
            exitoso = true;
        }catch(SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
    
    public boolean Editar(Categoria ct) {
        Consulta = "call sp_Editar_Categoria(?,?,?);";
        boolean exitoso = false;

        try (Connection cn = Conexion.getConnection();
             CallableStatement cst = cn.prepareCall(Consulta)) {
            
            cst.setInt(1, ct.getIdCategoria());
            cst.setString(2, ct.getNombre());
            cst.setString(3, ct.getDescripcion());
            
            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
    
    public boolean Eliminar(int idCategoria) {
        Consulta = "call sp_Eliminar_Categoria(?);";
        boolean exitoso = false;

        try (Connection cn = Conexion.getConnection();
             CallableStatement cst = cn.prepareCall(Consulta)) {
            
            cst.setInt(1, idCategoria);
            
            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
    
    public List<Categoria> Mostrar() {
        Consulta = "call sp_Listar_Categoria();";
        List<Categoria> lista = new ArrayList<>();

        try {
            Connection cn = Conexion.getConnection();
             CallableStatement cst = cn.prepareCall(Consulta);
             ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                categoria.setNombre(rs.getString("nombre"));
                categoria.setDescripcion(rs.getString("descripcion"));
                lista.add(categoria);
            }
        } catch (SQLException e) {
            System.out.print(e);
        }
        return lista;
    }
}

package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Proveedor;
import util.Conexion;

/**
 *
 * @author Smit
 */
public class ProveedorDAO {
    private String Consulta;
    
    /**
     * Metodo que permite registrar proveedor en la vista Administrador
     * @param pr
     * @return 
     */
    public boolean Registrar(Proveedor pr){
        Consulta = "call sp_Agregar_Proveedor(?,?,?,?,?,?,?)";
        boolean existe = false;
        
        try{
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(Consulta);
            
            cst.setString(1, pr.getNombre());
            cst.setString(2, pr.getRuc());
            cst.setString(3, pr.getEntidad());
            cst.setString(4, pr.getTelefono());
            cst.setString(5, pr.getCorreo());
            cst.setString(6, pr.getDireccion());
            cst.registerOutParameter(7, java.sql.Types.BOOLEAN);
            
            cst.execute();
            
            existe = cst.getBoolean(7);
        }catch(SQLException e) {
            System.out.print(e);
        }
        return existe;
    }
    
    public boolean Editar(Proveedor pr) {
        Consulta = "call sp_Editar_Proveedor(?,?,?,?,?,?,?);";
        boolean exitoso = false;

        try (Connection cn = Conexion.getConnection();
             CallableStatement cst = cn.prepareCall(Consulta)) {

            cst.setInt(1, pr.getIdProveedor());
            cst.setString(2, pr.getNombre());
            cst.setString(3, pr.getRuc());
            cst.setString(4, pr.getEntidad());
            cst.setString(5, pr.getTelefono());
            cst.setString(6, pr.getCorreo());
            cst.setString(7, pr.getDireccion());

            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
    
    /**
     * Método que permite eliminar un proveedor utilizando su id
     * @param idProveedor
     * @return true si el proveedor fue eliminado correctamente, false en caso contrario
     */
    public boolean Eliminar(int idProveedor) {
        Consulta = "call sp_Eliminar_Proveedor(?);";
        boolean exitoso = false;

        try (Connection cn = Conexion.getConnection();
             CallableStatement cst = cn.prepareCall(Consulta)) {

            cst.setInt(1, idProveedor);

            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
    
    public List<Proveedor> Mostrar() {
        List<Proveedor> lista = new ArrayList<>();
        Consulta = "call sp_Listar_Proveedor();";

        try {
            Connection cn = Conexion.getConnection();
            Statement cst = cn.createStatement();
            ResultSet rs = cst.executeQuery(Consulta);

            while (rs.next()) {
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(rs.getInt("idProveedor"));
                proveedor.setNombre(rs.getString("nombre"));
                proveedor.setRuc(rs.getString("RUC"));
                proveedor.setEntidad(rs.getString("entidad"));
                proveedor.setTelefono(rs.getString("telefono"));
                proveedor.setCorreo(rs.getString("correo"));
                proveedor.setDireccion(rs.getString("direccion"));
                lista.add(proveedor);
            }
        } catch (SQLException e) {
            System.out.print(e);
        }
        return lista;
    }
}

package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Presentacion;
import util.Conexion;

public class PresentacionDAO {
    private String consulta;

    // Método para registrar una nueva presentación
    public boolean Registrar(Presentacion presentacion) {
        consulta = "CALL sp_Agregar_Presentacion(?, ?);";
        boolean exitoso = false;

        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);
            
            cst.setString(1, presentacion.getNombre());
            cst.setString(2, presentacion.getDescripcion());
            
            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }

    // Método para editar una presentación existente
    public boolean Editar(Presentacion presentacion) {
        consulta = "CALL sp_Editar_Presentacion(?, ?, ?);";
        boolean exitoso = false;

        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);
            
            cst.setInt(1, presentacion.getIdPresentacion());
            cst.setString(2, presentacion.getNombre());
            cst.setString(3, presentacion.getDescripcion());
            
            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }

    // Método para eliminar una presentación
    public boolean Eliminar(int idPresentacion) {
        consulta = "CALL sp_Eliminar_Presentacion(?);";
        boolean exitoso = false;

        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);
            
            cst.setInt(1, idPresentacion);
            
            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }

    // Método para mostrar todas las presentaciones
    public List<Presentacion> Mostrar() {
        consulta = "CALL sp_Listar_Presentacion();";
        List<Presentacion> lista = new ArrayList<>();

        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);
            ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                Presentacion presentacion = new Presentacion();
                presentacion.setIdPresentacion(rs.getInt("idPresentacion"));
                presentacion.setNombre(rs.getString("nombre"));
                presentacion.setDescripcion(rs.getString("descripcion"));
                lista.add(presentacion);
            }
        } catch (SQLException e) {
            System.out.print(e);
        }
        return lista;
    }
}

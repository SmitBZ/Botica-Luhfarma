package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Usuario;
import util.Conexion;

/**
 * Clase donde se maneja la logica entre la base de datos y la clase usuario
 * @author Smit
 * @version 2.0
 */
public class UsuarioDAO {
    //Variable que mantendra las consultas hacia la base de datos
    private String Consulta;
    
    /**
     * Metodo de registro de usuario para la vista del Administrador
     * @param us
     * @return retorna un booleano verificando si existe o no el usuario
     */
    public boolean RegistrarUsuario(Usuario us){
        boolean existe = false;
        Consulta = "call sp_Agregar_Usuario(?,?,?,?,?,?,?);";
        
        try{
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(Consulta);
            
            cst.setString(1, us.getNombre());
            cst.setString(2, us.getApellido());
            cst.setString(3, us.getCorreo());
            cst.setString(4, us.getTelefono());
            cst.setString(5, us.getContraseña());
            cst.setString(6, us.getRol());
            
            cst.registerOutParameter(7, java.sql.Types.BOOLEAN);
            
            cst.execute();
            
            existe = cst.getBoolean(7);
        }catch(SQLException e){
           System.out.print(e);
        }
        return existe;
    }
    
    /***
     * Metodo de registro de usuario-cliente para la vista del Uusario
     * @param usc
     * @return retorna el nombre del usuario creado
     */
    public String RegistrarCliente(Usuario usc){
        String nombreUsuario = null;
        boolean usuarioExistente;
        Consulta = "call sp_Agregar_Usuario_Cliente(?,?,?,?,?,?,?,?,?,?,?);";
        
        try{
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(Consulta);
            
            cst.setString(1, usc.getNombre());
            cst.setString(2, usc.getApellido());
            cst.setString(3, usc.getCorreo());
            cst.setString(4, usc.getTelefono());
            cst.setString(5, usc.getContraseña());
            cst.setString(6, usc.getRol());
            cst.setString(7, usc.getDni());
            cst.setString(8, usc.getDireccion());
            cst.setString(9, usc.getEstado());
            
            cst.registerOutParameter(10, java.sql.Types.VARCHAR);
            cst.registerOutParameter(11, java.sql.Types.BOOLEAN);
            
            cst.execute();
            
            usuarioExistente = cst.getBoolean(11);
            
            if(!usuarioExistente){
                nombreUsuario = cst.getString(10);
            }
        }catch(SQLException e){
            System.out.print(e);
        }
        return nombreUsuario;
    }
    
    /**
     * Metodo para verificar los roles dentro de la pagina web
     * @param us
     * @return retorno el rol para poder redireccionar en que vista ser mandada
     */
    public Usuario Autenticar(Usuario us){
        Usuario usa = null;
        String rol, nombre;
        Consulta = "call sp_Validar_usuario(?, ?, ?, ?);";
    
        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(Consulta); 
        
            cst.setString(1, us.getCorreo());
            cst.setString(2, us.getContraseña());
            cst.registerOutParameter(3, java.sql.Types.VARCHAR);
            cst.registerOutParameter(4, java.sql.Types.VARCHAR);  // Para el nombre
        
            cst.execute();
        
            rol = cst.getString(3);
            nombre = cst.getString(4);  // Obtener el nombre del usuario

            if (rol != null) {
                usa = new Usuario();
                usa.setCorreo(us.getCorreo());
                usa.setContraseña(us.getContraseña());
                usa.setRol(rol);
                usa.setNombre(nombre);  // Asignar el nombre recuperado
            }
        } catch (SQLException e) {
            System.out.print(e);
        }
        return usa;
    }

    
    /**
     * Metodo para mostrar los usuarios registrado de la base de datos
     * @return retorna la lista de los usuarios
     */
    public List<Usuario> ListarUsuarios(){
        List<Usuario> listaUsuarios = new ArrayList<>();
        Consulta = "call sp_Listar_Usuario();";
        
        try{
            Connection cn = Conexion.getConnection();
            Statement cst = cn.createStatement();
            ResultSet rs = cst.executeQuery(Consulta);
            
            while (rs.next()) {
                Usuario us = new Usuario();
                us.setIdUsuario(rs.getInt("idUsuario"));
                us.setNombre(rs.getString("nombre"));
                us.setApellido(rs.getString("apellido"));
                us.setCorreo(rs.getString("email"));
                us.setTelefono(rs.getString("telefono"));
                us.setContraseña(rs.getString("contraseña"));
                us.setRol(rs.getString("rol"));
                listaUsuarios.add(us);
            }
        }catch (SQLException e) {
            System.out.println(e);
        }
        return listaUsuarios;
    }
    
    /**
     * Metodo que permite mostrar el numero de clientes registrados
     * @return retorna el valor o numero de clientes
     */
    public int contarClientes() {
        int numClientes = 0;
        Consulta = "call sp_Contar_Clientes()";

        try{
            Connection cn = Conexion.getConnection();
            PreparedStatement pstm = cn.prepareStatement(Consulta);
            ResultSet rs = pstm.executeQuery();
            
            if (rs.next()) {
                numClientes = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.print(e);
        }
        return numClientes;
    }
    
    public boolean Eliminar(int idUsuario) {
        Consulta = "call sp_Eliminar_Usuario(?);";
        boolean exitoso = false;

        try (Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(Consulta)) {

            cst.setInt(1, idUsuario);

            cst.execute();
            exitoso = true;

        } catch (SQLException e) {
            System.out.print(e);
        }
        return exitoso;
    }
}

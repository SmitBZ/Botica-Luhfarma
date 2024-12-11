package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Producto;
import util.Conexion;

/**
 *
 * @author Smit
 */
public class ProductoDAO {
    private String consulta;

    // Método para registrar un producto
    public boolean Registrar(Producto producto) {
         consulta = "CALL sp_Agregar_Producto(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        boolean exitoso = false;
        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);

            cst.setString(1, producto.getNombre());
            cst.setDouble(2, producto.getPrecio());
            cst.setString(3, producto.getDescripcion());
            cst.setDate(4, Date.valueOf(producto.getFechaP()));
            cst.setDate(5, Date.valueOf(producto.getFechaV()));
            cst.setString(6, producto.getImg());
            cst.setString(7, producto.getAlmacen());
            cst.setString(8, producto.getCategoria());
            cst.setString(9, producto.getPresentacion());
            cst.setInt(10, producto.getStock());

            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.println("Error al registrar producto: " + e.getMessage());
        }
        return exitoso;
    }
    
    public boolean Editar(Producto producto) {
        consulta = "CALL sp_Editar_Producto(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        boolean exitoso = false;
        
        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);

            cst.setInt(1, producto.getIdProducto());
            cst.setString(2, producto.getNombre());
            cst.setDouble(3, producto.getPrecio());
            cst.setString(4, producto.getDescripcion());
            cst.setDate(5, Date.valueOf(producto.getFechaP()));
            cst.setDate(6, Date.valueOf(producto.getFechaV()));
            cst.setString(7, producto.getImg());
            cst.setString(8, producto.getAlmacen());
            cst.setString(9, producto.getCategoria());
            cst.setString(10, producto.getPresentacion());
            cst.setInt(11, producto.getStock());
            
            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.println("Error al editar producto: " + e.getMessage());
        }
        return exitoso;
    }
    
    public boolean eliminar(int idProducto) {
        consulta = "CALL sp_Eliminar_Producto(?);";
        boolean exitoso = false;
        
        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);

            cst.setInt(1, idProducto);

            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.println("Error al eliminar producto: " + e.getMessage());
        }
        return exitoso;
    }
    
    public List<Producto> Mostrar() {
        consulta = "CALL sp_Listar_Producto();";
        List<Producto> listaProductos = new ArrayList<>();
        
        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);
            ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("Producto"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setFechaP(rs.getDate("fechaprodu").toLocalDate());
                producto.setFechaV(rs.getDate("fechacadu").toLocalDate());
                producto.setImg(rs.getString("imagen"));
                producto.setAlmacen(rs.getString("Almacen"));
                producto.setCategoria(rs.getString("Categoria"));
                producto.setPresentacion(rs.getString("Presentacion"));

                listaProductos.add(producto);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        }
        return listaProductos;
    }
    
    public List<Producto> MostrarProducto(String nombreProducto) {
        consulta = "CALL sp_Filtrar_Producto(?);";
        List<Producto> listaProductos = new ArrayList<>();
        
        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);
            
            cst.setString(1, nombreProducto);
            
            ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("Producto"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setFechaP(rs.getDate("fechaprodu").toLocalDate());
                producto.setFechaV(rs.getDate("fechacadu").toLocalDate());
                producto.setImg(rs.getString("imagen"));
                producto.setAlmacen(rs.getString("Almacen"));
                producto.setCategoria(rs.getString("Categoria"));
                producto.setPresentacion(rs.getString("Presentacion"));

                listaProductos.add(producto);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        }
        return listaProductos;
    }
    
    public int ProductosVencer() {
        int proCli = 0;
        consulta = "call sp_Productos_Vencer();";

        try{
            Connection cn = Conexion.getConnection();
            PreparedStatement pstm = cn.prepareStatement(consulta);
            ResultSet rs = pstm.executeQuery();
            
            if (rs.next()) {
                proCli = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.print(e);
        }
        return proCli;
    }
}

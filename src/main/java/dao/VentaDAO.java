package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import model.Venta;
import util.Conexion;

/**
 *
 * @author Smit
 */
public class VentaDAO {
    private String consulta;

    public boolean registrarVenta(Venta venta) {
        consulta = "call sp_Registrar_Ventas(?,?,?,?,?,?,?);";
        boolean exitoso = false;

        try {
            Connection cn = Conexion.getConnection();
            CallableStatement cst = cn.prepareCall(consulta);
            
            cst.setInt(1, venta.getIdCliente());
            cst.setInt(2, venta.getIdModalidad());
            cst.setString(3, venta.getCodigoVenta());
            cst.setInt(4, venta.getProductoID());
            cst.setInt(5, venta.getPresentacionID());
            cst.setInt(6, venta.getCantidad());
            cst.setDouble(7, venta.getPrecioUnitario());

            cst.execute();
            exitoso = true;
        } catch (SQLException e) {
            System.out.println("Error al registrar la venta: " + e.getMessage());
        }
        return exitoso;
        
    }
}

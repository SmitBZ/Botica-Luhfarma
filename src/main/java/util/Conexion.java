package util;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *Clase de Conexion hacia la base de datos
 * @author Smit
 */

public class Conexion {
    private static DataSource dt;
    
    static{
        try{
            InitialContext context = new InitialContext();
            dt = (DataSource) context.lookup("java:/luhfarma");
        }catch(NamingException e){
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() throws SQLException {
        return dt.getConnection();
    }
}

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
private static DataSource dataSource;
    
    static {
        try {
            
            InitialContext context = new InitialContext();
            dataSource = (DataSource) context.lookup("jdbc/lufarma");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    } 
    
    /**
     * Obtiene una conexión a la base de datos.
     * @return Connection, la conexión a la base de datos.
     * @throws SQLException Si hay un error al obtener la conexión.
     */
    public static Connection getConnection() throws SQLException {
        // Verifica si el DataSource fue correctamente inicializado
        if (dataSource == null) {
            throw new SQLException("No se pudo obtener el DataSource. Asegúrate de que esté configurado correctamente en el servidor.");
        }
        
        return dataSource.getConnection();
    }
}

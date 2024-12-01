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
            // Buscar el DataSource configurado en JNDI
            InitialContext context = new InitialContext();
            // Asegúrate de que el nombre aquí coincida con el que configuraste en el servidor
            dataSource = (DataSource) context.lookup("java:/db_botica");
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

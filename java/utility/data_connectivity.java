package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class data_connectivity {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/agency";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "3903";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}

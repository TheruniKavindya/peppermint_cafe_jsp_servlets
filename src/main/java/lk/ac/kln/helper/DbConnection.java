package lk.ac.kln.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://database:5000/peppermint_cafe", "peppermint_admin", "peppermint_p");
        return connection;
    }
}

package sdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/studentdb";
    private static final String USER = "brian";
    private static final String PASSWORD = "nopass";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

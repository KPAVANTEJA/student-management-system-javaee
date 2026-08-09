package com.sms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "<yourdburl>";
    private static final String USER = "<yourdbusername>";
    private static final String PASSWORD = "<yourdbpassword>";

 
    public static Connection getConnection(){
        Connection connect = null;
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            connect = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("Database Connected Successfully.");
        } catch (ClassNotFoundException e) {

            System.out.println("Oracle JDBC Driver Not Found.");
            
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        catch(SQLException e){
            
            System.out.println("Database Connection Failed.");
            e.printStackTrace();

            System.out.println(e.getMessage());
            
        }

        return connect;
    }
}
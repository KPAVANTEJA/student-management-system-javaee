package com.sms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import  java.sql.ResultSet;
import java.sql.SQLException;

import com.sms.model.User;
import com.sms.util.DBConnection;

public class UserDAO {

    public User validateUser(String username, String password){
        
        try {

            Connection connect = DBConnection.getConnection();

            String sql = "SELECT * FROM SMS_USER WHERE USERNAME = ? AND PASSWORD = ?";

            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                User user = new User();

                user.setUsername(rs.getString("USERNAME"));
                user.setPassword(rs.getString("PASSWORD"));
                user.setRole(rs.getString("ROLE"));

                return user;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return null;
    }
}

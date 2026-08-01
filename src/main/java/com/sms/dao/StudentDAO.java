package com.sms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sms.model.Student;
import com.sms.util.DBConnection;

public class StudentDAO {
	public boolean addStudent(Student student) {
		
		int rows = 0;
		
		Connection connect = DBConnection.getConnection();
		
		String sql = "INSERT INTO STUDENT(ROLL_NO, FIRST_NAME, LAST_NAME, GENDER, EMAIL, PHONE, BRANCH, YEAR, SECTION) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement ps = connect.prepareStatement(sql);
			
			ps.setString(1, student.getRollNo());
			ps.setString(2, student.getFirstName());
			ps.setString(3, student.getLastName());
			ps.setString(4, student.getGender());
			ps.setString(5, student.getEmail());
			ps.setString(6, student.getPhone());
			ps.setString(7, student.getBranch());
			ps.setInt(8, student.getYear());
			ps.setString(9, student.getSection());
			
			rows = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rows > 0;
	}
}

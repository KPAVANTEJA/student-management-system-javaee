package com.sms.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sms.model.Student;
import com.sms.util.DBConnection;

public class StudentDAO {
	
	Connection connect = DBConnection.getConnection();
	
	public boolean addStudent(Student student) {
		
		int rows = 0;
		
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
	
	public List<Student> getAllStudents(){
		
		String sql = "SELECT * FROM STUDENT ORDER BY ROLL_NO";
		
		List<Student> students = new ArrayList<>();
		
		try {
			PreparedStatement ps = connect.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Student student = new Student();
				
				student.setRollNo(rs.getString("ROLL_NO"));
				student.setFirstName(rs.getString("FIRST_NAME"));
				student.setLastName(rs.getString("LAST_NAME"));
				student.setGender(rs.getString("GENDER"));
				student.setEmail(rs.getString("EMAIL"));
				student.setPhone(rs.getString("PHONE"));
				student.setBranch(rs.getString("BRANCH"));
				student.setYear(rs.getInt("YEAR"));
				student.setSection(rs.getString("SECTION"));
				
				students.add(student);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return students;
	}
	
	public Student searchStudent(String rollNo) {
		
		String sql = "SELECT * FROM STUDENT WHERE ROLL_NO = ?";
		
		
		try {
			
			PreparedStatement ps = connect.prepareStatement(sql);
			ps.setString(1, rollNo);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				Student student = new Student();
				
				student.setRollNo(rs.getString("ROLL_NO"));
				student.setFirstName(rs.getString("FIRST_NAME"));
				student.setLastName(rs.getString("LAST_NAME"));
				student.setGender(rs.getString("GENDER"));
				student.setEmail(rs.getString("EMAIL"));
				student.setPhone(rs.getString("PHONE"));
				student.setBranch(rs.getString("BRANCH"));
				student.setYear(rs.getInt("YEAR"));
				student.setSection(rs.getString("SECTION"));
				
				return student;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean updateStudent(Student student) {
		
		String sql = "UPDATE STUDENT SET FIRST_NAME=?, LAST_NAME=?, GENDER=?, EMAIL=?, PHONE=?, BRANCH=?, YEAR=?, SECTION=? WHERE ROLL_NO = ?";
		int updatedRows = 0;
		
		try {
			PreparedStatement ps = connect.prepareStatement(sql);
			
			ps.setString(1, student.getFirstName());
			ps.setString(2, student.getLastName());
			ps.setString(3, student.getGender());
			ps.setString(4, student.getEmail());
			ps.setString(5, student.getPhone());
			ps.setString(6, student.getBranch());
			ps.setInt(7, student.getYear());
			ps.setString(8, student.getSection());

			ps.setString(9, student.getRollNo());
			
			updatedRows = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return updatedRows > 0;
		
	}
	
	public boolean deleteStudent(String rollNo) {
		
		int rowsDeleted = 0;
		
		String sql = "DELETE FROM STUDENT WHERE ROLL_NO = ?";
		
		try {
			PreparedStatement ps = connect.prepareStatement(sql);
			
			ps.setString(1, rollNo);
			
			rowsDeleted = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowsDeleted > 0;
		
	}
}

package com.sms.controller;

import java.util.List;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/studentServlet")
public class StudentServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rollNo = request.getParameter("rollNo");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String branch = request.getParameter("branch");
		int year = Integer.parseInt(request.getParameter("year"));
		String section = request.getParameter("section");
		
		Student student = new Student();

		student.setRollNo(rollNo);
		student.setFirstName(firstName);
		student.setLastName(lastName);
		student.setGender(gender);
		student.setEmail(email);
		student.setPhone(phone);
		student.setBranch(branch);
		student.setYear(year);
		student.setSection(section);
		
		StudentDAO studentDAO = new StudentDAO();

		boolean added = studentDAO.addStudent(student);
		
		if(added) {
			request.setAttribute("message", "Student Registration successfull.");
		} else {
			request.setAttribute("message", "Failed to register as a student");
		}
		
		request.getRequestDispatcher("addStudent.jsp")
	           .forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		StudentDAO studentDAO = new StudentDAO();
		
		List<Student> students = studentDAO .getAllStudents();
		
		
		if("view".equals(action)) {
			request.setAttribute("students", students);
			
			request.getRequestDispatcher("/viewStudents.jsp").forward(request, response);
		}
	}

}

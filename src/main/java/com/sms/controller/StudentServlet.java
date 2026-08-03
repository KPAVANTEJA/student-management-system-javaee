package com.sms.controller;

import java.util.List;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sms.dao.StudentDAO;
import com.sms.exception.DatabaseException;
import com.sms.exception.DuplicateStudentException;
import com.sms.exception.StudentNotFoundException;
import com.sms.model.Student;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/studentServlet")
public class StudentServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		
		StudentDAO studentDAO = new StudentDAO();
		
		Student student = new Student();
		
		if("add".equals(action)) {
			
			String rollNo = request.getParameter("rollNo");
			rollNo = rollNo.trim().toUpperCase();
			
			if(rollNo.isEmpty()){

				request.setAttribute("error", "Email is required.");
				request.getRequestDispatcher("addStudent.jsp").forward(request, response);

			    return;
			}
			
			if(studentDAO.isRollNumberExists(rollNo)){

			    request.setAttribute("error", "Roll Number already exists.");

			    request.getRequestDispatcher("addStudent.jsp").forward(request,response);

			    throw new DuplicateStudentException(
			    	    "Roll Number already exists."
			    	);
			}
			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String gender = request.getParameter("gender");
			
			String email = request.getParameter("email");
			email = email.trim();
			
			if(email.isEmpty()) {
				request.setAttribute("error", "Email is required.");
				request.getRequestDispatcher("addStudent.jsp").forward(request, response);
				
				return;
			}
			if(studentDAO.isEmailExists(email)){

			    request.setAttribute("error", "Email already exists.");

			    request.getRequestDispatcher("addStudent.jsp").forward(request,response);

			    return;
			}
			
			String phone = request.getParameter("phone");
			String branch = request.getParameter("branch");
			int year = Integer.parseInt(request.getParameter("year"));
			String section = request.getParameter("section");
			
			

			student.setRollNo(rollNo);
			student.setFirstName(firstName);
			student.setLastName(lastName);
			student.setGender(gender);
			student.setEmail(email);
			student.setPhone(phone);
			student.setBranch(branch);
			student.setYear(year);
			student.setSection(section);
			
			
//			boolean added = studentDAO.addStudent(student);
//			
//			if(added) {
//				response.sendRedirect("studentServlet?action=view&success=added");
//			} else {
//				request.setAttribute("message", "Failed to register.");
//				request.getRequestDispatcher("addStudent.jsp").forward(request, response);
//			}
			
			try {
				studentDAO.addStudent(student);
				response.sendRedirect("studentServlet?action=view&success=added");
			} catch (DuplicateStudentException e) {
				request.setAttribute("message", "Failed to register.");
				request.getRequestDispatcher("addStudent.jsp").forward(request, response);
			} catch(DatabaseException e) {
				response.sendRedirect("error.jsp");
			}
			
		}
		
		else if("update".equals(action)) {
			
			String rollNo = request.getParameter("rollNo");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String branch = request.getParameter("branch");
			int year = Integer.parseInt(request.getParameter("year"));
			String section = request.getParameter("section");
			
			
			student.setRollNo(rollNo);
			student.setFirstName(firstName);
			student.setLastName(lastName);
			student.setGender(gender);
			student.setEmail(email);
			student.setPhone(phone);
			student.setBranch(branch);
			student.setYear(year);
			student.setSection(section);
			
			boolean updated = studentDAO.updateStudent(student);
			
			if(updated) {
				response.sendRedirect("studentServlet?action=view");
			} else {
				
				
				request.setAttribute("message", "Failed to update details.");
				
				Student existingStudent = studentDAO.searchStudent(rollNo);
			    request.setAttribute("student", existingStudent);
			    
				request.getRequestDispatcher("editStudent.jsp").forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		StudentDAO studentDAO = new StudentDAO();
		
		
		if("view".equals(action)) {
			
			List<Student> students = studentDAO.getAllStudents();
			int rows = 0;
			
			try {
				rows = studentDAO.getTotalStudents();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("students", students);
			request.setAttribute("totalStudents", rows);

			
			request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
		}
		
		if("search".equals(action)) {
			
			String rollNo = request.getParameter("rollNo");
			
			Student student = studentDAO.searchStudent(rollNo);
			
			if(student != null){

			    request.setAttribute("student",student);

			    request.getRequestDispatcher("searchResult.jsp").forward(request,response);

				}
				else{

					request.setAttribute("message","Student Not Found.");

					request.getRequestDispatcher("searchStudent.jsp").forward(request,response);
					throw new StudentNotFoundException(
						    "Student not found."
						);
				}
			}
		
		if("edit".equals(action)) {
			String rollNo = request.getParameter("rollNo");
			
			Student student = studentDAO.searchStudent(rollNo);
			
			request.setAttribute("student", student);

			request.getRequestDispatcher("editStudent.jsp")
			       .forward(request, response);
		}
		
		else if("delete".equals(action)) {
			String rollNo = request.getParameter("rollNo");
			
			boolean deleted = studentDAO.deleteStudent(rollNo);
			
			if(deleted) {
				response.sendRedirect("studentServlet?action=view");
			} else {
				request.setAttribute("message", "Failed to delete");
				request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
			}
		}
	}

}

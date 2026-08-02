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
		
		
		String action = request.getParameter("action");
		
		StudentDAO studentDAO = new StudentDAO();
		
		Student student = new Student();
		
		if("add".equals(action)) {
			
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
			

			boolean added = studentDAO.addStudent(student);
			
			if(added) {
				request.setAttribute("message", "Student Registration successfull.");
			} else {
				request.setAttribute("message", "Failed to register as a student");
			}
			
			request.getRequestDispatcher("addStudent.jsp")
		           .forward(request, response);
			
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
			
			request.setAttribute("students", students);
			
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

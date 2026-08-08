package com.sms.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.sms.constants.SMSConstants;
import com.sms.dao.UserDAO;
import com.sms.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
		
	 String action = request.getParameter("action");
	     
	 if("inSearch".equals(action) || "inView".equals(action)) {
	    	 	response.sendRedirect("dashboard.jsp");
	    	 	return;
	     }
     RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
     dispatcher.forward(request, response);
     
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        // response.setContentType("text/html");

        // PrintWriter out = response.getWriter();

        // out.println("<h1>Welcome to servlet world!</h1>");

        String name = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User userObject = userDAO.validateUser(name, password); // the method return object(user) of type User(class)

        if(userObject != null){ //name.equals("Coder") && pass.equals("coder123")

//            request.setAttribute("user", userObject); 
        	
        		HttpSession session = request.getSession();
        		session.setAttribute("user", userObject);
        		
            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
            dispatcher.forward(request, response);
        		
        }
        else{
            //request.setAttribute("error", "Invalid username and password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp?error=invalid");
            dispatcher.forward(request, response);
        }
        
    }


}

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>DashBoard</title>
</head>
<body>
    <%@ page import="com.sms.model.User" %>
    
    
	<% 
	User user = (User) session.getAttribute("user");
	
	if(user == null){
		response.sendRedirect("login.jsp");
		return;
	}
	%>
 
<h1>Welcome Mr. <%= user.getUsername() %> </h1>
<p>
    Thank you for contributing as a <%= user.getRole() %>
</p>

<h3>Student can Add, Update, and Delete his/her details quickly.</h3>

<ul>
<li><a href= "addStudent.jsp">New</a></li>
<li><a href= "studentServlet?action=view">View Students</a></li>

</ul>

<a href="logout" ><button>Logout</button></a>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>DashBoard</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
<%@ page import="com.sms.model.User" %>
<%@ page import="com.sms.constants.SMSConstants" %>
<% 
	User user = (User) session.getAttribute("user");
	
	if(user == null){
		response.sendRedirect("login.jsp");
		return;
	}
	%>

<header>
<nav class="navbar">

<div class="logo">Student Management System</div>

<div class="user-section">

<span>
Welcome
<%= user.getUsername() + ", Your log-in as " + user.getRole() %>
</span>
<a href="logout">Logout</a>

</div>

</nav>
</header>

<section class="welcome">

<h1>Dashboard</h1>
<p>Manage students efficiently.</p>

</section>

<section class="dashboard">

<div class="card">

<p>Fill student details correctly in the form given and submit to add new student to the college portal.</p>
<a href="addStudent.jsp">Create</a>

</div>

<div class="card">

<p>View all students in the College.</p>
<a href="studentServlet?action=view">Read</a>

</div>

<div class="card">

<p>Verify whether the student exists in the college or not by Roll Number.</p>
<a href="searchStudent.jsp">Search</a>

</div>

<div class="card">

<p>Update a student details with change information quickly.</p>
<a href="studentServlet?action=view">Update</a>

</div>

<div class="card">

<p>Delete a student from college portal.</p>
<a href="StudentServlet?action=view">Delete</a>

</div>

<div class="card">

<p>Sign out here.</p>
<a href="logout">Sign-out</a>

</div>

</section>

<footer>
<p>© 2026 Student Management System by Pavan K</p>
</footer>

</body>
</html>
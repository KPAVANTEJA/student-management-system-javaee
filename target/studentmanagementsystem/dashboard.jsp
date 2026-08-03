<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>DashBoard</title>
    <link rel="stylesheet" href="css/dashboard.css">
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

<header>
<nav class="navbar">

<div class="logo">Student Management System</div>

<div class="user-section">

<span>

Welcome,
<%= user.getUsername() %>
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

<h2>Add Student</h2>
<a href="addStudent.jsp">Open</a>

</div>

<div class="card">

<h2>View Students</h2>
<a href="studentServlet?action=view">Open</a>

</div>

<div class="card">

<h2>Search Student</h2>
<a href="searchStudent.jsp">Open</a>

</div>

<div class="card">

<h2>Update Student</h2>
<a href="studentServlet?action=view">Open</a>

</div>

<div class="card">

<h2>Delete Student</h2>
<a href="StudentServlet?action=view">Open</a>

</div>

<div class="card">

<h2>Logout</h2>
<a href="logout">Open</a>

</div>

</section>

<div class="card">
<h2>Total Students</h2>
<h1>150</h1>
</div>

<footer>
<p>© 2026 Student Management System by Pavan K</p>
</footer>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Student</title>
<link rel="stylesheet" href="css/search.css">
</head>
<body>


<header>
<div class="navbar">

<div>
<% String msg = (String) request.getAttribute("message");
if(msg != null){
%>

<p><%= msg %></p>
<%} %>
</div>

<div>
<a href="login?action=inSearch" class="dashboard-btn">Dashboard</a>
</div>

</div>
</header>

<section>
<div class="search-container">
<div class="search-card">

<h1>Search Student</h1>

<form action="studentServlet?action=search" method="get">

    <input type="hidden" name="action" value="search">

    <input type="text" name="rollNo" placeholder="Enter Roll Number..." required>

    <button class="hero-btn">Search</button>

</form>

</div>

<div class="result-card">


<%@ page import = "com.sms.model.Student" %>
<% Student student = (Student)request.getAttribute("student"); %>

<% if(student != null){ %>
<h1>Student Details</h1>

<h4>Name: <span><%= student.getFirstName() + " " +  student.getLastName() %></span></h4>
<h4>Email: <span><%= student.getEmail() %></span></h4>
<h4>Phone Number: <span><%= student.getPhone() %></span></h4>
<h4>Year: <span><%= student.getYear() %></span></h4>
<h4>Department: <span><%= student.getBranch() %></span></h4>
<h4>Section: <span><%= student.getSection() %></span></h4>

<% } else { %>
<p>Hello.....</p>

<% } %>

</div>

</div>
</section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>
<link rel="stylesheet" href="css/table.css">
</head>
<body>
<%@ page import = "java.util.List" %>
<%@ page import = "com.sms.model.Student" %>

<% List<Student> students = (List<Student>) request.getAttribute("students");

String success = request.getParameter("success");

if("added".equals(success)){
%>
<header>
<p>Student added successfully.</p>

<%
}
%>

<% String msg = (String) request.getAttribute("message"); %>

<h5><%= msg %></h5>
</header>

<section>
<div class="table-card">
 
<table>

<thead>
<tr>
 <th>Roll Number</th> 
 <th>Name</th>
 <th>Email</th>
 <th>Branch</th>
 <th>Year</th>
 <th>Section</th>
 <th>Edit</th>
 <th>Delete</th>
</tr>
</thead>

<tbody>

<%
for(Student student : students){
%>

<tr>

<td><%=student.getRollNo()%></td>
<td><%=student.getFirstName() + " " + student.getLastName() %></td>
<td><%=student.getEmail()%></td>
<td><%=student.getBranch()%></td>
<td><%=student.getYear()%></td>
<td><%=student.getSection()%></td>
<td>
    <a class="edit-btn" href="studentServlet?action=edit&rollNo=<%=student.getRollNo()%>">
        Edit
    </a>
</td>

<td>
	<a class="delete-btn" href="studentServlet?action=delete&rollNo=<%=student.getRollNo()%>" onclick="return confirm('Are you sure you want to delete?');">
	Delete</a>
</td>

</tr>
<% } %>

</tbody>
</table>
</div>
</section>

<footer>
<div class="card">
<h1>Total Students</h1>
<h2><%= request.getAttribute("totalStudents") %></h2>
</div>
</footer>
</body>
</html>
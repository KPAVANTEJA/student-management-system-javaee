<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>
</head>
<body>
<%@ page import = "java.util.List" %>
<%@ page import = "com.sms.model.Student" %>

<% List<Student> students = (List<Student>) request.getAttribute("students"); %>
 
<table border= 1>

<tr>
 <th>Roll Number</th> 
 <th>Name</th>
 <th>Dept.</th>
 <th>Year</th>
 <th>Sec</th>
 <th>Modify</th>
 <th>Remove</th>
</tr>

<%
for(Student student : students){
%>

<tr>

<td><%=student.getRollNo()%></td>

<td><%=student.getFirstName()%></td>

<td><%=student.getBranch()%></td>

<td><%=student.getYear()%></td>

<td><%=student.getSection()%></td>

<td>
    <a href="studentServlet?action=edit&rollNo=<%=student.getRollNo()%>">
        Edit
    </a>
</td>

<td>
	<a href="studentServlet?action=delete" onclick="return confirm('Are you sure you want to delete?');">
	Delete</a>
</td>

</tr>

<% } %>
</table>

<% String msg = (String) request.getAttribute("message"); %>

<h5><%= msg %></h5>
</body>
</html>
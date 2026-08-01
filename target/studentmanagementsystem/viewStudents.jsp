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
<%
for(Student student : students){
%>

<tr>

<td><%=student.getRollNo()%></td>

<td><%=student.getFirstName()%></td>

<td><%=student.getBranch()%></td>

<td><%=student.getYear()%></td>

<td><%=student.getSection()%></td>

</tr>

<%
}
%>
</table>

<h5>Students List</h5>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
</head>
<body>

<%@ page import = "com.sms.model.Student" %>
<% Student student = (Student)request.getAttribute("student"); %>

<h2>Student details:</h2>
<p>Name: <%= student.getFirstName() + " " +  student.getLastName() %></p>
<p>Email: <%= student.getEmail() %></p>

<p>Department : <%= student.getBranch() %></p>
</body>
</html>
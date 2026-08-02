<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
-----------------------------------------------------
<h1>Student Management System</h1>

<h3>You are most Welcome !</h3>

<p>Login to access student details and to work on </p>
-----------------------------------------------------
<a href="login.jsp"><button>Login</button></a>

<%
String message =
request.getParameter("expired");

if("true".equals(message)){
%>

<p>

Your session has expired.

Please log in again.

</p>

<%
}
%>
</body>
</html>
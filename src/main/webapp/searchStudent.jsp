<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Student</title>
</head>
<body>
<form action="StudentServlet" method="get">

    <input type="hidden"
           name="action"
           value="search">

    Roll Number:

    <input type="text"
           name="rollNo"
           required>

    <input type="submit"
           value="Search">

</form>

<% String msg = (String)request.getAttribute("message"); %>
<h6><%= msg %></h6>
</body>
</html>
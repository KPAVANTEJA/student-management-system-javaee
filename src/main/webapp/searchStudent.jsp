<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Student</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="search-card">
<form action="StudentServlet" method="get">

    <input type="hidden" name="action" value="search">

    <input type="text" name="rollNo" placeholder="Search by Roll Number..." required>

    <button>Search</button>

</form>
</div>

<% String msg = (String)request.getAttribute("message");
if(msg != null){
%>

<h6><%= msg %></h6>
<%} %>
</body>
</html>
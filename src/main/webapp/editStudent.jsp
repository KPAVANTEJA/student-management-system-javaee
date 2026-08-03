<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
<link rel="stylesheet" href="css/form.css">
</head>
<body>
<%@ page import="com.sms.model.Student" %>

<%
Student student = (Student) request.getAttribute("student");
%>

<div class="container">

    <div class="form-card">

<h1>Edit Student</h1>

<p>
Enter student details below.
</p>
<form action="studentServlet?action=update" method ="post">
<input type="text" name="rollNo" value="<%=student.getRollNo()%>" readonly>

<input type="text" name="firstName" value="<%=student.getFirstName()%>">
<input type="text" name="lastName" value="<%=student.getLastName()%>"><br><br>
Gender:
<input type="radio" name="gender" value="Male"
    <%= "Male".equals(student.getGender()) ? "checked" : "" %>>
Male

<input type="radio" name="gender" value="Female"
    <%= "Female".equals(student.getGender()) ? "checked" : "" %>>
Female

<br><br>
<input type="email" name="email" value="<%=student.getEmail()%>">
<input type="tel" name="phone" value="<%=student.getPhone()%>">
<select name="branch">
    <option value="CSE" <%= "CSE".equals(student.getBranch()) ? "selected" : "" %>>CSE</option>
    <option value="ECE" <%= "ECE".equals(student.getBranch()) ? "selected" : "" %>>ECE</option>
    <option value="EEE" <%= "EEE".equals(student.getBranch()) ? "selected" : "" %>>EEE</option>
    <option value="MECH" <%= "MECH".equals(student.getBranch()) ? "selected" : "" %>>MECH</option>
</select>
<br><br>
<select name="year">
    <option value="1" <%= student.getYear() == 1 ? "selected" : "" %>>1st Year</option>
    <option value="2" <%= student.getYear() == 2 ? "selected" : "" %>>2nd Year</option>
    <option value="3" <%= student.getYear() == 3 ? "selected" : "" %>>3rd Year</option>
    <option value="4" <%= student.getYear() == 4 ? "selected" : "" %>>4th Year</option>
</select>
<br><br>
<input type="text" name="section" value="<%=student.getSection()%>">

<button type="submit">Update</button>

</form>
<% String msg = (String) request.getAttribute("message"); %>
<p><%= msg %></p>

  </div>

</div>
</body>
</html>
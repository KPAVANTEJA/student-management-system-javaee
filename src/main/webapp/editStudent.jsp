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


<div class="container">
<div class="form-card">

<%
Student student = (Student) request.getAttribute("student");
String failed = (String) request.getAttribute("failed");
if(failed != null){
%>
<p class="fail"><%= failed %></p>
<%
}
%>

<h1>Edit Student Details</h1>
<p>Change student details below.</p>

<form action="studentServlet?action=update" method ="post">
<div class="form-grid">

<div class="form-group">
<label>Roll Number *</label>
<input type="text" name="rollNo" value="<%=student.getRollNo()%>" readonly>
</div>

<div class="form-group">
<label>First Name *</label>
<input type="text" name="firstName" value="<%=student.getFirstName()%>" required>
</div>

<div class="form-group">
<label>Last Name *</label>
<input type="text" name="lastName" value="<%=student.getLastName()%>" required>
</div>

<div class="form-group">
<label>Gender *</label>
<select name="gender">
    <option value="Male" <%= "Male".equals(student.getGender()) ? "selected" : "" %>>Male</option>
    <option value="Female" <%= "Female".equals(student.getGender()) ? "selected" : "" %>>Female</option>
</select>
</div>

<div class="form-group">
<label>Email *</label>
<input type="email" name="email" value="<%=student.getEmail()%>">
</div>

<div class="form-group">
<label>Phone Number *</label>
<input type="tel" name="phone" value="<%=student.getPhone()%>">
</div>

<div class="form-group">
<label>Branch *</label>
<select name="branch">
    <option value="CSE" <%= "CSE".equals(student.getBranch()) ? "selected" : "" %>>CSE</option>
    <option value="ECE" <%= "ECE".equals(student.getBranch()) ? "selected" : "" %>>ECE</option>
    <option value="EEE" <%= "EEE".equals(student.getBranch()) ? "selected" : "" %>>EEE</option>
    <option value="MECH" <%= "MECH".equals(student.getBranch()) ? "selected" : "" %>>MECH</option>
</select>
</div>

<div class="form-group">
<label>Current Year *</label>
<select name="year">
    <option value="1" <%= student.getYear() == 1 ? "selected" : "" %>>1st Year</option>
    <option value="2" <%= student.getYear() == 2 ? "selected" : "" %>>2nd Year</option>
    <option value="3" <%= student.getYear() == 3 ? "selected" : "" %>>3rd Year</option>
    <option value="4" <%= student.getYear() == 4 ? "selected" : "" %>>4th Year</option>
</select>
</div>

<div class="form-group">
<label>Section *</label>
<input type="text" name="section" value="<%=student.getSection()%>">
</div>

<div class="button-group">
<button type="submit">Update changes</button>
</div>

</div>
</form>

</div>
</div>

</body>
</html>
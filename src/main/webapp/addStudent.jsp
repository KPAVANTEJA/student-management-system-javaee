<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>
<link rel="stylesheet" href="css/form.css">
</head>

<body>

<div class="container">

<div class="form-card">

<h1>Add Student</h1>
<p>Enter student details below.</p>

<form action="studentServlet?action=add" method= "post" onsubmit="return validateForm();">
<div class="form-grid">

<div class="form-group">
<label>Roll Number *</label>
<input type="text" name= "rollNo" required>
</div>

<div class="form-group">
<label>First Name *</label>
<input type="text" name= "firstName" required>
</div>

<div class="form-group">
<label>Last Name *</label>
<input type="text" name= "lastName" required>
</div>

<div class="form-group">
<label>Gender *</label>
<select name="gender">
	<option value="">Select Gender</option>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Others">Others..</option>
</select>
</div>

<div class="form-group">
<label>Email *</label>
<input type="email" name= "email" required>
</div>

<div class="form-group">
<label>Phone *</label>
<input type="tel" name= "phone" required>
</div>

<div class="form-group">
<label>Stream *</label>
<select name="branch">
	<option value="">Select Branch</option>
    <option value="CSE">CSE</option>
    <option value="ECE">ECE</option>
    <option value="EEE">EEE</option>
    <option value="MECH">MECH</option>
</select>
</div>

<div class="form-group">
<label>Current Year *</label>
<select name="year">
	<option value="">Select Year</option>
    <option value="1">1st Year</option>
    <option value="2">2nd Year</option>
    <option value="3">3rd Year</option>
    <option value="4">4th Year</option>
</select>
</div>

<div class="form-group">
<label>Section *</label>
<input type="text" name= "section" required>
</div>

<div class="button-group">
<button type="submit">Save Student</button>
<button type="reset">Reset</button>
<a href="dashboard.jsp">Cancel</a>
</div>

</div>
</form>

<% String msg = (String) request.getAttribute("message");
if(msg != null){
	%>
	<p><%= msg %></p>
<%
}
%>
<% String error = (String) request.getAttribute("error");
if(msg != null){
	%>
	<p><%= error %></p>
<%
}
%>

</div>
</div>

<script src="js/validation.js"></script>

</body>
</html>
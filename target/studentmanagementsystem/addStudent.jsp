<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="studentServlet" method= "post">

<input type="text" name= "rollNo">Roll Number <br> <br>
<input type="text" name= "firstName">First Name <br> <br>
<input type="text" name= "lastName">Last Name <br> <br>
<input type="radio" name= "gender">Gender <br> <br>
<input type="email" name= "email">Email <br> <br>
<input type="tel" name= "phone">Phone <br> <br>
<select name="branch">
    <option value="CSE">CSE</option>
    <option value="ECE">ECE</option>
    <option value="EEE">EEE</option>
    <option value="MECH">MECH</option>
</select> <br> <br>
<select name="year">
    <option value="1">1st Year</option>
    <option value="2">2nd Year</option>
    <option value="3">3rd Year</option>
    <option value="4">4th Year</option>
</select> <br> <br>
<input type="text" name= "section">Section <br> <br>

</form>

</body>
</html>
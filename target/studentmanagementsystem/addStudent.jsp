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

Roll Number <input type="text" name= "rollNo"> <br> <br>
First Name <input type="text" name= "firstName"> <br> <br>
Last Name <input type="text" name= "lastName"> <br> <br>
Gender: <input type="radio" name= "gender">Male <input type="radio">Female <br> <br>
Email <input type="email" name= "email"> <br> <br>
Phone <input type="tel" name= "phone"> <br> <br>
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
Section <input type="text" name= "section"> <br> <br>

<button type= "submit">Add Details</button>

</form>

<p> <%= request.getAttribute("message")  %> </p>

</body>
</html>
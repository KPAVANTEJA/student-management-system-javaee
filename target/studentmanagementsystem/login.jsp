<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>SMS Login</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<div class="login-container">

    <div class="login-card">
    
    		<h1>Student Management System</h1>
		<h2>Welcome Back!</h2>
		<p>Please login to continue.</p>
    
    

<form action="login" method="post">
	<label>Username</label>
    <input type="text" name="username" placeholder="Enter Username" required>
    
    <label>Password</label>
    <input type="password" id="password" name="password" placeholder="Enter Password" required>
    
    <button type="submit">Login</button>
</form>

<a href="index.jsp">

← Back to Home

</a>

<%
String error=request.getParameter("error");

if("invalid".equals(error)){
%>

<p class="error">

Invalid Username or Password

</p>

<%
}
%>
</div>

</div>
</body>
</html>
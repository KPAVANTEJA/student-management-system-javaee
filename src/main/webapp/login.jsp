<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>SMS Login</title>
</head>
<body>

<h1>Login to your account!</h1>

<form action="login" method="post">
    UserName <input type="text" name="username"> <br> <br>
    Password <input type="password" name="password"> <br> <br> <br>
    
    <button type="submit">Login</button>
    
</form>

<% String errormsg = (String) request.getAttribute("error");

if(errormsg != null){
    %>
    <p><%= errormsg %> </p>
 
<% }%>
</body>
</html>
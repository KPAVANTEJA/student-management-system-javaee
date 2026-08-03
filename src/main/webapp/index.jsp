<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>

    <nav class="navbar">

        <div class="logo">
            Student Management System
        </div>

        <div>

            <a href="login.jsp" class="login-btn">
                Login
            </a>

        </div>

    </nav>

</header>

<section class="hero">

    <h1>

        Welcome to Student Management System

    </h1>

    <p>

        Manage student records securely using
        Java, JSP, Servlets, JDBC and Oracle Database.

    </p>

    <a href="login.jsp" class="hero-btn">

        Login to Dashboard

    </a>

</section>

<section class="features">

    <div class="card">

        <h2>Student Registration</h2>

        <p>
            Add student information quickly.
        </p>

    </div>

    <div class="card">

        <h2>Search Students</h2>

        <p>
            Find students using Roll Number.
        </p>

    </div>

    <div class="card">

        <h2>Update Records</h2>

        <p>
            Modify student information.
        </p>

    </div>

    <div class="card">

        <h2>Secure Login</h2>

        <p>
            Session based authentication.
        </p>

    </div>

</section>

<%
String message =
request.getParameter("expired");

if("true".equals(message)){
%>

<p style="color:red">

Your session has expired.

Please log in again.

</p> 

<%
}
%>

<footer>

    <p>

        © 2026 Student Management System

    </p>

</footer>
</body>
</html>
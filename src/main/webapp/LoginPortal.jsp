<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<link rel="stylesheet" href="style.css">
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
		<title>BuyMe - Login</title>
	</head>
	
	<body>
	<div>
	<h2 class="loginHeader">BuyMe</h2>
		<form method="get" action="validateLogin.jsp" class="loginPortal">
				   	
			<label class="usernameTextLogin">Username </label>
			<input type="text" name="username" maxlength="32" class="loginUsername" required>
			<label class="passwordTextLogin">Password </label>
			<input type="password" name="password" minlength="8" maxlength="32" class="loginPassword" required>
			<input type="submit" value="Login" class="loginButton">
		</form>
	</div>
	<label> <a href="CreateAccount.jsp" class="createAcc">Create account</a></label>
	
</body>
</html>
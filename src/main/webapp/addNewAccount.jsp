<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<link rel="stylesheet" href="style.css">
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
<title>Login Portal</title>
</head>
<body>
	<% try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Get the selected rdio button from the index.jsp
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String dob = request.getParameter("dob");
		
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zipCode");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		
		String username = request.getParameter("createUsername");
		String email = request.getParameter("emailCreateAcc");
		String password = request.getParameter("passwordCreateAcc");
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String createAcc = "INSERT INTO Accounts (firstName, lastName, dob, street, city, zipCode, country, state, username, email, password)"
		+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement prepStmt = con.prepareStatement(createAcc);
		
		prepStmt.setString(1, firstName);
		prepStmt.setString(2, lastName);
		prepStmt.setDate(3, java.sql.Date.valueOf(dob));
		prepStmt.setString(4, street);
		prepStmt.setString(5, city);
		prepStmt.setString(6, zipCode);
		prepStmt.setString(7, country);
		prepStmt.setString(8, state);
		prepStmt.setString(9, username);
		prepStmt.setString(10, email);
		prepStmt.setString(11, password);
		
		
		prepStmt.executeUpdate();
		prepStmt.close();
	%>
			<% 
			//close the connection.
			db.closeConnection(con);
			response.sendRedirect("HomePage.jsp");
			%>
		

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
</body>
</html>
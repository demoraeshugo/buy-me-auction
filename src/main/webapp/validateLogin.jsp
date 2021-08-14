<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String str = "SELECT * from accounts";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		
		String u,p;
		int flag = 0;
		while (result.next()) {
			u = result.getString(9);
			p = result.getString(11);
			
			if(u.equals(username) && p.equals(password)){
				response.sendRedirect("HomePage.jsp");
				flag = 1;
				break;
			}
			
		}
		if(flag == 0) {
			out.println("<div class = 'errMsgLogin'> The username or password entered is incorrect, " + "<a href='LoginPortal.jsp'> please try again</a> </div>"  );
		}
	%>
		
	
			<% 
			//close the connection.
			db.closeConnection(con);
			%>
		

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
</body>
</html>
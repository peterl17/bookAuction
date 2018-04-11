<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>
</head>
<body>
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			
			String usernameR = request.getParameter("usernameR");
			String passwordR = request.getParameter("passwordR");
			String address = request.getParameter("addressR");
			String email = request.getParameter("emailR");
			String CCN = request.getParameter("CCR");
			String CVV = request.getParameter("CVVR");
			/**
			String insert = "insert into account ";
			String values = "values (" + usernameR + "," + passwordR + "," + address + ","+ email + "," + CCN + "," + CVV + ")";
			
			String valuesStatement = insert + values;
			stmt.executeUpdate(valuesStatement);
			
			*/
			String queryString = "INSERT INTO account(username,password,address,email,creditCard,CVV)VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(queryString);
			ps.setString(1, usernameR);
			ps.setString(2, passwordR);
			ps.setString(3, address);
			ps.setString(4, email);
			ps.setString(5, CCN);
			ps.setString(6, CVV);
			ps.executeUpdate();
			
			out.println("account registered");
			%>
		<a href = "index.jsp"> click here to go back to index page </a>

			<%
			
			//close the connection
			con.close();

			//notify the user that the update succeeded.
			out.print("Update succeeded");

		} catch (Exception ex) {
			out.print(ex.getMessage());
		}
	%>
</body>
</html>
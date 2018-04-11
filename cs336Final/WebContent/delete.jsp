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


			String UN = (String)session.getAttribute("user");
			String PW =(String)session.getAttribute("pass");
			
			/**
			String insert = "insert into account ";
			String values = "values (" + usernameR + "," + passwordR + "," + address + ","+ email + "," + CCN + "," + CVV + ")";
			
			String valuesStatement = insert + values;
			stmt.executeUpdate(valuesStatement);
			
			*/
			
			//delete current account
			String deleteQuery = "delete from account where password = ? and username = ?;" ;
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			ps.setString(1, UN);
			ps.setString(2, PW);
			ps.executeUpdate();
			out.println("account deleted");
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
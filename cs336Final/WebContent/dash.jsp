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

			%>
			<form method = "POST" action ="delete.jsp">
			<input type="submit" value="Delete My Account">
			</form>
			<br>
			<h2> Search for book by: </h2>
<div  style= "float: left">
	<form method="post" action="search.jsp">
	
		<table>
			<tr>
				<td>isbn</td>
				<td><input type="text" name="isbnS"></td>
			</tr>

			<tr>
				<td>author</td>
				<td><input type="text" name="authorS"></td>
			</tr>

			<tr>
				<td>title</td>
				<td><input type="text" name="titleS"></td>
			</tr>

			<tr>
				<td>Year</td>
				<td><input type="text" name="yearS"></td>
			</tr>

			<tr>
				<td>"paper" or "hardcover"</td>
				<td><input type="checkbox" name="paper_hardcoverS" value = "paper"></td>
				<td><input type="checkbox" name="paper_hardcoverS" value = "hardcover"></td>
			</tr>
			
		</table>
		<br> <input type="submit" value="submit">
	</form>
</div>
	<% 

			/**
			String insert = "insert into account ";
			String values = "values (" + usernameR + "," + passwordR + "," + address + ","+ email + "," + CCN + "," + CVV + ")";
			
			String valuesStatement = insert + values;
			stmt.executeUpdate(valuesStatement);
			
			
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
			*/
			%>

	<div style="float: left; clear: right;">
	<input type="submit" value = "List an item for Auction" onclick="window.location='list.jsp';"/>
	</div>
	<br>
	<a href = "index.jsp" > click here to go back to index page </a>
	<%
		//close the connection
			con.close();

		} catch (Exception ex) {
			out.print(ex.getMessage());
		}
	%>
</body>
</html>
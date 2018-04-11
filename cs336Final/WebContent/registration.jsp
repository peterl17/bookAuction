<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1> Registration Page </h1>
<br>
	<form method="post" action="register.jsp">
	<table>
	<tr>    
	<td>User name</td><td><input type="text" name="usernameR"></td>
	</tr>
	
	<tr>
	<td>Password</td><td><input type="text" name="passwordR"></td>
	</tr>
	
	<tr>
	<td>Address</td><td><input type="text" name="addressR"></td>
	</tr>
	
	<tr>
	<td>Email</td><td><input type="text" name="emailR"></td>
	</tr>
	
	<tr>
	<td>Credit Card Number </td><td><input type="text" name="CCR"></td>
	</tr>
	
	<tr>
	<td>CVV</td><td><input type="text" name="CVVR"></td>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
<br>

</body>
</html>
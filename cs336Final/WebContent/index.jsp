<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log-in</title>
</head>
<body>

<% out.println("Log in page \n"); %> <!-- output the same thing, but using 
                                      jsp programming -->	
                                      	  
<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field
<form method="post" action="show.jsp">
    <!-- note the show.jsp will be invoked when the choice is made 
	<!-- The next lines give HTML for radio buttons being displayed 
  <input type="radio" name="command" value="beers"/>Let's have a beer!
  <br>
  <input type="radio" name="command" value="bars"/>Let's go to a bar!
    <!-- when the radio for bars is chosen, then 'command' will have value 
     | 'bars', in the show.jsp file, when you access request.parameters
  <br>
  <input type="submit" value="submit" />
</form>
<br>
-->
 
<br>
	<form method="post" action="login.jsp">
	<table>
	<tr>    
	<td>User name</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
<br>
<a href ="registration.jsp"> Click here for registration page </a>

<!-- 
Or we can query the beers with price:
<br>
	<form method="post" action="query.jsp">
		<select name="price" size=1>
			<option value="3.0">$3.0 and under</option>
			<option value="5.0">$5.0 and under</option>
			<option value="8.0">$8.0 and under</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>
 -->
</body>
</html>
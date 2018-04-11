<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String enteredU = "'" +request.getParameter("username") + "'";
		String enteredP = "'" +request.getParameter("password")+"'";
//		String pass = "empty", user = "empty";
		String str = "select exists(select * from account where (username = "+enteredU+") AND (password ="+enteredP+"))";
		
		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);

		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		boolean resultBool = result.getBoolean(1);
		
		if (resultBool){
			out.println("Correct Log in Information");
			session.setAttribute("user", request.getParameter("username"));
			session.setAttribute("pass", request.getParameter("password"));
			response.sendRedirect("dash.jsp");
		}
		else{
			out.println("Incorrect Log in inforamtion");
			%>
			<a href = "registration.jsp"> click here to go back to registration page </a>
			<%
		}
		
/**
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO sells(bar, beer, price)"
				+ "VALUES (?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newBar);
		ps.setString(2, newBeer);
		ps.setFloat(3, price);
		//Run the query against the DB
		ps.executeUpdate();

		//Check counts once again (the same as the above)
		str = "SELECT COUNT(*) as cnt FROM beers";
		result = stmt.executeQuery(str);
		result.next();
		System.out.println("Here I am!");
		int countBeersN = result.getInt("cnt");
		System.out.println(countBeersN);
		str = "SELECT COUNT(*) as cnt FROM bars";
		result = stmt.executeQuery(str);
		result.next();
		int countBarsN = result.getInt("cnt");
*/
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		//Compare counts of the beers and bars before INSERT on Sells and after to figure out whether there is a bar and a beer stub records inserted by a trigger. 
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>
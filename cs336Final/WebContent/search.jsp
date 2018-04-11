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
			
			String isbn = request.getParameter("isbnS");
			String author = request.getParameter("authorS");
			
			String title = request.getParameter("titleS");
			String year = request.getParameter("yearS");
			String paper_hardcover = request.getParameter("paper_hardcoverS");
			//out.println(isbn + author + title + year + paper_hardcover);
			int searchCounter = 0; //number of search parameters left
			boolean hit[] = new boolean[5];
			String searchQuery = "Select * from Book where ";
			
			//the most inefficient code seen to man
			if (isbn.length()>0) {
				searchCounter++;
				hit[0] = true;
			}
			if (author.length()>0) {
				searchCounter++;
				hit[1] = true;
			}
			if (title.length()>0) {
				searchCounter++;
				hit[2] = true;
			}
			if (year.length()>0) {
				searchCounter++;
				hit[3] = true;
			}
			
			if (paper_hardcover != null) {
				searchCounter++;
				hit[4] = true;
			}

			if (isbn.length()>0) {
				searchQuery += "isbn = ? ";
				searchCounter--;
				if (searchCounter > 0)
					searchQuery += "OR ";
			}
			if (author.length()>0) {
				searchQuery += "author = ? ";
				searchCounter--;
				if (searchCounter > 0)
					searchQuery += "OR ";
			}
			if (title.length()>0) {
				searchQuery += "title = ? ";
				searchCounter--;
				if (searchCounter > 0)
					searchQuery += "OR ";
			}
			if (year.length()>0) {
				searchQuery += "year = ? ";
				searchCounter--;
				if (searchCounter > 0)
					searchQuery += "OR ";
			}
			if (paper_hardcover != null) {
				searchQuery += "paper_hardcover = ? ";
				searchCounter--;
			}

			PreparedStatement ps = con.prepareStatement(searchQuery);
			boolean notEmpty = false; //see if no search parameters have been put
			for (int i = 0; i < 5; i++) {
				if (hit[i] == true) {
					notEmpty = true;
					switch (i) {
					case 0:
						ps.setString(1, isbn);
						break;
					case 1:
						ps.setString(2, author);
						break;
					case 2:
						ps.setString(3, title);
						break;
					case 3:
						ps.setString(4, year);
						break;
					case 4:
						ps.setString(5, paper_hardcover);
						break;
					}
				}
			}
			if(notEmpty){
				ResultSet rs = ps.executeQuery();
				int resultsCounter = 0;
				while(rs.next()){
					resultsCounter ++;
					
					out.println(resultsCounter + ". " + "  isbn: " + rs.getInt(1) + " author " + rs.getString(2) + " title " + rs.getString(3)
						+ " year " + rs.getString(4) + " Paper or Hardcover " + rs.getString(5));
				}
			}
			else out.println("You didn't enter any information, silly!!!");
			/**
			String insert = "insert into account ";
			String values = "values (" + usernameR + "," + passwordR + "," + address + ","+ email + "," + CCN + "," + CVV + ")";
			
			String valuesStatement = insert + values;
			stmt.executeUpdate(valuesStatement);
			
			*/
	%>
			<br>
			<a href = "index.jsp"> click here to go back to index page </a>

			<%
			
			//close the connection
			con.close();

		} catch (Exception ex) {
			out.print(ex.getMessage());
		}
	%>
</body>
</html>
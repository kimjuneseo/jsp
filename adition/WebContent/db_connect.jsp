<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try{
			Class.forName("oracle.jdbc.OracleDriver?");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT systemdate from dual");
			while(rs.next()){
				out.println("Today date :"+ rs.getString(1) + "<br>");
				
			}
			stmt.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	
</body>
</html>
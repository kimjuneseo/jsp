<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		String sql = "";
		pstmt = conn.prepareStatement(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
		
	%>

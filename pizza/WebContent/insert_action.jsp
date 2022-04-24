<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("utf-8");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "insert into TBL_SALELIST_01 values(?,?,?,?,?)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(request.getParameter("num")));
		pstmt.setString(2, request.getParameter("code"));
		pstmt.setString(3, request.getParameter("date"));
		pstmt.setString(4, request.getParameter("pcode"));
		pstmt.setInt(5, Integer.parseInt(request.getParameter("cnt")));
		rs = pstmt.executeQuery();
	}catch(Exception ex){
		ex.printStackTrace();
	}
	response.sendRedirect("select.jsp"); 
%>
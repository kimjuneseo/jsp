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
		String sql = "insert into sale_tbl_002 values(?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("num"));
		pstmt.setString(2, request.getParameter("date"));
		pstmt.setString(3, request.getParameter("sale"));
		pstmt.setString(4, request.getParameter("shop"));
		pstmt.setString(5, request.getParameter("product"));
		pstmt.setInt(6, Integer.parseInt(request.getParameter("cnt")));
		pstmt.setString(7, request.getParameter("cash"));
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("select2.jsp");
%>
	<script>alert("매출이 정상적으로 저장되었습니다.");</script>
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
		String sql = "insert into goods_tbl_002 values(?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("code"));
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setInt(3, Integer.parseInt(request.getParameter("co1")));
		pstmt.setInt(4, Integer.parseInt(request.getParameter("co2")));
		pstmt.setString(5, request.getParameter("date"));
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("select.jsp");
%>
	<script>alert("매출이 정상적으로 저장되었습니다.");</script>
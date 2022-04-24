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
		String sql = "update GOODS_TBL_002 set goods_nm=? ,goods_price=? ,cost=? where goods_cd =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setInt(2, Integer.parseInt(request.getParameter("co1")));
		pstmt.setInt(3, Integer.parseInt(request.getParameter("co2")));
		pstmt.setString(4, request.getParameter("code"));
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("select.jsp");
%>

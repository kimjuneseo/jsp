<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	ResultSet rs = null;
	PreparedStatement psmt = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		String sql  = "update goods_tbl_003 set goods_nm=?,goods_price =?, cost = ? where goods_cd =?";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, request.getParameter("name"));
		psmt.setInt(2, Integer.parseInt(request.getParameter("co1")));
		psmt.setInt(3, Integer.parseInt(request.getParameter("co2")));
		psmt.setString(4, request.getParameter("goods_cd"));
		
		
		 psmt.executeUpdate();	
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("select.jsp");

%>
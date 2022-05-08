<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("utf-8");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "INSERT INTO TBL_VACCRESV_202108 VALUES(?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("num"));
		pstmt.setString(2, request.getParameter("jumin"));
		pstmt.setString(3, request.getParameter("b_code"));
		pstmt.setString(4, request.getParameter("h_code"));
		pstmt.setString(5, request.getParameter("date"));
		pstmt.setString(6, request.getParameter("time"));
		
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("select.jsp");
%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	
	String b_1 = request.getParameter("b_1");
	String b_2 = request.getParameter("b_2");
	String b_3 = request.getParameter("b_3");
	String b = b_1 + b_2 + b_3;
	String sex = request.getParameter("sex");
	String ten = request.getParameter("ten");
	String so = request.getParameter("so");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		Connection conn = DriverManager.getConnection(url, "system", "1234");
		String sql = "insert into tbl_artist_201905 values(?,?,?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, num);
		pstm.setString(2, name);
		pstm.setString(3, b);
		pstm.setString(4, sex);
		pstm.setString(5, ten);
		pstm.setString(6, so);
		int result = pstm.executeUpdate();
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	
	response.sendRedirect("memberList.jsp"); 
%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String select = request.getParameter("select");
	String sql = "insert into performance_tbl_202204 values(?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	
	String date =  request.getParameter("date").replace("-", "");
	pstmt.setInt(1, Integer.parseInt(request.getParameter("num")));
	pstmt.setString(2, date);
	pstmt.setString(3, request.getParameter("fg"));
	pstmt.setInt(4, Integer.parseInt(request.getParameter("co")));
	pstmt.setString(5, request.getParameter("de_no"));
 
	rs = pstmt.executeQuery();
} catch (Exception e) {

	e.printStackTrace();
}
%>
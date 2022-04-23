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
		String sql = "insert into sale_tbl_003 values(?,?,?,?,?,?,?)";
		
		psmt = con.prepareStatement(sql);
		psmt.setString(1, request.getParameter("num"));
		psmt.setString(2, request.getParameter("date"));
		psmt.setString(3, request.getParameter("tf"));
		psmt.setString(4, request.getParameter("shop"));
		psmt.setString(5, request.getParameter("product"));
		psmt.setInt(6, Integer.parseInt(request.getParameter("cnt")));
		psmt.setString(7, request.getParameter("cash"));
		rs = psmt.executeQuery();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%
if(rs.next()){
	
%>	
	<script>
		alert("매출이 정상적으로 저장되었습니다.");
	</script>
<%
}
response.sendRedirect("select.jsp");
%>

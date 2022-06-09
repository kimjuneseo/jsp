<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./common.css">
</head>
<body>
	<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("utf-8");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select p_id, c_name,c_email, c_tel from custom_01";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<div class="container">
	<h2 class="title">회원목록조회</h2>
	<table border="1px solid #000" >
		<tr>
			<td>회원아이디</td>
			<td>회원이름</td>
			<td>이메일</td>
			<td>연락처</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
		</tr>
		<%} %>
	</table>
	<footer>HRDKOREA Copyrigth.©2015 All right reserved. Human Resiurces Develpment Service of Koear</footer>
	</div>
</body>
</html>
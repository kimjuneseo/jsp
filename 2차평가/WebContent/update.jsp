<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String sql = "select id, name, substr(jumin,1,6) || '-' ||substr(jumin,7,9),to_char(indate,'YYYY-MM-DD'),grade from MEM_TBL_202205 where id = ?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	int id = Integer.parseInt(request.getParameter("id"));
	psmt.setInt(1, id);
	ResultSet rs = psmt.executeQuery();
	rs.next();	
%>
<%@include file="header.jsp"%>

<section>
	<h2 class="title">회원목록수정</h2>
	<form action="update_action.jsp" method="post">
	<table border="1">
			<tr>
				<td>회원아이디</td>	
				<td><input type="number" value="<%=id%>" name="id"readonly></td>	
			</tr>
			<tr>
				<td>회원성명</td>	
				<td><input type="text" value="<%=rs.getString(2)%>" name="name"></td>	
			</tr>
			<tr>
				<td>주민번호</td>	
				<td><input type="text" value="<%=rs.getString(3)%>" name="jumin"></td>	
			</tr>
			<tr>
				<td>가입일자</td>	
				<td><input type="date" value="<%=rs.getString(4)%>" name="date"></td>	
			</tr>
			<tr>
				<td>정기회원여부[0:정기, 1:비정기]</td>	
				<td><input type="text" value="<%=rs.getString(5)%>" name="g"></td>	
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">수정</button>
					<button type="button"><a href="select1.jsp">조회</a></button>
				</td>	
			</tr>
	</table>
	</form>
</section>
<%@include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp"%>
<%
	String sql = "select id, name, decode(substr(jumin,7,1), '1','남','3','남','2','여','4','여'), substr(jumin,1,6) || '-' ||substr(jumin,7,1) || '******',to_char(indate,'YYYY-MM-DD'), decode(grade,'0','정기','1','비정기') from MEM_TBL_202205 order by id";
	PreparedStatement psmt = conn.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
%>
<%@include file="header.jsp"%>

<section>
	<h2 class="title">회원목록조회/수정</h2>
	<table border="1">
		<tr>
			<td>회원아이디</td>
			<td>회원성명</td>
			<td>성별</td>
			<td>주민등록번호</td>
			<td>가입일자</td>
			<td>정기구분</td>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr>
			<td><a href="update.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<%@include file="footer.jsp"%>
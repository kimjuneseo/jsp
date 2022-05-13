<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp"%>
<%
	String sql = "select id, name, gr, aa||'일 출석' from( select id, name, decode(grade,'0','정기','1','비정기') gr, (select count(*) from ATT_TBL_202205 where att_id = id) aa from MEM_TBL_202205 natural join ATT_TBL_202205  group by id, name, grade order by id) where aa != 0";
	PreparedStatement psmt = conn.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
%>
<%@include file="header.jsp"%>

<section>
	<h2 class="title">출석현황조회</h2>
	<table border="1">
		<tr>
			<td>회원아이디</td>
			<td>회원성명</td>
			<td>성별</td>
			<td>정기구분</td>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<%@include file="footer.jsp"%>
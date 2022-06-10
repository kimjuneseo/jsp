<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/header.jsp" %>
<%@include file="/db_connect.jsp" %>
<%
	String sql = "select ENTRY_ID,ENTRY_NAME, substr(ENTRY_BIRTH,1,4) || '-' || substr(ENTRY_BIRTH, 5,2) || '-' || substr(ENTRY_BIRTH,7,8), decode(ENTRY_GENDER, 'M', '남자','F', '여자'), decode(TALENT, '1','보컬', '2','댄스','3','랩'),NATIVE from TBL_ENTRY_202104";
	PreparedStatement psmt = con.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
%>
<section>
	<h2 class="title">참가자 점수 조회</h2>
	<table>
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>특기</td>
			<td>출신지역</td>
		</tr>
		<%while(rs.next()){ %>
			<tr>
				<td><a href="update.jsp?num=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
			</tr>
		<%} %>
	</table>
</section>
<%@include file="/footer.jsp" %>
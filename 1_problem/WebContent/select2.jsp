<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/header.jsp" %>
<%@include file="/db_connect.jsp" %>
<%
	String sql = "select score_no, ENTRY_ID,ENTRY_NAME, substr(ENTRY_BIRTH,1,4) || '월' || substr(ENTRY_BIRTH, 5,2) || '일' || substr(ENTRY_BIRTH,7,8), decode(SCORE_FG, '1', '일반인 평가', '2','전문가평가'),score, case when score >= 90 then 'A' when score >= 80 then 'B' when score >= 70 then 'C' else 'D' end from tbl_score_202104 natural join TBL_ENTRY_202104";
	PreparedStatement psmt = con.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
%>
<section>
	<h2 class="title">참가자 점수 조회</h2>
	<table>
		<tr>
			<td>참가번호</td>
			<td>참가자번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>평가구분</td>
			<td>평가점수</td>
			<td>평가등급</td>
		</tr>
		<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
			</tr>
		<%} %>
	</table>
</section>
<%@include file="/footer.jsp" %>
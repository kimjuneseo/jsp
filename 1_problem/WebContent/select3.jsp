<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/header.jsp" %>
<%@include file="/db_connect.jsp" %>
<%
	String sql = "select ENTRY_ID,ENTRY_NAME,sum_score,ROUND(sum_score/2,1 ),rank() over(order by sum_score desc) from(  select ENTRY_ID,ENTRY_NAME,sum(score) sum_score from tbl_score_202104 natural join TBL_ENTRY_202104 group by ENTRY_ID,ENTRY_NAME)";
	PreparedStatement psmt = con.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
%>
<section>
	<h2 class="title">참가자 점수 조회</h2>
	<table>
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
		<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
			</tr>
		<%} %>
	</table>
</section>
<%@include file="/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%
	ResultSet rs = null;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	Connection conn = DriverManager.getConnection(url, "system", "1234");
	String sql = "select artist_id, artist_name, SUBSTR(artist_birth, 1,4)||'년'||SUBSTR(artist_birth, 5, 2)||'월'||SUBSTR(artist_birth, 7,2)||'일' artist_birth ,decode(ARTIST_GENDER, 'M', '남자','F','여자'), decode(talent, '1','보컬','2','댄스','3','랩'),agency from tbl_artist_201905 order by artist_id asc";
	PreparedStatement stmt = conn.prepareStatement(sql);
	rs = stmt.executeQuery();
} catch (Exception ex) {
	ex.printStackTrace();
}
%>
<section id="memberList">
	<h2 class="memberList_title">참가자목록조회</h2>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>특기</td>
			<td>소속사</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<%@ include file="./footer.jsp"%>
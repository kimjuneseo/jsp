<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./header.jsp" %>

	
<section id="rank">
	<p class="rankTitle">참가자 등수 조회</p>
	<table border="1px">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
	<% 
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		Connection conn = DriverManager.getConnection(url,"system", "1234");
		String sql = "select ta.artist_id, artist_name, sum(point) sum_p, round(avg(point), 2) avg_p,rank() over(order by avg(point) desc) r_num from tbl_artist_201905 ta, tbl_point_201905 tp where ta.artist_id = tp.artist_id group by ta.artist_id, artist_name order by sum_p desc";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt .executeQuery();
		while(rs.next()){
	%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
	<% 
			
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}
%>
	</table>
</section>
<%@ include file = "./footer.jsp" %>
</body>
</html>
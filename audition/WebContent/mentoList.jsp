<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./header.jsp" %>

<section id="memtoList">
	<p class="mentoTitle">멘토점수조회</p>
	<table border="1px">
		<tr>
			<td>체점번호</td>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>점수</td>
			<td>평점</td>
			<td>멘토</td>
		</tr>
		<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
                String url = "jdbc:oracle:thin:@//localhost:1521/xe";
                Connection conn = DriverManager.getConnection(url, "system", "1234");
				
				String sql = "select SERIAL_NO, ta.artist_id, artist_name,"+
					 	" substr(artist_birth, 1,4) || '년' ||"+
					 	" substr(artist_birth, 5,2) || '월' ||"+
					 	" substr(artist_birth, 7,2) || '일' as artist_birth,"+
					 	" point,"+
					 	" case when point >= 90 then 'A'"+
					 	  " when point >= 80 then 'B'"+
					 	  " when point >= 70 then 'C'"+
					 	" else 'E'"+
					 	" end as grade,"+
					 	" mento_name "+
					 " from TBL_POINT_201905 tp, tbl_artist_201905 ta,tbl_mento_201905 tm"+
					 " where tp.artist_id = ta.artist_id"+
					 " and  tp.mento_id = tm.mento_id"+
					 " order by serial_no ";
				PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();  
			
				while(rs.next()){
		%>
				
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
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

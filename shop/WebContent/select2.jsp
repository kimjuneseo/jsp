<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
request.setCharacterEncoding("utf-8");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "insert into goods_tbl_003 values(?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<section id="select2">
	<h3 class="title">점포별매출현황</h3>
	<table>
		<tr>
			<td>점포명</td>
			<td>현금매출</td>
			<td>카드매출</td>
			<td>총매출</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs. %></td>
		</tr>
		<%} %>
	</table>
</section>
<%@include file="footer.jsp"%>
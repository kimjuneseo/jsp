<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
	ResultSet rs = null;
		PreparedStatement pstmt = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select goods_cd,goods_nm, to_char(goods_price,'l999,999,999') || '원', to_char(cost,'l999,999,999') || '원', to_char(in_date,'YYYY-mm-dd') from goods_tbl_002 order by goods_cd";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<section id="select">
	<h4 class="title">상품관리</h4>
	<table border="1px">
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
			<td>단가</td>
			<td>원가</td>
			<td>입고일자</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><a href="update.jsp?name=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5" style="text-align: center;"><button type="button"><a href="insert2.jsp">등록</a></button></td>
		</tr>
	</table>
</section>
<%@include file="footer.jsp"%>
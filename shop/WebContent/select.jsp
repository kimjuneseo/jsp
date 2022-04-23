<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "header.jsp"%>
<%
	ResultSet rs = null;
	PreparedStatement psmt = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql  = "select goods_cd, goods_nm, to_char(goods_price, 'l999,999,999'),to_char(cost, 'l999,999,999'), to_char(in_date, 'YYYY-dd-mm') from goods_tbl_003 order by goods_cd";
		psmt = con.prepareStatement(sql);
		rs = psmt.executeQuery();	
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<section id="select">

	<table border="1px">
		<tr style="text-align: center;">
			<td>상품코드</td>
			<td>상품명</td>
			<td>단가</td>
			<td style="width: 150px;">원가</td>
			<td>입고일자</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><a href="update.jsp?goods_cd=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td style="text-align: right;"><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>		
		<%} %>
		<tr >
			<td style="text-align: center;" colspan="5"><button type="submit"><a href="insert2.jsp">등록</a></button></td>
		</tr>
	</table>
</section>
<%@include file = "footer.jsp"%>
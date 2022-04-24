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
		String sql = "select store_nm, to_char(sum(cash), '999,999,999')|| '원', to_char(sum(card), '999,999,999') || '원',to_char(sum(cash+card), '999,999,999')|| '원' from (  select store_nm, goods_price * sale_cnt cash, 0 card from STORE_TBL_003 natural join goods_tbl_003 natural join sale_tbl_003 where pay_type = '01' union  select store_nm, 0 cash, sum(goods_price * sale_cnt) card from STORE_TBL_003 natural join goods_tbl_003 natural join sale_tbl_003 where pay_type = '02' group by store_nm ) group by store_nm order by  sum(card) desc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<section id="select2">
	<h3 class="title">점포별매출현황</h3>
	<table border="1px">
		<tr>
			<td>점포명</td>
			<td>현금매출</td>
			<td>카드매출</td>
			<td>총매출</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><a href="more_select.jsp?name=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
		</tr>
		<%} %>
	</table>
</section>
<%@include file="footer.jsp"%>
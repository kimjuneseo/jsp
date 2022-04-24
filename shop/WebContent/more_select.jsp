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
		String sql = "select decode(sa.sale_fg, '1', '판매', '2','판매취소'), sa.sale_no, to_char(sa.sale_ymd, 'YYYY-mm-dd'), gt.goods_nm,sa.sale_cnt, sa.sale_cnt * gt.goods_price || '원', decode(pay_type, '01', '현금', '02', '카드') from SALE_TBL_003 sa natural join goods_tbl_003 gt natural join store_tbl_003 st where st.store_nm =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));	
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<section id="more_select">
	<table border="1px">
		<tr>
			<td>판매구분</td>
			<td>판매번호</td>
			<td>판매일자</td>
			<td>상품명</td>
			<td>판매수량</td>
			<td>판매금액</td>
			<td>수취구분</td>
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
<%@include file ="footer.jsp"%>
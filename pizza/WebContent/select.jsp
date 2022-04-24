<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
	ResultSet rs = null;
PreparedStatement pstmt = null;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String sql = "select saleno, scode|| '-' || sname, to_char(saledate, 'YYYY-dd-mm'), st.pcode,pname,amount, to_char(amount*cost, 'l999,999,999') from TBL_SALELIST_01 st natural join TBL_SHOP_01 spt join TBL_PIZZA_01 pt on pt.pcode = st.pcode";

	pstmt = con.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
} catch (Exception ex) {
	ex.printStackTrace();
}
%>
<section id="select">
	<table border="1px">
		<tr style="text-align: center">
			<td>매출전표번호</td>
			<td>지점</td>
			<td>판매일자</td>
			<td>피자코드</td>
			<td>피자명</td>
			<td>판매수량</td>
			<td>매출액</td>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr style="text-align: center">
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<%@include file="footer.jsp"%>
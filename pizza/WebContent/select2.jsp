<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
	ResultSet rs = null;
PreparedStatement pstmt = null;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String sql = "select scode, sname,to_char(sum(ac), 'l999,999,999') sc from( select scode,amount*cost ac, sname from TBL_SALELIST_01 st natural join TBL_SHOP_01 join TBL_PIZZA_01 pt on pt.pcode = st.pcode ) where sname = sname group by sname,scode order by scode";

	pstmt = con.prepareStatement(sql);

	rs = pstmt.executeQuery();
} catch (Exception ex) {
	ex.printStackTrace();
}
%>
<section id="select2">
	<table border="1px">
		<tr>
			<td>지점 코드</td>
			<td>지점 명</td>
			<td>총매출액</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<%@include file="footer.jsp"%>

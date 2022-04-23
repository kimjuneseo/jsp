<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
ResultSet rs = null;
PreparedStatement psmt = null;
String goods_cd = "";
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	goods_cd = request.getParameter("goods_cd");
	String sql = "select goods_cd, goods_nm, goods_price,cost, to_char(in_date,'YYYY-dd-mm')from goods_tbl_003 where goods_cd = ?";

	psmt = con.prepareStatement(sql);
	psmt.setString(1, goods_cd);

	rs = psmt.executeQuery();
	rs.next();
} catch (Exception e) {
	e.printStackTrace();
}
%>
<section id="update">
	<form action="update_action.jsp" method="post">

		<table border="1px">
			<tr>

				<td>상품코드(변경불가)</td>
				<td><input type="text" readonly value="<%=rs.getString(1)%>" name="goods_cd"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" value="<%=rs.getString(2)%>" name="name"></td>
			</tr>
			<tr>
				<td>단가</td>
				<td><input type="number"  value="<%=rs.getString(3)%>" name="co1"></td>
			</tr>
			<tr>
				<td>원가</td>
				<td><input type="number"  value="<%=rs.getString(4)%>" name="co2"></td>
			</tr>
			<tr>
				<td>입고일자(변경불가)</td>
				<td><input type="text" readonly value="<%=rs.getString(5)%>"></td>
			</tr>
			<tr>
				<center>
					<td colspan="2">
						<button type="submit">저장</button>
						<button type="button">
							<a href="select.jsp">상품목록</a>
						</button>
					</td>
				</center>
			</tr>
		</table>
	</form>
</section>
<%@include file="footer.jsp"%>
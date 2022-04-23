<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
ResultSet rs = null;
PreparedStatement psmt = null;

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String sql = "select to_char(sysdate, 'YYYY-mm-dd'), max(goods_cd) +1 from GOODS_TBL_003";
	
	psmt = con.prepareStatement(sql);
	
	rs = psmt.executeQuery();
	rs.next();
} catch (Exception e) {
	e.printStackTrace();
}
%>
<section id="insert2">
	<form action="insert2_action.jsp" method="post">

		<table border="1px">
			<tr>

				<td>상품코드(변경불가)</td>
				<td><input type="text" readonly value="<%=rs.getString(2)%>" name="goods_cd"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>단가</td>
				<td><input type="number"  name="co1"></td>
			</tr>
			<tr>
				<td>원가</td>
				<td><input type="number"  name="co2"></td>
			</tr>
			<tr>
				<td>입고일자(변경불가)</td>
				<td><input type="text" name="date" value="<%=rs.getString(1)%>" readonly ></td>
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
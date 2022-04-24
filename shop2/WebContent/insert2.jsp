<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
	ResultSet rs = null;
PreparedStatement pstmt = null;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String sql = "select max(goods_cd)+1, to_char(sysdate, 'YYYY-mm-dd') from GOODS_TBL_002";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
} catch (Exception e) {

	e.printStackTrace();
}
%>
<section id="insert2">
	<h3 class="title">상품정보 등록</h3>
	<form action="insert_action2.jsp" method="post">
		<table border="1px">
			<tr>
				<td>상품코드(자동채번 )</td>
				<td><input type="text" value="<%=rs.getString(1)%>"
					name="code" readonly></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>단가</td>
				<td><input type="number" name="co1"></td>
			</tr>
			<tr>
				<td>원가</td>
				<td><input type="number" name="co2"></td>
			</tr>
			<tr>
				<td>입고일자(자동세팅)</td>
				<td><input type="text" value="<%=rs.getString(2)%>"
					name="date"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="submit">저장</button>
					<button type="button">
						<a href="select.jsp">상품목록</a>
					</button>
				</td>
			</tr>

		</table>
	</form>
</section>
<%@include file="footer.jsp"%>
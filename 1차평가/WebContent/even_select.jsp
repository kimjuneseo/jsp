<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String select = request.getParameter("select");
	String sql = "select to_char(add_months(sysdate,-1) ,'YYYYmmdd') || '매출실적' cd, decode(dept_no,'A00','경영관리팀','A01','영업1팀','A02','영업2팀'), sum(per_amt)  from performance_tbl_202204 natural join EMP_TBL_202204 where per_ymd between to_char(add_months(sysdate,-1) ,'YYYYmmdd')  and to_char(sysdate,'YYYYmmdd') group by decode(dept_no,'A00','경영관리팀','A01','영업1팀','A02','영업2팀')";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
} catch (Exception e) {

	e.printStackTrace();
}
%>
<section id="even_select">
	<h3 class="title">전원 부서별 실적</h3>
	<table border="1px">
		<tr>
			<td>구분</td>
			<td>부서명</td>
			<td>매출금액</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
		<%} %>
	</table>
</section>
<%@ include file="footer.jsp"%>
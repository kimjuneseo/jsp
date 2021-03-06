<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ResultSet rs = null;
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String sql = "select hc, hn,c from( select HOSPCODE hc, HOSPNAME hn, count(*)  c from tbl_hosp_202108 th natural join TBL_VACCRESV_202108 tv  group by HOSPCODE,HOSPNAME  union all select  ' ' hc, '총 누계' hn, count(*) c from tbl_hosp_202108 th natural join TBL_VACCRESV_202108 tv  ) order by hn asc";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
}catch(Exception e){
	e.printStackTrace();
}
%>
<%@ include file="header.jsp"%>
<section>
	<h2 class="title">병원별 접종건수 통계</h2>
	<table border="1px">
		<tr style="text-align: center">
			<td style="text-align: center">병원코드</td>
			<td style="text-align: center">병원명</td>
			<td style="text-align: center">접종건수</td>
		</tr>
		<%while(rs.next()){ %>
		<tr style="text-align: center">
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
		<%} %>
	</table>
</section>
<%@ include file="footer.jsp"%>
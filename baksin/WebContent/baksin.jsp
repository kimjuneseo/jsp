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
		request.setCharacterEncoding("utf-8");
		String sql = "select pname, jumin, decode(substr(jumin,8,1), '1', '남자','2','여자'), tel, substr(RESVDATE,1,4) || '년' || substr(RESVDATE,5,2) || '월' || substr(RESVDATE,7,2) || '일', substr(RESVTIME,1,2) || '-' || substr(RESVTIME,3,2), HOSPNAME,HOSPTEL,HOSPADDR, decode(VCODE,'V001','A백신','V002','B백신','V003','C백신') from tbl_jumin_201808 tj natural join TBL_VACCRESV_202108 tv join  tbl_hosp_202108 tp on tv.HOSPCODE = tp.HOSPCODE where RESVNO= ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("num"));
		rs = pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%@ include file="header.jsp" %>
<section>
<% if(rs.next()){ %>	
<h2 class="title">예약번호 : <%=request.getParameter("num") %>의 접종예약조회</h2>
<table border="1px">
<tr>
	<td>이름</td>
	<td>주민번호</td>
	<td>전화번호</td>
	<td>예약일자</td>
	<td>예약시간</td>
	<td>병원명</td>
	<td>대표전화</td>
	<td>병원주소</td>
	<td>백신종류</td>
</tr>
	<%do{ %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td><%=rs.getString(8) %></td>
			<td><%=rs.getString(9) %></td>
		</tr>
	<button style="margin: 0 auto; display: flex"><a style="text-align: center;" href="index.jsp">돌아가기</a></button>
	<%}while(rs.next()); %>

<%}else{ %>
	<h2 class="title">접종예약정보가 존재하지 않습니다!</h2>
	<button style="margin: 0 auto; display: flex"><a style="text-align: center;" href="index.jsp">돌아가기</a></button>
<%} %>
</table>
</section>
<%@ include file="footer.jsp" %>
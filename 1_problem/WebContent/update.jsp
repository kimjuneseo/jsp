<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/header.jsp" %>
<%@include file="/db_connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	
	String sql = "select * from TBL_ENTRY_202104 where ENTRY_ID = ?";
	PreparedStatement psmt = con.prepareStatement(sql);
	psmt.setString(1, num);
	
	ResultSet rs = psmt.executeQuery();
	rs.next();
%>
<style>
	td,tr{text-align: left;}
</style>
<section>
	<h2 class="title">참가자 수정</h2>
	<form action="update_action.jsp" method="post">
	<table style="text-align: left;">
		<tr >
			<td>참가번호</td>
			<td><input type="text" value="<%=rs.getString(1) %>" readonly="readonly" name="num"> * 참가번호는(A000)4자리입니다</td>
		</tr>
		<tr>
			<td>참가자명</td>
			<td><input type="text"value="<%=rs.getString(2) %>" name="name"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text"value="<%=rs.getString(3) %>" name="birth">숫자만입력(YYYYMMDD)</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" <%=rs.getString(4).equals("M") ? "checked": ""%> name="sex" value="M"> 남자
				<input type="radio" <%=rs.getString(4).equals("F") ? "checked":""%>  name="sex" value="F" > 여자
			</td>
		</tr>
			<tr>
			<td>특기</td>
			<td>
				<select name="tt" >
					<option value="">선택</option>
					<option <%=rs.getString(5).equals("1") ? "checked": "selected"%> value="1">보컬</option>
					<option <%=rs.getString(5).equals("2") ? "checked": "selected"%> value="2">댄스</option>
					<option <%=rs.getString(5).equals("3") ? "checked": "selected"%> value="3">랩</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>출신지역</td>
			<td><input type="text" value="<%=rs.getString(6) %>"name="add"></td>
		</tr>
		<tr>
			
			<td colspan="2" style="text-align: center;">
				<button type="submit" >참가자수정</button>
				<button type="button" ><a href="select1.jsp">목록조회</a></button>
			</td>
		</tr>
		
		
	</table>
	</form>
</section>

<%@include file="/footer.jsp" %>
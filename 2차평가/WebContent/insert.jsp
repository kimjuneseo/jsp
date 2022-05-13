<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String sql = "select max(id)+1 from MEM_TBL_202205";
	PreparedStatement psmt = conn.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
	rs.next();	
%>
<%@include file="header.jsp"%>

<section>
	<h2 class="title">독서실 회원 등록</h2>
	<form action="insert_action.jsp" name="insert_from" method="post" onsubmit="return formchk();">
	<table border="1">
			<tr>
				<td>회원아이디(자동발생)</td>	
				<td><input type="number" value="<%=rs.getString(1)%>" name="id" readonly></td>	
			</tr>
			<tr>
				<td>회원성명</td>	
				<td><input type="text"  name="name"></td>	
			</tr>
			<tr>
				<td>주민번호</td>	
				<td><input type="text" name="jumin"></td>	
			</tr>
			<tr>
				<td>가입일자</td>	
				<td><input type="date" name="date"></td>	
			</tr>
			<tr>
				<td>정기회원여부[0:정기, 1:비정기]</td>	
				<td><input type="text" name="g"></td>	
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">등록</button>
					<button type="button"><a href="select1.jsp">조회</a></button>
				</td>	
			</tr>
	</table>
	</form>
</section>
<script>
	let form = document.insert_from;
	function formchk() {
			if (!form[1].value) {
				alert("회원성명이 입력되지 않았습니다.")
				form[1].focus();
				return false;
			}
			else if (!form[2].value) {
				alert ("주민번호가 입력되지 않았습니다");
				form[2].focus();
				return false;
			}
			
			else if (!form[3].value) {
				alert ("가입일자가 입력되지 않았습니다");
				form[3].focus();
				return false;
			}
			else if (!form[4].value) {
				alert ("정기회원여부가 입력되지 않았습니다");
				form[4].focus();
				return false;
			}
		
	
		return true;
	};

</script>
<%@include file="footer.jsp"%>
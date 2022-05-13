<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
ResultSet rs = null;
PreparedStatement pstmt = null;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String select = request.getParameter("select");
	String sql = "";
	if (select.equals("num")) {
		sql = "select  lpad(max(per_no) +1,4,0), et.id, name from EMP_TBL_202204 et,performance_tbl_202204 where et.id =? group by et.id, name";
	} else {
		sql = "select  lpad(max(per_no) +1,4,0), et.id, name from EMP_TBL_202204 et,performance_tbl_202204 where et.jumin =? group by et.id, name";
	}
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("num_input"));
	rs = pstmt.executeQuery();
	rs.next();
} catch (Exception e) {

	e.printStackTrace();
}
%>
<section id="insert">

	<h3 class="title">사원실적등록</h3>
	<form method="post" action="insert_action.jsp"
		onsubmit="return formchk();" name="insert_from">
		<table border="1px">
			<tr>
				<td>실적발생일자</td>
				<td><input type="date" name="date"></td>
			</tr>
			<tr>
				<td>실적번호(자동채번)</td>
				<td><input type="number" value="<%=rs.getString(1)%>" readonly
					name="num"></td>
			</tr>
			<tr>
				<td>실적구분</td>
				<td><input type="radio" name="fg" value="1" checked>이익
					<input type="radio" name="fg" value="2">손실</td>
			</tr>
			<tr>
				<td>실적금액</td>
				<td><input type="number" name="co"></td>
			</tr>
			<tr>
				<td>사원번호</td>
				<td><input type="text" readonly value="<%=rs.getString(2)%>"
					name="de_no"></td>
			</tr>
			<tr>
				<td>사원명</td>
				<td><input type="text" readonly value="<%=rs.getString(3)%>"
					name="name"></td>
			</tr>

			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="submit">등록</button>
					<button type="button" onclick="resets();">다시쓰기</button>
				</td>
			</tr>

		</table>

	</form>
</section>
<script>
		let form = document.insert_from;
	function formchk() {
		try {
			if (!form[0].value) {
				form[0].focus();
				throw "실적발생일자를 입력하지 않았습니다."
			} else if (!form[4].value) {
				form[4].focus();
				throw "실적금액을 입력하지 않았습니다.";
			}
		} catch (e) {
			alert(e);
			return false;
		}

		return true;
	};
	function resets(){
		alert("정보를 지우고 처음부터 다시 입력합니다.");
		form.reset();
	}
</script>
<%@include file="footer.jsp"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%
	ResultSet rs = null;
 	PreparedStatement pstmt = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select lpad(seq_sale3.nextval,4,0) , to_char(sysdate, 'YYYY-mm-dd') from dual";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs.next();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<section id="insert">
	<h4 class="title">매출 등록</h4>
	<form action="insert_action.jsp" method="post"onsubmit="return formChk();" name="insert_form">
		<table border="1px">
			<tr>
				<td>판매번호(자동발생)</td>
				<td><input type="text" value="<%=rs.getString(1)%>" readonly name="num"></td>
			</tr>
			<tr>
				<td>판매일자(자동발생)</td>
				<td><input type="text" value="<%=rs.getString(2)%>" readonly name="date"></td>
			</tr>
			<tr>
				<td>판매구분</td>
				<td><select name="sale">
						<option value="">선택</option>
						<option value="1">판매</option>
						<option value="2">판매취소</option>
				</select></td>
			</tr>
			<tr>
				<td>판매점포</td>
				<td><select name="shop">
						<option value="">선택</option>
						<option value="A001">이태원점</option>
						<option value="A002">한남점</option>
						<option value="A003">도원점</option>
						<option value="B001">혜화점</option>
						<option value="C001">방배점</option>
						<option value="D001">사당점</option>
						<option value="D002">흑석점</option>
						<option value="E001">금호점</option>
				</select></td>
			</tr>
			<tr>
				<td>판매상품</td>
				<td><select name="product">
						<option value="">선택</option>
						<option value="110001">라면</option>
						<option value="110002">빵</option>
						<option value="110003">과자</option>
						<option value="110004">탄산음료</option>
						<option value="110005">삼각김밥</option>
						<option value="110006">초코릿</option>
						<option value="110007">우유</option>
				</select></td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="number" name="cnt"></td>
			</tr>
			<tr>
				<td>수취구분</td>
				<td>
				<select name="cash">
					<option value=""></option>
					<option value="01">현금</option>
					<option value="02">카드</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="submit">등록</button>
					<button type="button"><a href="select.jsp">조회</a></button>
				</td>
			</tr>

		</table>
	</form>
</section>
<script>
	function formChk(){
		const form = document.insert_form;
		try{
			if(!form[2].value){
				throw "판매구분를 입력하지 않았습니다.";
			}else if(!form[3].value){
				throw "판매점포를 입력하지 않았습니다.";
			}else if(!form[4].value){
				throw "판매상품를 입력하지 않았습니다.";
			}else if(!form[5].value){
				throw "판매수량를 입력하지 않았습니다.";
			}else if(!form[6].value){
				throw "수취구분를 입력하지 않았습니다.";
			}
		}catch (e) {
			alert(e);
			return false;
		}
		return true;
	}
</script>
<%@include file="footer.jsp"%>
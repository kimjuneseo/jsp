<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<section id="insert.jsp">
	<h3 class="title">실적등록 회원정보 조회</h3>
	<form action="insert.jsp" method="post"
		name="more_select_form" onsubmit="return formchk();">
		<table border="1px">
			<tr>
				<td><input type="number" name="num_input"></td>
				<td><select name="select">
						<option value="num">사번으로찾기</option>
						<option value="jumin">주민번호로찾기</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="sumbit">조회</button>
				</td>
			</tr>

		</table>
	</form>
</section>
<script>
	function formchk() {
		let form = document.more_select_form;
		try {
			if (form.select.value === 'num') {
				if (!form.num_input.value) {
					form.num_input.focus();
					throw "사번을(를) 입력하지 않았습니다!"
				} else if (form.num_input.value.length !== 5) {
					form.num_input.focus();
					throw "사번은 5자리 숫자로 입력해주세요;"
				}
			} else {
				if (form.select.value === 'jumin') {
					if (!form.num_input.value) {
						form.num_input.focus();
						throw "주민번호을(를) 입력하지 않았습니다!"
					} else if (form.num_input.value.length !== 13) {
						form.num_input.focus();
						throw "주민번호는 13자리 숫자로 입력해주세요;"
					}
				}
			}
		} catch (e) {
			alert(e);
			return false;
		}
		
		return true;
	};
</script>
<%@include file="footer.jsp"%>
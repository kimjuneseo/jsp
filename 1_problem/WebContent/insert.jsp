<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/header.jsp" %>
<%@include file="/db_connect.jsp" %>
<%
	String sql = "select ENTRY_ID,ENTRY_NAME, substr(ENTRY_BIRTH,1,4) || '-' || substr(ENTRY_BIRTH, 5,2) || '-' || substr(ENTRY_BIRTH,7,8), decode(ENTRY_GENDER, 'M', '남자','F', '여자'), decode(TALENT, '1','보컬', '2','댄스','3','랩'),NATIVE from TBL_ENTRY_202104";
	PreparedStatement psmt = con.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
%>
<style>
	td,tr{text-align: left;}
</style>
<section>
	<h2 class="title">참가자 등록</h2>
	<form action="insert_action.jsp" method="post" name="insert_form" onsubmit="return check();">
	<table style="text-align: left;">
		<tr >
			<td>참가번호</td>
			<td><input type="text" name="num"> * 참가번호는(A000)4자리입니다</td>
		</tr>
		<tr>
			<td>참가자명</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth">숫자만입력(YYYYMMDD)</td>
		</tr>
		<tr>
			<td>성별</td>
			<td >
				<input type="radio" name="sex" value="M" checked="checked"> 남자
				<input type="radio" name="sex" value="F"> 여자
			</td>
		</tr>
			<tr>
			<td>특기</td>
			<td>
				<select name="tt">
					<option value="">선택</option>
					<option value="1">보컬</option>
					<option value="2">댄스</option>
					<option value="3">랩</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>출신지역</td>
			<td><input type="text" name="add"></td>
		</tr>
		<tr>
			
			<td colspan="2" style="text-align: center;">
				<button type="submit" >참가자등록</button>
				<button type="button" onclick="reset_form()">다시쓰기</button>
			</td>
		</tr>
		
		
	</table>
	</form>
</section>
<script>
	let form = document.insert_form;
	function check(){
		try{
			if(!form[0].value){
				form[0].focus();
				throw "참가번호가 입력되지 않았습니다!";
			}else if(!form[1].value){
				form[1].focus();
				throw "참가자명가 입력되지 않았습니다!";
			}else if(!form[2].value){
				form[2].focus();
				throw "생년월일가 입력되지 않았습니다!";
			}else if(![...form.sex].some(e => e)){
				throw "성별이 선택되지 않았습니다.";
			}else if(!form.tt.value){
				form[5].focus();
				throw "특기가 선택되지 않았습니다!";
			}else if(!form[6].value){
				form[6].focus();
				throw "출신지역이 입력되지 않았습니다!";
			}
		}catch (e) {
			alert(e);
			return false;
		}
		return true;
	}
	function reset_form(){
		alert("처음부터 다시 입력합니다.");
		form.reset();
		form[0].focus();
	}
</script>
<%@include file="/footer.jsp" %>
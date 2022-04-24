<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<h3 class="title">매출전표등록</h3>
<form method="post" action="insert_action.jsp" name="insert_form" onsubmit="return formChk();">
<table border="1px">
	<tr>
		<td>매출전표번호</td>
		<td><input type="number" name="num"></td>
	</tr>
	<tr>
		<td>지점코드</td>
		<td><input type="text" name="code"></td>
	</tr>
	<tr>
		<td>판매일자</td>
		<td><input type="text" name="date"></td>
	</tr>
	<tr>
		<td>피자코드</td>
		<td><select name="pcode">
			<option value="">피자선택</option>
			<option value="AA01">[AA01]고르곤졸라피자</option>
			<option value="AA02">[AA02]치즈피자</option>
			<option value="AA03">[AA03]페퍼로니피자</option>
			<option value="AA04">[AA04]콤비네이션피자</option>
			<option value="AA05">[AA05]고구마피자</option>
			<option value="AA06">[AA06]포테이토피자</option>
			<option value="AA07">[AA07]불고기피자</option>
			<option value="AA08">[AA08]나폴리피자</option>
		</select></td>
	</tr>
	<tr>
		<td>판매수량</td>
		<td><input type="number" name="cnt"></td>
	</tr>
	<tr>
		<td>
			<button type="submit">전표등록</button>
			<button type="button" onclick="reset()">다시쓰기</button>
		</td>
	</tr>
</table>
</form>
<script>
function formChk(){
	const form = document.insert_form;
	try{
		if(!form[0].value){
			throw "매출전표번호가 입력되지 않았습니다!";
		}else if(!form[1].value){
			throw "지점코드가 입력되지 않았습니다!";
		}if(!form[2].value){
			throw "판매일자가 입력되지 않았습니다!";
		}if(!form[3].value){
			throw "피자코드가 입력되지 않았습니다!";
		}if(!form[4].value){
			throw "판매수량이 입력되지 않았습니다!";
		}
		
	}catch (e) {
		alert(e);
		return false;
	}
	return true;
};
</script>
<%@include file="footer.jsp"%>


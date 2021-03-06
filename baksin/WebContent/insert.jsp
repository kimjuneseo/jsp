<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp"%>
<section>
	<h2 class="title">백신접종예약</h2>
	<form action="insert_action.jsp" method="post" onsubmit="return fromChk();" name="insert_form">
		<table border="1px">
			<tr>
				<td style="text-align: center;">접종예약번호</td>
				<td><input type="text" name="num">예) 20210001</td>
			</tr>
			
			<tr>
				<td style="text-align: center;">주민번호</td>
				<td><input type="text" name="jumin">예) 710101-1000001</td>
			</tr>
			
			<tr>
				<td style="text-align: center;">백신코드</td>
				<td><input type="text" name="b_code">예) V001 ~  V003</td>
			</tr>
			
			<tr>
				<td style="text-align: center;">병원코드</td>
				<td><input type="text" name="h_code">예) H001</td>
			</tr>
			
			<tr>
				<td style="text-align: center;">예약일자</td>
				<td><input type="text" name="date">예) 20211231</td>
			</tr>
			
			<tr>
				<td style="text-align: center;">예약시간</td>
				<td><input type="text" name="time">예) 1230</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="submit">등록</button>
					<button type="button" onclick="reset()">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="footer.jsp"%>

<script>
	const form = document.insert_form;
	function reset(){
		form.reset();
		alert("정보를 지우고 처음부터 다시 입력합니다");
	}
 	function fromChk(){
		try{
			if(!form[0].value){
				throw '접종예약번호가 입력되지 않았습니다';
				form[0].focus();
			}else if(!form[1].value){
				throw '주민번호가 입력되지 않았습니다';
				form[1].focus();
			}else if(!form[2].value){
				throw '백신코드가 입력되지 않았습니다';
				form[2].focus();
			}else if(!form[3].value){
				throw '병원코드가 입력되지 않았습니다';
				form[3].focus();
			}else if(!form[4].value){
				throw '예약 일자가 입력되지 않았습니다';
				form[4].focus();
			}else if(!form[5].value){
				throw '예약시간이 입력되지 않았습니다';
				form[5].focus();
			}
		}catch(e){
			alert(e);
			return false;
		}
			return true;
	}
</script>
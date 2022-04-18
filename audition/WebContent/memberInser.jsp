<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="./header.jsp" %>
<section id="memberInsert">
	<p class="insertTitle">오디션 등록</p>
	<form action="insert_action.jsp" method="post" name="member">
		<table border="1px" class="insert">
			<tr>
				<td>참가번호</td>
				<td><input type="text" name="num">*참가번호는(A001)4자리입니다</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="b_1">년 <input type="text" name="b_2">월 <input type="text" name="b_3">일</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="sex" value="M">남자
					<input type="radio" name="sex" value="F">여자
				</td>
			</tr>
			<tr>
				<td>특기</td>
				<td>
					<select name="ten">
						<option>특기선택</option>
						<option value="1">보컬</option>
						<option value="2">댄스</option>
						<option value="3">랩</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td><input type="text" name="so"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="addBtn">오디션등록</button>
					<button type="button" class="rewrite">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
</section>
<%@include file ="./footer.jsp" %>
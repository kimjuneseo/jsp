<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<section>
<h2 class="title">접종예약조회</h2>
		<form action="baksin.jsp" method="post">
			<table border="1px">
				<tr>
					<td>예약번호를 입력하시오.</td>
					<td><input type="text" name="num"></td>
				<tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button type="submit">예약조회</button>
						<button><a href="index.jsp">홈으로</a></button>
					</td>
				<tr>
			</table>
		</form>
</section>
<%@ include file="footer.jsp"%>